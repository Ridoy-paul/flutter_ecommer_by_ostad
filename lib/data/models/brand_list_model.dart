import 'brand_item.dart';

class BrandListModel {
  String? msg;
  List<BrandItem>? brandItemList;

  BrandListModel({this.msg, this.brandItemList});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      brandItemList = <BrandItem>[];
      json['data'].forEach((v) {
        brandItemList!.add(BrandItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (brandItemList != null) {
      data['data'] = brandItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
