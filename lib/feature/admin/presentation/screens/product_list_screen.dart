<<<<<<< HEAD
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_cubit.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_states.dart';
=======
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/feature/admin/presentation/screens/add_product_screen.dart';
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
import 'package:ecommerce_app/feature/admin/presentation/widgets/admin_product_card.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/delete_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListcreen extends StatefulWidget {
  const ProductListcreen({
    super.key,
    required this.products,
    this.onAddPressed,
  });

  final List<ProductModel> products;
  final VoidCallback? onAddPressed;

  @override
  State<ProductListcreen> createState() => _ProductListcreenState();
}

class _ProductListcreenState extends State<ProductListcreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductModel> _getFilteredProducts() {
    if (_searchQuery.isEmpty) return widget.products;

    return widget.products.where((product) {
      final title = product.name.toLowerCase();
      final sku = (product.id ?? '').toLowerCase();

      return title.contains(_searchQuery) || sku.contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listenWhen: (previous, current) =>
          current is DeleteProductSuccess || current is DeleteProductFailure,
      listener: (context, state) {
        if (state is DeleteProductSuccess) {
          setState(() {
            widget.products.removeWhere(
              (product) => product.id == state.deletedProductId,
            );
          });

<<<<<<< HEAD
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product deleted successfully'),
              backgroundColor: Color(0xFF1B1B1D),
            ),
          );
        } else if (state is DeleteProductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        final products = _getFilteredProducts();
        final bool isDeleting = state is DeleteProductLoading;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 650;

            return Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isMobile),
                  const SizedBox(height: 28),
                  _buildSearchField(),
                  const SizedBox(height: 24),
                  Expanded(
                    child: _buildProductsGrid(context, products, isDeleting),
                  ),
                ],
              ),
            );
          },
=======
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
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
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
<<<<<<< HEAD
          onPressed: widget.onAddPressed,
          icon: const Icon(Icons.add, color: Colors.black, size: 20),
=======
          onPressed: () => _navigateToAddProduct(context),
          icon: Icon(
            Icons.add,
            color: context.appColors.adminBlackColor,
            size: 20,
          ),
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
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

<<<<<<< HEAD
  Widget _buildSearchField() {
=======
  Widget _buildSearchField(BuildContext context, bool isMobile) {
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
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
                  setState(() {
                    _searchQuery = '';
                  });
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

<<<<<<< HEAD
  Widget _buildProductsGrid(
    BuildContext context,
    List<ProductModel> products,
    bool isDeleting,
  ) {
=======
  Widget _buildProductsGrid(BuildContext context) {
    final products = _filteredProducts;

>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
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

    return Stack(
      children: [
        GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 520,
            mainAxisExtent: 120,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return AdminProductCard(
<<<<<<< HEAD
              title: product.name,
              sku: product.id ?? 'N/A',
              price: product.price,
              oldPrice: null,
              discountTag: product.discountPercentage > 0
                  ? '-${product.discountPercentage}%'
                  : null,
              stockCount: product.stock,
              imageUrl: product.coverPictureUrl,
=======
              title: product['title'],
              sku: product['sku'],
              price: product['price'],
              oldPrice: product['oldPrice'],
              discountTag: product['discountTag'],
              stockCount: product['stockCount'],
              imageUrl: product['imageUrl'],
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
              onDelete: () => _showDeleteDialog(context, product),
              onEdit: () {},
            );
          },
        ),
        if (isDeleting)
          Container(
            color: Colors.black.withValues(alpha: 0.3),
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFFC4B18B)),
            ),
          ),
      ],
    );
  }

<<<<<<< HEAD
  void _showDeleteDialog(BuildContext context, ProductModel product) {
    // Safety rule: Do not delete the existing test product named Etsh.
    if (product.name.trim().toLowerCase() == 'etsh') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Safety rule: Deletion of test product "Etsh" is prohibited.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (product.id == null ||
        product.id!.isEmpty ||
        product.id!.startsWith('PRD-')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot delete: this product has no valid API UUID.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

=======
  void _navigateToAddProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );
  }

  void _showDeleteDialog(BuildContext context, Map<String, dynamic> product) {
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
    showDialog(
      context: context,
      builder: (dialogContext) {
        return DeleteProductDialog(
          productTitle: product.name,
          productSku: product.id ?? 'N/A',
          onDeletePressed: () {
            Navigator.pop(dialogContext);

<<<<<<< HEAD
            context.read<ProductCubit>().deleteProduct(product.id!);
=======
            setState(() {
              _products.remove(product);
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Product deleted successfully'),
                backgroundColor: context.appColors.adminCardColor,
              ),
            );
>>>>>>> 6de6b43fb018c0f72229f58434ede84e7cceb93c
          },
          onCancelPressed: () {
            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }
}
