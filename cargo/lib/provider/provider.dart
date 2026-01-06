import 'package:cargo/model/product_model.dart';
import 'package:cargo/service/product_service.dart';
import 'package:flutter/material.dart';

class Myprovider extends  ChangeNotifier {
  final MyProductService service =MyProductService();
  List<MyProductModel> products =[];
  bool isLoading = false;

  Future<void> getProducts()async{
    isLoading = true;
    notifyListeners();
    try {
      products = await service.fetchProducts();
      print('Products fetched: ${products.length}');
    } catch (e) {
      throw Exception('Error while fetching products: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}