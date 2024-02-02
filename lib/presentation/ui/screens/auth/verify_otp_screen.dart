import 'package:flutter/material.dart';
import '../../../state_holders/send_email_otp_controller.dart';
import '../../../state_holders/verify_otp_controller.dart';
import '../main_bottom_nav_screen.dart';
import '../../../state_holders/verify_otp_screen_resend_otp_controller.dart';
import '../../../../data/utility/helpers.dart';
import '../../utility/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import '../../utility/show_snack_message.dart';
import '../../widgets/app_logo.dart';
import 'complete_profile_screen.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final VerifyOTPScreenResendOTPController _verifyOTPScreenResendOTPController = Get
      .find<VerifyOTPScreenResendOTPController>();
  final SendEmailOTPController _sendEmailOTPController = Get.find<
      SendEmailOTPController>();
  final VerifyOTPController _verifyOTPController = Get.find<
      VerifyOTPController>();
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _verifyOTPScreenResendOTPController.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .1,),
                    const AppLogoWidget(),
                    const SizedBox(height: 16,),
                    Text("Enter OTP Code", style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,),
                    const SizedBox(height: 5,),
                    Text("A 4 digit code has been sent", style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,),
                    const SizedBox(height: 26,),
                    PinCodeTextField(
                      controller: _otpTEController,
                      validator: (value) =>
                          inputValidate(
                              value, "Enter 4 digit verification code!"),
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      backgroundColor: AppColors.transparentColor,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                        selectedFillColor: AppColors.transparentColor,
                        inactiveFillColor: AppColors.transparentColor,
                        inactiveColor: AppColors.primaryColor,
                        selectedColor: Colors.deepPurple,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      //errorAnimationController: errorController,

                      onCompleted: (v) {
                        //print("Completed");
                      },
                      onChanged: (value) {

                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                      appContext: context,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<VerifyOTPController>(builder: (verifyOTPController) {
                        return Visibility(
                          visible: !verifyOTPController.inProgressStatus,
                          replacement: circleProgressIndicatorShow(),
                          child: ElevatedButton(
                            onPressed: _confirmOTPVerification,
                            child: const Text("Next"),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 36,),
                    resendOTPMethod,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container get resendOTPMethod {
    return Container(
      child: GetBuilder<VerifyOTPScreenResendOTPController>(
        builder: (verifyOTPScreenResendOTPController) {
          return verifyOTPScreenResendOTPController.countTime != 0
              ? Center(
            child: RichText(
              text: TextSpan(
                text: 'This code will expire in ',
                style: const TextStyle(
                  color: AppColors.lightGray,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                    "${verifyOTPScreenResendOTPController.countTime
                        .toString()}s",
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          )
              : Center(
            child: GetBuilder<SendEmailOTPController>(
                builder: (sendEmailOTPController) {
                  return Visibility(
                    visible: !sendEmailOTPController.inProgressStatus,
                    replacement: circleProgressIndicatorShow(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Did\'n get code?",
                          style: TextStyle(
                            color: AppColors.lightGray,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _emailValidationResendConfirm();
                          },
                          child: const Text(
                            "Resend",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }

  Future<void> _emailValidationResendConfirm() async {
    final responseResult = await _sendEmailOTPController.sendEmailOTP(
        widget.email);
    if (responseResult) {
      showSnackMessage(_sendEmailOTPController.message);
      _verifyOTPScreenResendOTPController.countTime = 120;
      _verifyOTPScreenResendOTPController.startTimer();
    }
    else {
      showSnackMessage(_sendEmailOTPController.message, _sendEmailOTPController.isSuccess);
    }
  }

  Future<void> _confirmOTPVerification() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final responseResult = await _verifyOTPController.verifyOTP(widget.email, int.parse(_otpTEController.text));
    if (responseResult) {
      if(_verifyOTPController.shouldNavigateCompleteProfile) {
        Get.to(() => const CompleteProfileScreen());
      }
      else {
        Get.offAll(() => const MainBottomNavScreen());
      }
    }
    else {
      showSnackMessage(_verifyOTPController.message, _verifyOTPController.isSuccess);
    }
  }


}