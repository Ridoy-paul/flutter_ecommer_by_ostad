import 'package:flutter/material.dart';
import 'main_bottom_nav_screen.dart';
import 'package:get/get.dart';

class CreateProductReviewScreen extends StatefulWidget {
  const CreateProductReviewScreen({super.key});

  @override
  State<CreateProductReviewScreen> createState() => _CreateProductReviewScreenState();
}

class _CreateProductReviewScreenState extends State<CreateProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Get.back(),
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
              child: Column(
                children: [
                  SizedBox(height: Get.height * .02,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  const SizedBox(height: 8,),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Write Review',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                  ),
                  const SizedBox(height: 8,),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => const MainBottomNavScreen());
                      },
                      child: const Text("Next"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
