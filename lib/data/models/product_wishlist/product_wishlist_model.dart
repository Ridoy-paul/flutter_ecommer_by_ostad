import 'product_wishlist_item_model.dart';

class ProductWishlistModel {
  String? msg;
  List<ProductWishlistItem>? productWishlistItem;

  ProductWishlistModel({this.msg, this.productWishlistItem});

  ProductWishlistModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productWishlistItem = <ProductWishlistItem>[];
      json['data'].forEach((v) {
        productWishlistItem!.add(ProductWishlistItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productWishlistItem != null) {
      data['data'] = productWishlistItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}