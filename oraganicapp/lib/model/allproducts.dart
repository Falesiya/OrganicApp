class Product {
  final int id;
  final String name;
  final String image;
  final String description;

  final double price;
  late int quantity = 0;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
