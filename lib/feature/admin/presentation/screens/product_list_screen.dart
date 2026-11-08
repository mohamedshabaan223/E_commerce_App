import 'package:ecommerce_app/feature/home/data/models/product_model.dart';
import 'package:ecommerce_app/feature/home/presentation/cubits/product_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/cubits/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/feature/admin/presentation/screens/add_product_screen.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/admin_product_card.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/delete_product.dart';

class ProductListcreen extends StatefulWidget {
  const ProductListcreen({super.key, required this.products});

  final List<ProductModel> products;

  @override
  State<ProductListcreen> createState() => _ProductListcreenState();
}

class _ProductListcreenState extends State<ProductListcreen> {
  final TextEditingController _searchController = TextEditingController();

  late List<ProductModel> _products;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _products = List.of(widget.products);
  }

  @override
  void didUpdateWidget(covariant ProductListcreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.products != widget.products) {
      _products = List.of(widget.products);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductModel> _getFilteredProducts() {
    if (_searchQuery.isEmpty) return _products;

    return _products.where((product) {
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
            _products.removeWhere((p) => p.id == state.deletedProductId);
          });
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
                  _buildHeader(isMobile, context),
                  const SizedBox(height: 28),
                  _buildSearchField(isMobile),
                  const SizedBox(height: 24),
                  Expanded(
                    child: _buildProductsGrid(context, products, isDeleting),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeader(bool isMobile, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Products Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 20 : 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: () => _navigateToAddProduct(context),
          icon: const Icon(Icons.add, color: Colors.black, size: 20),
          label: Text(
            isMobile ? 'Add' : 'Add Product',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC4B18B),
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

  Widget _buildSearchField(bool isMobile) {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {
          _searchQuery = value.trim().toLowerCase();
        });
      },
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Search products by name or SKU...',
        hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                icon: const Icon(Icons.close, color: Colors.grey),
              )
            : null,
        filled: true,
        fillColor: const Color(0xFF1B1B1D),
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
          borderSide: const BorderSide(color: Color(0xFFC4B18B), width: 1),
        ),
      ),
    );
  }

  Widget _buildProductsGrid(
    BuildContext context,
    List<ProductModel> products,
    bool isDeleting,
  ) {
    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 60, color: Colors.grey[700]),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty
                  ? 'No products available'
                  : 'No products found',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isEmpty
                  ? 'Add your first product to get started.'
                  : 'Try searching with another name or SKU.',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
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
              title: product.name,
              sku: product.id ?? 'N/A',
              price: product.price,
              oldPrice: null,
              discountTag: product.discountPercentage > 0
                  ? '-${product.discountPercentage}%'
                  : null,
              stockCount: product.stock,
              imageUrl: product.coverPictureUrl,
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

  void _navigateToAddProduct(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(value: cubit, child: const AddProductScreen()),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, ProductModel product) {
    // Safety rule: Do not delete the existing test product named Etsh
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

    showDialog(
      context: context,
      builder: (dialogContext) {
        return DeleteProductDialog(
          productTitle: product.name,
          productSku: product.id ?? 'N/A',
          onDeletePressed: () {
            Navigator.pop(dialogContext);
            context.read<ProductCubit>().deleteProduct(product.id!);
          },
          onCancelPressed: () {
            Navigator.pop(dialogContext);
          },
        );
      },
    );
  }
}
