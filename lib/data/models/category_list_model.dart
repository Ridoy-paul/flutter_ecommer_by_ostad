import 'category_item.dart';

class CategoryListModel {
  String? msg;
  List<CategoryItem>? data;

  CategoryListModel({this.msg, this.data});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CategoryItem>[];
      json['data'].forEach((v) {
        data!.add(CategoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

