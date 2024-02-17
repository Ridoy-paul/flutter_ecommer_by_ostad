
import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/cart_list_controller.dart';
import 'package:get/get.dart';
import '../../../data/models/cart_list_item.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key, required this.cartListItem, required this.onRemoveCartItem});

  final CartListItem cartListItem;
  final Function(bool) onRemoveCartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late int cartQty;
  late ValueNotifier<int> noOfItem;

  @override
  void initState() {
    super.initState();
    cartQty = int.tryParse((widget.cartListItem.qty ?? 1) as String) ?? 1;
    noOfItem = ValueNotifier(cartQty);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Row(
        children: [
          Image.network(
            widget.cartListItem.product!.image ?? '',
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
                            widget.cartListItem.product!.title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray,
                            ),
                          ),
                          Text("Color: ${widget.cartListItem.color ?? ''}, Size: ${widget.cartListItem.size ?? ''}"),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        widget.onRemoveCartItem(true);
                      },
                      icon: const Icon(
                        Icons.delete_outlined,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("\$${widget.cartListItem.price ?? 0}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
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
                              Get.find<CartListController>().updateCartQuantity(widget.cartListItem.id!, v.toInt());
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