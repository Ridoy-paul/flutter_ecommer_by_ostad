import 'package:flutter/material.dart';
import '../../../../data/models/product_review/product_review_item.dart';
import '../home/circle_icon_button_widget.dart';

class ProductReviewItemWidget extends StatelessWidget {
  const ProductReviewItemWidget({super.key, required this.productReviewItem});
  final ProductReviewItem productReviewItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleIconButton(
                  onTap: () {},
                  iconData: Icons.person_outline,
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Text(
                    productReviewItem.profile!.cusName ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Text(productReviewItem.description ?? '')
          ],
        ),
      ),
    );
  }
}
