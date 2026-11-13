import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/admin/data/data_source/models/product_model.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_cubit.dart';
import 'package:ecommerce_app/feature/admin/presentation/cubits/product_states.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/category_chip.dart';
import 'package:ecommerce_app/feature/admin/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, this.onFinished, this.onProductAdded});

  final VoidCallback? onFinished;
  final ValueChanged<ProductModel>? onProductAdded;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  static const List<String> _categories = ['Timepieces', 'Leather Goods'];

  String selectedCategory = _categories.first;

  ProductModel? _pendingProduct;

  final _sellerIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _nameArabicController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _descriptionArabicController = TextEditingController();
  final _colorController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _coverImageUrlController = TextEditingController();

  List<TextEditingController> get _controllers => [
    _sellerIdController,
    _nameController,
    _nameArabicController,
    _descriptionController,
    _descriptionArabicController,
    _colorController,
    _priceController,
    _stockController,
    _coverImageUrlController,
  ];

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadSellerId();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _clearForm() {
    for (final controller in _controllers) {
      if (controller != _sellerIdController) controller.clear();
    }

    setState(() {
      selectedCategory = _categories.first;
    });
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: context.appColors.adminDangerColor,
      ),
    );
  }

  void _submitProduct(BuildContext context) {
    final name = _nameController.text.trim();
    final nameArabic = _nameArabicController.text.trim();
    final description = _descriptionController.text.trim();
    final descriptionArabic = _descriptionArabicController.text.trim();
    final sellerId = _sellerIdController.text.trim();
    final color = _colorController.text.trim();

    final price = double.tryParse(_priceController.text.trim());
    final stock = int.tryParse(_stockController.text.trim());

    String? error;

    if (sellerId.isEmpty) {
      error = 'Seller ID (UUID) is required by the API.';
    } else if (name.isEmpty) {
      error = 'Please enter product name (EN)';
    } else if (nameArabic.isEmpty) {
      error = 'Please enter Arabic product name';
    } else if (description.isEmpty) {
      error = 'Please enter product description';
    } else if (price == null || price <= 0) {
      error = 'Please enter a valid positive price';
    } else if (stock == null || stock < 0) {
      error = 'Please enter a valid stock quantity';
    }

    if (error != null) {
      _showErrorSnackBar(context, error);
      return;
    }

    final product = ProductModel(
      sellerId: sellerId,
      name: name,
      description: description,
      nameArabic: nameArabic,
      descriptionArabic: descriptionArabic.isNotEmpty
          ? descriptionArabic
          : description,
      coverPictureUrl: _coverImageUrlController.text.trim(),
      price: price!,
      stock: stock!,
      weight: 0,
      color: color.isNotEmpty ? color : 'Standard',
      discountPercentage: 0,
      categoryIds: [],
      productPictureUrls: [],
    );

    _pendingProduct = product;

    context.read<ProductCubit>().addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductStates>(
      listenWhen: (previous, current) =>
          current is AddProductSuccess ||
          current is AddProductFailure ||
          current is SellerIdLoaded,
      listener: (context, state) {
        if (state is SellerIdLoaded) {
          _sellerIdController.text = state.sellerId;
        } else if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          if (_pendingProduct != null) {
            _pendingProduct!.id = state.productId;
            widget.onProductAdded?.call(_pendingProduct!);
            _pendingProduct = null;
          }

          _clearForm();
          widget.onFinished?.call();
        } else if (state is AddProductFailure) {
          _pendingProduct = null;
          _showErrorSnackBar(context, state.errorMessage);
        }
      },
      child: Builder(
        builder: (context) {
          final isLoading =
              context.watch<ProductCubit>().state is AddProductLoading;

          return Scaffold(
            backgroundColor: context.appColors.adminBackgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: context.appColors.adminCardColor,
              elevation: 0,
              title: Text(
                'Add Product',
                style: TextStyle(
                  color: context.appColors.adminForegroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 850),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Information',
                        style: TextStyle(
                          color: context.appColors.adminForegroundColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),

                      CustomTextField(
                        label: 'Seller ID (UUID) *',
                        hint: 'e.g. 123e4567-e89b-12d3-a456-426614174000',
                        controller: _sellerIdController,
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Product Name (EN) *',
                        hint: 'Enter product name',
                        controller: _nameController,
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Product Name (AR) *',
                        hint: 'Enter Arabic product name',
                        controller: _nameArabicController,
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Description (EN) *',
                        hint: 'Enter product description',
                        maxLines: 4,
                        controller: _descriptionController,
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Description (AR)',
                        hint: 'Enter Arabic product description',
                        maxLines: 4,
                        controller: _descriptionArabicController,
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Color',
                        hint: 'e.g. Silver, Black',
                        controller: _colorController,
                      ),
                      const SizedBox(height: 20),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'Price *',
                              hint: 'Price',
                              suffixText: '\$',
                              controller: _priceController,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: CustomTextField(
                              label: 'Stock *',
                              hint: 'Stock',
                              suffixText: 'Units',
                              controller: _stockController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      _buildCoverImageBox(),
                      const SizedBox(height: 15),

                      CustomTextField(
                        label: 'Cover Image URL',
                        hint: 'https://...',
                        controller: _coverImageUrlController,
                      ),
                      const SizedBox(height: 25),

                      Text(
                        'Product Category',
                        style: TextStyle(
                          color: context.appColors.adminGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _categories
                            .map(
                              (category) => CategoryChip(
                                label: category,
                                isSelected: selectedCategory == category,
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 35),

                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => widget.onFinished?.call(),
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    context.appColors.adminForegroundColor,
                                side: BorderSide(
                                  color:
                                      context.appColors.adminStrongBorderColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 15),

                          Expanded(
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => _submitProduct(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    context.appColors.adminGoldColor,
                                foregroundColor:
                                    context.appColors.adminBlackColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: isLoading
                                  ? SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color:
                                            context.appColors.adminBlackColor,
                                      ),
                                    )
                                  : const Text(
                                      'Save Product',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoverImageBox() {
    return ListenableBuilder(
      listenable: _coverImageUrlController,
      builder: (context, _) {
        final url = _coverImageUrlController.text;

        return Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: context.appColors.adminCardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.appColors.adminGoldColor.withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 38,
                color: context.appColors.adminGoldColor,
              ),
              const SizedBox(height: 10),
              Text(
                url.isNotEmpty ? 'Image URL set' : 'Upload Cover Image',
                style: TextStyle(
                  color: context.appColors.adminForegroundColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  url.isNotEmpty ? url : 'PNG, JPG up to 5MB',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.appColors.adminGreyColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
