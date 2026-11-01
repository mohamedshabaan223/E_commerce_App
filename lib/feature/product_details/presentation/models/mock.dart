import 'package:ecommerce_app/feature/product_details/presentation/models/review_model.dart';

abstract class ProductDetailsMock {
  static const int unitPrice = 1850;

  static const String appBarTitle = 'Chronographe Noir';
  static const String title = 'Chronographe\nNoir 41mm';
  static const String price = '\$1,850';
  static const String oldPrice = '\$2,180';
  static const String discount = '-15% OFF';
  static const double rating = 4.9;
  static const int reviewsCount = 42;

  static const String description =
      'Precision automatic chronograph featuring a matte black dial, sapphire crystal glass, and genuine leather strap. Water resistant to 100 meters.';

  static const Map<String, String> specs = {
    'Color': 'Black',
    'Weight (g)': '120',
    'Stock': 'In stock: 12',
  };

  static const List<String> images = [
    'assets/images/product_monochrome_chrono.png',
    'assets/images/category_watches_large.png',
    'assets/images/product_classic_chrono_dial.png',
    'assets/images/product_gold_crown_timepiece.png',
  ];

  static const List<ReviewModel> reviews = [
    ReviewModel(
      name: 'Arthur L.',
      initials: 'AL',
      date: 'Oct 14, 2024',
      rating: 5.0,
      comment: 'Exceptional craftsmanship and precision. The dial texture in direct daylight is remarkably striking.',
    ),
    ReviewModel(
      name: 'Elena V.',
      initials: 'EV',
      date: 'Sep 29, 2024',
      rating: 5.0,
      comment: 'Balanced weight and beautiful champagne tone. Comfortable strap right out of the box.',
    ),
    ReviewModel(
      name: 'Marcus R.',
      initials: 'MR',
      date: 'Sep 12, 2024',
      rating: 5.0,
      comment: 'Superb timekeeping accuracy and flawless finishing. Highly recommended for daily wear.',
    ),
  ];
}
