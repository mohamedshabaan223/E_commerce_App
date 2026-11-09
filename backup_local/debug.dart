// import 'package:ecommerce_app/feature/auth/presentation/screens/Login.dart';
// import 'package:ecommerce_app/feature/auth/presentation/screens/Logout.dart';
// import 'package:ecommerce_app/feature/auth/presentation/screens/VerifyEmail.dart';
// import 'package:ecommerce_app/feature/auth/presentation/screens/signUp.dart';
// import 'package:ecommerce_app/feature/categories/presentation/screens/categories_screen.dart';
// import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
// import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
// import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
// import 'package:ecommerce_app/feature/profile/presentation/screens/screens/profile_screen.dart';
// import 'package:ecommerce_app/feature/cart/presentation/screens/cart_screen.dart';
// import 'package:ecommerce_app/feature/admin/presentation/screens/admin_screens.dart';
// import 'package:ecommerce_app/feature/admin/presentation/screens/add_product_screen.dart';
// import 'package:ecommerce_app/feature/profile/presentation/screens/screens/privacy_policy_screen.dart';
// import 'package:ecommerce_app/feature/profile/presentation/screens/screens/about_us_screen.dart';
// import 'package:ecommerce_app/feature/profile/presentation/screens/screens/contact_us_screen.dart';
// import 'package:ecommerce_app/feature/profile/presentation/screens/screens/notifications_screen.dart';
// import 'package:ecommerce_app/feature/reset_password/presentation/screens/change_password.dart';
// import 'package:ecommerce_app/feature/reset_password/presentation/screens/forget_password.dart';
// import 'package:ecommerce_app/feature/reset_password/presentation/screens/updated_screen.dart';

// import 'package:flutter/material.dart';

// class DebugScreen extends StatelessWidget {
//   const DebugScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screens = <String, Widget Function()>{
//       'Main': () => MainScreen(),
//       'Categories': () => const CategoriesScreen(),
//       'Product Details': () => const ProductDetailsScreen(),
//       'Orders': () => OrderScreen(),
//       'Login': () => const Login(),
//       'Sign Up': () => const SignUp(),
//       'Verify Email': () => const VerifyEmail(),
//       'Logout': () => const Logout(),
//       'Profile': () => const ProfileScreen(),
//       'Privacy Policy': () => const PrivacyPolicyScreen(),
//       'About Us': () => const AboutUsScreen(),
//       'Contact Us': () => const ContactUsScreen(),
//       'Notifications': () => const NotificationsScreen(),
//       'Cart': () => const CartScreen(),
//       'Admin': () => const AdminScreens(),
//       'Add Product': () => const AddProductScreen(),
//       'Change Password': () => const ChangePassword(),
//       'Forget Password': () => const ForgetPassword(),
//       'Updated Screen': () => const Updated(),
//     };

//     return Scaffold(
//       appBar: AppBar(title: const Text('DEBUG')),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: screens.entries.map((e) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => e.value()),
//               ),
//               child: Text(e.key),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
