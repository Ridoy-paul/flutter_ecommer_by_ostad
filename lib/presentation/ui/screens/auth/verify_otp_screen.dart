import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/verify_otp_screen_resend_otp_controller.dart';
import '../../../../data/utility/helpers.dart';
import '../../utility/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import '../../widgets/app_logo.dart';
import 'complete_profile_screen.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final VerifyOTPScreenResendOTPController _verifyOTPScreenResendOTPController = Get.find<VerifyOTPScreenResendOTPController>();
  TextEditingController _otpTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: Get.height * .1,),
                  const AppLogoWidget(),
                  const SizedBox(height: 16,),
                  Text("Enter OTP Code", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 5,),
                  Text("A 4 digit code has been sent", style: Theme.of(context).textTheme.bodyLarge,),
                  const SizedBox(height: 26,),
                  PinCodeTextField(
                    controller: _otpTEController,
                    validator: (value) => inputValidate(value, "Enter 4 digit verification code!"),
                    length: 4,
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
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CompleteProfileScreen());
                      },
                      child: const Text("Next"),
                    ),
                  ),
                  const SizedBox(height: 36,),
                  GetBuilder<VerifyOTPScreenResendOTPController>(builder: (verifyOTPScreenResendOTPController) {
                    return verifyOTPScreenResendOTPController.countTime != 0 ? Center(
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
                              text: "${verifyOTPScreenResendOTPController.countTime.toString()}s",
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) : Center(
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
                              verifyOTPScreenResendOTPController.countTime = 120;
                              verifyOTPScreenResendOTPController.startTimer();
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}