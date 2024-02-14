import '../../../data/models/invoice/payment_method_list_model.dart';
import 'package:get/get.dart';

import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  PaymentMethodListsModel _paymentMethodListsModel = PaymentMethodListsModel();
  PaymentMethodListsModel get paymentMethodListsModel => _paymentMethodListsModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getPaymentInfo() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.invoiceCreate,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _paymentMethodListsModel = PaymentMethodListsModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}