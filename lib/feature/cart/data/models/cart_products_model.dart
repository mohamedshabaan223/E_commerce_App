class CartProductsModel {
  final String image;
  final String name;
  final double price;

  CartProductsModel({
    required this.image,
    required this.name,
    required this.price,
  });

  static final List<CartProductsModel> cartProductsDetails = [
    CartProductsModel(
      image: 'assets/images/category_watches.png',
      name: 'Minimalist Chronograph Noir',
      price: 240.00,
    ),
    CartProductsModel(
      image: 'assets/images/category_rings.png',
      name: 'Gold Signet Ring',
      price: 180.00,
    ),
  ];
}