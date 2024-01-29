import 'product_item.dart';

class PopularProductModel {
  String? msg;
  List<ProductItem>? productList;

  PopularProductModel({this.msg, this.productList});

  PopularProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <ProductItem>[];
      json['data'].forEach((v) {
        productList!.add(ProductItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (productList != null) {
      data['data'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
