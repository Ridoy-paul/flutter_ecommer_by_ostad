import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/create_product_review_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/utility/helpers.dart';
import '../utility/show_snack_message.dart';
import 'main_bottom_nav_screen.dart';
import 'package:get/get.dart';

class CreateProductReviewScreen extends StatefulWidget {
  const CreateProductReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<CreateProductReviewScreen> createState() =>
      _CreateProductReviewScreenState();
}

class _CreateProductReviewScreenState extends State<CreateProductReviewScreen> {

  final CreateProductReviewController _createProductReviewController = CreateProductReviewController();

  double _rating = 3.0;
  final TextEditingController _reviewDetailsTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Create Review",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .02,),
                    Row(
                      children: [
                        const Text("Rating", style: TextStyle(fontSize: 24,
                            fontWeight: FontWeight.w500),),
                        RatingBar.builder(
                          initialRating: _rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                              horizontal: 4.0),
                          itemBuilder: (context, _) =>
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {
                            _rating = value;
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: _reviewDetailsTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Review Description!"),
                      decoration: const InputDecoration(
                        hintText: 'Write Review',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 7,
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<CreateProductReviewController>(builder: (controller) {
                        return Visibility(
                          visible: !controller.inProgressStatus,
                          replacement: circleProgressIndicatorShow(),
                          child: ElevatedButton(
                            onPressed: () => _confirmReviewSubmit,
                            child: const Text("Next"),
                          ),
                        );
                      },),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmReviewSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final bool response = await _createProductReviewController.submitReviewData(
        _reviewDetailsTEController.text.trim(), widget.productId, _rating);

    if (response) {
      //Get.offAll(() => const MainBottomNavScreen());
      showSnackMessage("Review Saved!");
    } else {
      showSnackMessage(_createProductReviewController.message, false);
    }
  }

  @override
  void dispose() {
    _reviewDetailsTEController.dispose();
    super.dispose();
  }
}
