import 'category_item.dart';

class CategoryListModel {
  String? msg;
  List<CategoryItem>? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryItem>[];
      json['data'].forEach((v) {
        categoryList!.add(CategoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryList != null) {
      data['data'] = categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

