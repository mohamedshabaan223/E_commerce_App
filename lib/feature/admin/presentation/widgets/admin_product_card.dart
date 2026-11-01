import 'package:flutter/material.dart';

class AdminProductCard extends StatelessWidget {
  final String title;
  final String sku;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final int stockCount;
  final String? discountTag;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const AdminProductCard({
    super.key,
    required this.title,
    required this.sku,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.stockCount,
    this.discountTag,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOutOfStock = stockCount <= 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B1D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70,
                  height: 70,
                  color: Colors.grey[850],
                  child: const Icon(Icons.image_outlined, color: Colors.grey),
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined),
                      color: Colors.grey,
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),

                    const SizedBox(width: 12),

                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_outline),
                      color: Colors.redAccent,
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  sku,
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFFC4B18B),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (oldPrice != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        '\$${oldPrice!.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],

                    if (discountTag != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        discountTag!,
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],

                    const Spacer(),

                    Flexible(
                      child: Text(
                        isOutOfStock ? 'Out of stock' : '$stockCount in stock',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: isOutOfStock
                              ? Colors.redAccent
                              : Colors.grey[400],
                          fontSize: 10,
                        ),
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
}
