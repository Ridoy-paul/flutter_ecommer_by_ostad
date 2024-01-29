import 'slider_list.dart';

class HomeScreenSliderListModel {
  String? msg;
  List<SliderItem>? sliderList;

  HomeScreenSliderListModel({this.msg, this.sliderList});

  HomeScreenSliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <SliderItem>[];
      json['data'].forEach((v) {
        sliderList!.add(SliderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (sliderList != null) {
      data['data'] = sliderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

