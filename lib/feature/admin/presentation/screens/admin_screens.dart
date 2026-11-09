import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

import 'add_product_screen.dart';
import 'product_list_screen.dart';

class AdminScreens extends StatefulWidget {
  const AdminScreens({super.key});

  @override
  State<AdminScreens> createState() => _AdminScreensState();
}

class _AdminScreensState extends State<AdminScreens> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ProductListcreen(products: []),
    AddProductScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 650;

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
          ),

          _buildSidebarItem(
            context: context,
            icon: Icons.add_box_outlined,
            label: 'Add Product',
            index: 1,
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
          setState(() {
            _currentIndex = index;
          });

          Navigator.maybePop(context);
        },
      ),
    );
  }
}
