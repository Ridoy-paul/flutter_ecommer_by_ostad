import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/data/utility/helpers.dart';
import 'verify_otp_screen.dart';
import '../../widgets/app_logo.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final TextEditingController _emailTEController = TextEditingController();

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
                  SizedBox(height: Get.height * .1,),
                  const AppLogoWidget(),
                  const SizedBox(height: 16,),
                  Text("Welcome back", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 5,),
                  Text("Please Enter Your Email Address", style: Theme.of(context).textTheme.bodySmall,),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) => inputValidate(value, "Email is required!"),
                  ),
                  const SizedBox(height: 16,),
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
