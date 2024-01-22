
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Row(
        children: [
          Image.asset(
            'assets/images/shoe.png',
            width: 100,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Year  Shoe New Year",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray,
                            ),
                          ),
                          Text("Color: Red, Size: x"),
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.black54,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("\$1000", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
                      ],
                    ),
                    ValueListenableBuilder(
                        valueListenable: noOfItem,
                        builder: (context, value, _) {
                          return ItemCount(
                            color: AppColors.primaryColor,
                            initialValue: value,
                            minValue: 1,
                            maxValue: 100,
                            decimalPlaces: 0,
                            onChanged: (v) {
                              noOfItem.value = v.toInt();
                            },
                          );
                        }
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