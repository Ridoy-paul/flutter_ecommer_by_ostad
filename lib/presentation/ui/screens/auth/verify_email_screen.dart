import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/data/utility/helpers.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/send_email_otp_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/show_snack_message.dart';
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
  final GlobalKey<FormState> _emailValidationFormKey = GlobalKey<FormState>();
  final _sendEmailOTPController = Get.find<SendEmailOTPController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Form(
                key: _emailValidationFormKey,
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .1,),
                    const AppLogoWidget(),
                    const SizedBox(height: 16,),
                    Text("Welcome back", style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,),
                    const SizedBox(height: 5,),
                    Text("Please Enter Your Email Address", style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      //validator: (value) => inputValidate(value, "Enter your email!"),
                      validator: (value) {
                        if (value!.trim().isEmpty ?? true) {
                          return "Enter your email!";
                        }
                        if (!value.isEmail) {
                          return "Please Enter Valid Email!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    GetBuilder<SendEmailOTPController>(builder: (controller) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: !controller.inProgressStatus,
                          replacement: circleProgressIndicatorShow(),
                          child: ElevatedButton(
                            onPressed: _emailValidationConfirm,
                            child: const Text("Next"),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _emailValidationConfirm() async {
    if(!_emailValidationFormKey.currentState!.validate()) {
      return;
    }

    final responseResult = await _sendEmailOTPController.sendEmailOTP(_emailTEController.text.trim());
    if(responseResult) {
      Get.to(() => VerifyOTPScreen(email: _emailTEController.text.trim()));
    }
    else {
      showSnackMessage(_sendEmailOTPController.message, _sendEmailOTPController.isSuccess);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }

}
