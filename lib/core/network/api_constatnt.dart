// core/network/api_constatnt.dart
abstract class ApiConstatnt {
  static const String baseUrl = 'https://accessories-eshop.runasp.net/api/';

  static const String refreshTokenEndPoint = 'auth/refresh-token';
  static const String signInEndPoint = 'auth/login';
  static const String changePasswordEndPoint = 'auth/change-password';
  static const String googleMobileEndPoint = 'auth/google/mobile';
  static const String signUpEndPoint = 'auth/register';
  static const String getCartEndPoint = 'cart';
  static const String addToCartEndPoint = 'cart/items';
  static const String decrementCartItemEndPoint = 'cart/items/decrement';

  static String deleteCartItemEndPoint(String itemId) => 'cart/items/$itemId';

  static const String applyCouponEndPoint = 'cart/apply-coupon';

  // Reviews: GET + POST -> reviews/{productId}
  static String productReviewsEndPoint(String productId) =>
      'reviews/$productId';

  static const String registerResponseMessage =
      'Registeration Successfull, an otp is sent to your email inbox please use it to verify your email.';
  static const String verifiyEmailEndPoint = 'auth/verify-email';
  static const String verifiyOtpEndPoint = 'auth/validate-otp';
  static const String getProductsEndPoint = 'products';
  static const String addProductEndPoint = 'products';
  static const String deleteProductEndPoint = 'products/';
}
