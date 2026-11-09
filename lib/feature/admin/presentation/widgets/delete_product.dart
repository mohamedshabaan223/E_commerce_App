import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';

class DeleteProductDialog extends StatelessWidget {
  final String productTitle;
  final String productSku;
  final VoidCallback onDeletePressed;
  final VoidCallback onCancelPressed;

  const DeleteProductDialog({
    super.key,
    required this.productTitle,
    required this.productSku,
    required this.onDeletePressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.appColors.adminCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete_outline,
                color: context.appColors.adminDangerColor,
                size: 40,
              ),

              const SizedBox(height: 16),

              Text(
                'Delete Product?',
                style: TextStyle(
                  color: context.appColors.adminForegroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Are you sure you want to delete this product? '
                'This action cannot be undone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.appColors.adminLabelColor,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.appColors.adminBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle,
                      style: TextStyle(
                        color: context.appColors.adminForegroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      productSku,
                      style: TextStyle(
                        color: context.appColors.adminMutedColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: onDeletePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        context.appColors.adminDangerBackgroundColor,
                    foregroundColor: context.appColors.adminForegroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton(
                  onPressed: onCancelPressed,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: context.appColors.adminStrongBorderColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: context.appColors.adminLabelColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
