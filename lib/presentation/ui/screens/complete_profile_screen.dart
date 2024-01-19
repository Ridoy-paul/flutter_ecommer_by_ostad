import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/verify_otp_screen.dart';
import '../widgets/app_logo.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: Get.height * .02,),
                  const AppLogoWidget(),
                  const SizedBox(height: 16,),
                  Text("Complete Profile", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 5,),
                  Text("Get started with us with your details", style: Theme.of(context).textTheme.bodyLarge,),
                  const SizedBox(height: 16,),
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
                      hintText: 'Mobile',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Shipping Address',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8,),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const VerifyOTPScreen());
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
