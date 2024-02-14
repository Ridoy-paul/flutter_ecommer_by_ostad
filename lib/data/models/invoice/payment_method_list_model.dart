import 'payment_method_item.dart';

class PaymentMethodListsModel {
  String? msg;
  List<PaymentMethodRapper>? paymentMethodRapper;

  PaymentMethodListsModel({this.msg, this.paymentMethodRapper});

  PaymentMethodListsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      paymentMethodRapper = <PaymentMethodRapper>[];
      json['data'].forEach((v) {
        paymentMethodRapper!.add(PaymentMethodRapper.fromJson(v));
      });
    }
  }
}
