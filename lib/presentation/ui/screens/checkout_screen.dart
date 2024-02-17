import 'package:flutter/material.dart';
import 'payment_webview_screen.dart';
import '../../state_holders/invoice/create_invoice_controller.dart';
import '../../../data/utility/helpers.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    Get.find<CreateInvoiceController>().getPaymentInfo();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.back();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Checkout",
            style: TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: GetBuilder<CreateInvoiceController>(builder: (controller) {
            if(controller.inProgressStatus) {
              return circleProgressIndicatorShow();
            }

            final invoiceRapper = controller.paymentMethodListsModel.paymentMethodRapper!.first;

            return Visibility(
              visible: !controller.inProgressStatus,
              replacement: circleProgressIndicatorShow(),
              child: Column(
                children: [
                  totalPriceSection(invoiceRapper.payable!.toInt() ?? 0, invoiceRapper.vat!.toInt() ?? 0, invoiceRapper.total!.toInt() ?? 0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        itemCount: invoiceRapper.paymentMethodList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => PaymentWebViewScreen(url: invoiceRapper.paymentMethodList![index].redirectGatewayURL!),);
                            },
                            borderRadius: BorderRadius.circular(18),
                            child: Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: Image.network(invoiceRapper.paymentMethodList![index].logo ?? ''),
                                  title: Text(invoiceRapper.paymentMethodList![index].name ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) =>
                        const SizedBox(
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Container totalPriceSection(int payable, int vat, int total) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.16),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payable",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$$payable",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "VAT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$$vat",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$$total",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


