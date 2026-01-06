import 'package:cargo/model/product_model.dart';
import 'package:dio/dio.dart';

class MyProductService {
   final String url = 'https://fakestoreapi.com/products';
   final Dio dio = Dio();
   
   Future<List<MyProductModel>> fetchProducts() async {
     try {
       final response = await dio.get(url);
       if (response.statusCode ==200) {
         final List data= response.data;
          return data.map((json) => MyProductModel.fromJson(json)).toList();
       }else{
        throw Exception('Failed to load products');
       }
     } catch (e) {
       throw Exception('Failed to load products: $e');
     }
   }
}