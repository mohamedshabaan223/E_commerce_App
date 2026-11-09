import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/feature/admin/presentation/screens/add_product_screen.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/admin_product_card.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/delete_product.dart';

class ProductListcreen extends StatefulWidget {
  const ProductListcreen({
    super.key,
    required List<Map<String, dynamic>> products,
  });

  @override
  State<ProductListcreen> createState() => _ProductListcreenState();
}

class _ProductListcreenState extends State<ProductListcreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  final List<Map<String, dynamic>> _products = [
    {
      'title': 'Chronographe Noir 41mm',
      'sku': 'PRD-8921',
      'price': 1250.00,
      'oldPrice': 1470.00,
      'discountTag': '-15%',
      'stockCount': 14,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-vrmIJ0QjwcZgmqFJ9etFAVdKyR3idJZmaKVqtcSMyA&s=10',
    },
    {
      'title': 'Signet Ring 18K Gold',
      'sku': 'PRD-4410',
      'price': 480.00,
      'stockCount': 14,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzo2eogdvWBSEKEwalJA2WCsqlhL_jsviQOdfqzDShaQ&s=10',
    },
    {
      'title': 'Italian Leather Bifold',
      'sku': 'PRD-3309',
      'price': 320.00,
      'stockCount': 14,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeCp0B6kpp61lqLW30SCb4AhtPTEEq92pPXak9e0z_bw&s=10',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredProducts {
    if (_searchQuery.isEmpty) return _products;

    return _products.where((product) {
      final title = product['title'].toString().toLowerCase();
      final sku = product['sku'].toString().toLowerCase();

      return title.contains(_searchQuery) || sku.contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 650;

        return Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, isMobile),
              const SizedBox(height: 28),
              _buildSearchField(context, isMobile),
              const SizedBox(height: 24),
              Expanded(child: _buildProductsGrid(context)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Products Overview',
            style: TextStyle(
              color: context.appColors.adminForegroundColor,
              fontSize: isMobile ? 20 : 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: () => _navigateToAddProduct(context),
          icon: Icon(
            Icons.add,
            color: context.appColors.adminBlackColor,
            size: 20,
          ),
          label: Text(
            isMobile ? 'Add' : 'Add Product',
            style: TextStyle(
              color: context.appColors.adminBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.appColors.adminGoldColor,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 20,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context, bool isMobile) {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {
          _searchQuery = value.trim().toLowerCase();
        });
      },
      style: TextStyle(
        color: context.appColors.adminForegroundColor,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: 'Search products by name or SKU...',
        hintStyle: TextStyle(
          color: context.appColors.adminMutedColor,
          fontSize: 13,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: context.appColors.adminInactiveColor,
        ),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                icon: Icon(
                  Icons.close,
                  color: context.appColors.adminMutedColor,
                ),
              )
            : null,
        filled: true,
        fillColor: context.appColors.adminCardColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.appColors.adminGoldColor,
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildProductsGrid(BuildContext context) {
    final products = _filteredProducts;

    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 60,
              color: context.appColors.adminVeryMutedColor,
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty
                  ? 'No products available'
                  : 'No products found',
              style: TextStyle(
                color: context.appColors.adminLabelColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isEmpty
                  ? 'Add your first product to get started.'
                  : 'Try searching with another name or SKU.',
              style: TextStyle(
                color: context.appColors.adminMutedColor,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 520,
            mainAxisExtent: 120,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return AdminProductCard(
              title: product['title'],
              sku: product['sku'],
              price: product['price'],
              oldPrice: product['oldPrice'],
              discountTag: product['discountTag'],
              stockCount: product['stockCount'],
              imageUrl: product['imageUrl'],
              onDelete: () => _showDeleteDialog(context, product),
              onEdit: () {},
            );
          },
        );
      },
    );
  }

  void _navigateToAddProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );
  }

  void _showDeleteDialog(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return DeleteProductDialog(
          productTitle: product['title'],
          productSku: product['sku'],
          onDeletePressed: () {
            Navigator.pop(dialogContext);

            setState(() {
              _products.remove(product);
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Product deleted successfully'),
                backgroundColor: context.appColors.adminCardColor,
              ),
            );
          },
          onCancelPressed: () {
            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }
}
