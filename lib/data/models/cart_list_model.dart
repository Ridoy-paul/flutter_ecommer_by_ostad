import 'cart_list_item.dart';

class CartListModel {
  String? msg;
  List<CartListItem>? cartListItem;

  CartListModel({this.msg, this.cartListItem});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartListItem = <CartListItem>[];
      json['data'].forEach((v) {
        cartListItem!.add(CartListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (cartListItem != null) {
      data['data'] = cartListItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}