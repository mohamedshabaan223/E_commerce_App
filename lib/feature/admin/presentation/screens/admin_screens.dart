import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/remote/admin_remote_data_source.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_product_screen.dart';
import 'product_list_screen.dart';

class AdminScreens extends StatefulWidget {
  const AdminScreens({super.key});

  @override
  State<AdminScreens> createState() => _AdminScreensState();
}

class _AdminScreensState extends State<AdminScreens> {
  int _currentIndex = 0;

  // المنتجات التي تمت إضافتها من شاشة Admin فقط
  final List<ProductModel> _products = [];

  static const Color backgroundColor = Color(0xFF121212);
  static const Color sidebarColor = Color(0xFF1B1B1D);
  static const Color goldColor = Color(0xFFC4B18B);

  void _goTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // استقبال المنتج بعد نجاح الإضافة
  void _addProduct(ProductModel product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(AdminRemoteDataSource()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 650;

          final pages = <Widget>[
            ProductListcreen(products: _products, onAddPressed: () => _goTo(1)),

            AddProductScreen(
              onProductAdded: _addProduct,
              onFinished: () => _goTo(0),
            ),
          ];

          return Scaffold(
            backgroundColor: backgroundColor,
            drawer: isMobile
                ? Drawer(
                    backgroundColor: sidebarColor,
                    child: _buildSidebar(isMobile),
                  )
                : null,
            appBar: isMobile
                ? AppBar(
                    backgroundColor: sidebarColor,
                    iconTheme: const IconThemeData(color: goldColor),
                    title: const Text(
                      'LUXE Admin',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Serif',
                      ),
                    ),
                  )
                : null,
            body: Row(
              children: [
                if (!isMobile)
                  SizedBox(width: 250, child: _buildSidebar(isMobile)),
                Expanded(
                  child: IndexedStack(index: _currentIndex, children: pages),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSidebar(bool isMobile) {
    return Container(
      color: sidebarColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(Icons.diamond_outlined, color: goldColor, size: 28),
                SizedBox(width: 12),
                Text(
                  'LUXE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'ADMIN PANEL',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white12),
          const SizedBox(height: 12),

          _buildSidebarItem(
            icon: Icons.inventory_2_outlined,
            label: 'Products',
            index: 0,
            isMobile: isMobile,
          ),

          _buildSidebarItem(
            icon: Icons.add_box_outlined,
            label: 'Add Product',
            index: 1,
            isMobile: isMobile,
          ),

          const Spacer(),

          const Divider(color: Colors.white12),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: goldColor,
                  child: Icon(Icons.person, color: Colors.black, size: 20),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Administrator',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Store Manager',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isMobile,
  }) {
    final bool isSelected = _currentIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        selected: isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selectedTileColor: goldColor.withValues(alpha: 0.12),
        leading: Icon(icon, color: isSelected ? goldColor : Colors.grey[500]),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected ? goldColor : Colors.grey[400],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        onTap: () {
          _goTo(index);

          if (isMobile) {
            Navigator.maybePop(context);
          }
        },
      ),
    );
  }
}
