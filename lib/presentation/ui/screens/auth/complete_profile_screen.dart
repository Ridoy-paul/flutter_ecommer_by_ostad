import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/data/models/params/create_profile_params.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/auth/complete_profile_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/show_snack_message.dart';
import '../../../../data/utility/helpers.dart';
import '../main_bottom_nav_screen.dart';
import '../../widgets/app_logo.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final CompleteProfileController _completeProfileController = Get.find<
      CompleteProfileController>();

  final TextEditingController _customerNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileNameTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();
  final TextEditingController _shippingAddressNameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedCountry = 'Bangladesh'; // Default selected country

  // List of countries
  List<String> _countries = ['Bangladesh', 'USA', 'India'];

  String? dropdownValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .02,),
                    const AppLogoWidget(),
                    const SizedBox(height: 16,),
                    Text("Complete Profile", style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,),
                    const SizedBox(height: 5,),
                    Text("Get started with us with your details", style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _customerNameTEController,
                      validator: (value) => inputValidate(value, "Enter Full Name"),
                      decoration: inputDecorationParams("Full Name"),
                    ),
                    const SizedBox(height: 12,),

                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Select Your Country',
                              border: OutlineInputBorder(),
                            ),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: _countries.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Select Your Country',
                              border: OutlineInputBorder(),
                            ),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: _countries.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _lastNameTEController,
                      validator: (value) => inputValidate(value, "Enter Last Name"),
                      decoration: inputDecorationParams("Full Name"),

                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _mobileNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Mobile Number"),
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _cityNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Your City Name"),
                      decoration: const InputDecoration(
                        hintText: 'City',
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: _shippingAddressNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Shipping Address"),
                      decoration: const InputDecoration(
                        hintText: 'Shipping Address',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12,),

                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<CompleteProfileController>(builder: (controller) {
                        return Visibility(
                          visible: !controller.inProgressStatus,
                          replacement: circleProgressIndicatorShow(),
                          child: ElevatedButton(
                            onPressed: submitCompleteProfile,
                            child: const Text("Complete Profile"),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecorationParams(String inputLabelText) {
    return InputDecoration(
      labelText: inputLabelText,
    );
  }

  Future<void> submitCompleteProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final createProfileParamsInput = CreateProfileParams(
      // firstName: _firstNameTEController.text.trim(),
      // lastName: _lastNameTEController.text.trim(),
      // mobile: _mobileNameTEController.text.trim(),
      // city: _cityNameTEController.text.trim(),
      // address: _shippingAddressNameTEController.text.trim(),
    );

    final bool response = await _completeProfileController.createUserProfile(createProfileParamsInput);

    if (response) {
      Get.offAll(() => const MainBottomNavScreen());
      showSnackMessage("Profile Info Saved.",);
    }
    else {
      showSnackMessage(_completeProfileController.message, false);
    }
  }

  @override
  void dispose() {
    _customerNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileNameTEController.dispose();
    _cityNameTEController.dispose();
    _shippingAddressNameTEController.dispose();
    super.dispose();
  }

}
