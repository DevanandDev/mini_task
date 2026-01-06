class MyProductModel {
  final String title;
  final double price;
  final String image;

  MyProductModel({
    required this.title,
    required this.price,
    required this.image,
  });

  factory MyProductModel.fromJson(Map<String, dynamic> json) {
    return MyProductModel(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
    );
  }
}
