<<<<<<< HEAD
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/remote/admin_remote_data_source.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_cubit.dart';
=======
import 'package:ecommerce_app/core/utils/colors_manger.dart';
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
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

<<<<<<< HEAD
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

=======
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(AdminRemoteDataSource()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 650;

<<<<<<< HEAD
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
=======
        return Scaffold(
          backgroundColor: context.appColors.adminBackgroundColor,
          drawer: isMobile
              ? Drawer(
                  backgroundColor: context.appColors.adminCardColor,
                  child: _buildSidebar(context),
                )
              : null,
          appBar: isMobile
              ? AppBar(
                  backgroundColor: context.appColors.adminCardColor,
                  iconTheme: IconThemeData(
                    color: context.appColors.adminGoldColor,
                  ),
                  title: Text(
                    'LUXE Admin',
                    style: TextStyle(
                      color: context.appColors.adminForegroundColor,
                      fontFamily: 'Serif',
                    ),
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                SizedBox(width: 250, child: _buildSidebar(context)),
              Expanded(
                child: IndexedStack(index: _currentIndex, children: _pages),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSidebar(BuildContext context) {
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
    return Container(
      color: context.appColors.adminCardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(
                  Icons.diamond_outlined,
                  color: context.appColors.adminGoldColor,
                  size: 28,
                ),
                SizedBox(width: 12),
                Text(
                  'LUXE',
                  style: TextStyle(
                    color: context.appColors.adminForegroundColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'ADMIN PANEL',
              style: TextStyle(
                color: context.appColors.adminGreyColor,
                fontSize: 10,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: context.appColors.adminBorderColor),
          const SizedBox(height: 12),

          _buildSidebarItem(
            context: context,
            icon: Icons.inventory_2_outlined,
            label: 'Products',
            index: 0,
            isMobile: isMobile,
          ),

          _buildSidebarItem(
            context: context,
            icon: Icons.add_box_outlined,
            label: 'Add Product',
            index: 1,
            isMobile: isMobile,
          ),

          const Spacer(),

          Divider(color: context.appColors.adminBorderColor),

          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: context.appColors.adminGoldColor,
                  child: Icon(
                    Icons.person,
                    color: context.appColors.adminBlackColor,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Administrator',
                      style: TextStyle(
                        color: context.appColors.adminForegroundColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Store Manager',
                      style: TextStyle(
                        color: context.appColors.adminGreyColor,
                        fontSize: 10,
                      ),
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
    required BuildContext context,
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
        selectedTileColor: context.appColors.adminGoldColor.withValues(
          alpha: 0.12,
        ),
        leading: Icon(
          icon,
          color: isSelected
              ? context.appColors.adminGoldColor
              : context.appColors.adminInactiveColor,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? context.appColors.adminGoldColor
                : context.appColors.adminLabelColor,
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
