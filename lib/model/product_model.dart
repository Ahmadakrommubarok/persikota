class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String> availableSizes;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.availableSizes,
  });
}
