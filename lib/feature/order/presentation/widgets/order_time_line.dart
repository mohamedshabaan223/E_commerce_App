import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;
  final bool isCurrent;
  const OrderTimelineTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isFirst = false,
    this.isLast = false,
    required this.isCompleted,
    this.isCurrent = false,
  });
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isCompleted ? ColorsManger.primaryColor : ColorsManger.darkGrey,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 30,
        indicator: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? ColorsManger.primaryColor
                : ColorsManger.darkGrey,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.black)
                : Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCurrent ? Colors.black : ColorsManger.darkGrey,
                    ),
                  ),
          ),
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 7.0, top: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isCompleted || isCurrent
                    ? Colors.white
                    : ColorsManger.passwordColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: isCompleted || isCurrent
                    ? Colors.grey.withAlpha(240)
                    : Colors.grey.withAlpha(200),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
