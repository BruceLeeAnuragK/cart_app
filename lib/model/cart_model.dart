import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  static RxInt qty = 0.obs;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromMap({required Map data}) {
    return Product(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      price: data["price"],
      discountPercentage: data["discountPercentage"]?.toDouble(),
      rating: data["rating"]?.toDouble(),
      stock: data["stock"],
      brand: data["brand"],
      category: data["category"],
      thumbnail: data["thumbnail"],
      images: List<String>.from(data["images"].map((x) => x)),
    );
  }
}

class Counter {
  RxInt counter = 0.obs;
  RxList buttonList = [].obs;
}
