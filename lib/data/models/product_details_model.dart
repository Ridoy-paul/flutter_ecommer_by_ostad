import 'product_details_data.dart';

class ProductDetailsModel {
  String? msg;
  List<ProductDetailsData>? productDetailsData;

  ProductDetailsModel({this.msg, this.productDetailsData});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetailsData = <ProductDetailsData>[];
      json['data'].forEach((v) {
        productDetailsData!.add(ProductDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productDetailsData != null) {
      data['data'] = productDetailsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

