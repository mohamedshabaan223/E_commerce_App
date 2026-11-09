import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String selectedCategory = 'Timepieces';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.adminBackgroundColor,
      appBar: AppBar(
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

                _buildLabel(context, 'Product Name (EN)'),
                _buildTextField(context, 'Enter product name'),

                const SizedBox(height: 20),

                _buildLabel(context, 'Product Name (AR)'),
                _buildTextField(context, 'Enter Arabic product name'),

                const SizedBox(height: 20),

                _buildLabel(context, 'Description (EN)'),
                _buildTextField(
                  context,
                  'Enter product description',
                  maxLines: 4,
                ),

                const SizedBox(height: 20),

                _buildLabel(context, 'Price and Stock'),

                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        context,
                        'Price',
                        suffixText: '\$',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildTextField(
                        context,
                        'Stock',
                        suffixText: 'Units',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                _buildLabel(context, 'Cover Image'),

                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: context.appColors.adminCardColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.appColors.adminGoldColor.withValues(
                        alpha: 0.4,
                      ),
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
                      SizedBox(height: 10),
                      Text(
                        'Upload Cover Image',
                        style: TextStyle(
                          color: context.appColors.adminForegroundColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'PNG, JPG up to 5MB',
                        style: TextStyle(
                          color: context.appColors.adminGreyColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                _buildLabel(context, 'Product Category'),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildCategoryChip(context, 'Timepieces'),
                    _buildCategoryChip(context, 'Leather Goods'),
                  ],
                ),

                const SizedBox(height: 35),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              context.appColors.adminForegroundColor,
                          side: BorderSide(
                            color: context.appColors.adminStrongBorderColor,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'This is a UI preview. Product is not saved.',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.appColors.adminGoldColor,
                          foregroundColor: context.appColors.adminBlackColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Save Product',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          color: context.appColors.adminForegroundColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String hint, {
    int maxLines = 1,
    String? suffixText,
  }) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(color: context.appColors.adminForegroundColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: context.appColors.adminMutedColor),
        suffixText: suffixText,
        suffixStyle: TextStyle(color: context.appColors.adminGoldColor),
        filled: true,
        fillColor: context.appColors.adminCardColor,
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: context.appColors.adminBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: context.appColors.adminGoldColor),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String category) {
    final bool isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.adminGoldColor
              : context.appColors.adminCardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? context.appColors.adminGoldColor
                : context.appColors.adminStrongBorderColor,
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected
                ? context.appColors.adminBlackColor
                : context.appColors.adminForegroundColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
