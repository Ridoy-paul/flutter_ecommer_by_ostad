import 'package:flutter/material.dart';
import '../../../state_holders/auth/country_state_city_processing_controller.dart';
import 'package:get/get.dart';
import '../../../../data/utility/country_cities_and_state_utility.dart';
import '../../utility/app_colors.dart';
import '../../../../data/models/params/create_profile_params.dart';
import '../../../state_holders/auth/complete_profile_controller.dart';
import '../../utility/show_snack_message.dart';
import '../../../../data/utility/helpers.dart';
import '../main_bottom_nav_screen.dart';
import '../../widgets/app_logo.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final CompleteProfileController _completeProfileController = Get.find<CompleteProfileController>();

  final TextEditingController _customerNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileNameTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();
  final TextEditingController _shippingAddressNameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.find<CountryStateCityProcessingController>().getCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .01),
                    const AppLogoWidget(),
                    const SizedBox(height: 8),
                    Text("Complete Profile",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    Text(
                      "Get started with us with your details",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _customerNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Full Name"),
                      decoration: inputDecorationParams("Full Name"),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child:
                          GetBuilder<CountryStateCityProcessingController>(
                            builder: (controller) {
                              return DropdownButtonFormField<String>(
                                validator: (value) =>
                                    inputValidate(value, "Select Country!"),
                                decoration: inputDecorationParams("Country"),
                                value: controller.selectedCountry,
                                onChanged: controller.onCountryChanged,
                                items: controller.countries
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child:
                          GetBuilder<CountryStateCityProcessingController>(
                            builder: (controller) {
                              return DropdownButtonFormField<String>(
                                validator: (value) =>
                                    inputValidate(value, "Select State!"),
                                decoration: inputDecorationParams("State"),
                                value: controller.selectedState,
                                onChanged: controller.onStateChanged,
                                items: controller.states
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child:
                          GetBuilder<CountryStateCityProcessingController>(
                            builder: (controller) {
                              return DropdownButtonFormField<String>(
                                validator: (value) => inputValidate(value, "Select City!"),
                                decoration: inputDecorationParams("City"),
                                value: controller.selectedCity,
                                onChanged: controller.onCityChanged,
                                items: controller.cities.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _lastNameTEController,
                            validator: (value) =>
                                inputValidate(value, "Enter Postcode"),
                            decoration: inputDecorationParams("Postcode"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _mobileNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Phone Number"),
                      decoration: inputDecorationParams("Phone"),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _mobileNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Fax Number"),
                      decoration: inputDecorationParams("Fax"),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _shippingAddressNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Your Address"),
                      decoration: const InputDecoration(
                        hintText: 'Address',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 12),
                    getShippingInformation(),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<CompleteProfileController>(
                        builder: (controller) {
                          return Visibility(
                            visible: !controller.inProgressStatus,
                            replacement: circleProgressIndicatorShow(),
                            child: ElevatedButton(
                              onPressed: submitCompleteProfile,
                              child: const Text("Complete Profile"),
                            ),
                          );
                        },
                      ),
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

  Widget getShippingInformation() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          /*
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Shipping Info.",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool? newValue) {
                      setState(() {
                        //isChecked = newValue ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Same as Profile Information?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _customerNameTEController,
                validator: (value) => inputValidate(value, "Enter Shipping Person Name"),
                decoration: inputDecorationParams("Shipping Person Name"),
              ),
              const SizedBox(
                height: 12,
              ),

              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      validator: (value) =>
                          inputValidate(value, "Select Shipping Country!"),
                      decoration: inputDecorationParams("Ship Country"),
                      value: '',
                      onChanged: (String? newValue) {
                        // setState(() {
                        //   dropdownValue = newValue!;
                        // });
                      },
                        items: countries.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      validator: (value) =>
                          inputValidate(value, "Select Shipping State!"),
                      decoration: inputDecorationParams("Ship State"),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          //dropdownValue = newValue!;
                        });
                      },
                      items: _countries
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      validator: (value) =>
                          inputValidate(value, "Select Shipping City!"),
                      decoration: inputDecorationParams("Ship City"),
                      value: '',
                      onChanged: (String? newValue) {
                        setState(() {
                          //dropdownValue = newValue!;
                        });
                      },
                      items: countries.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _lastNameTEController,
                      validator: (value) =>
                          inputValidate(value, "Enter Shipping Postcode"),
                      decoration: inputDecorationParams("Ship Postcode"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _mobileNameTEController,
                validator: (value) =>
                    inputValidate(value, "Enter Shipping Person Phone Number"),
                decoration: inputDecorationParams("Shipping Person Phone"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _shippingAddressNameTEController,
                validator: (value) =>
                    inputValidate(value, "Enter Shipping Address"),
                decoration: const InputDecoration(
                  hintText: 'Shipping Address',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
              ),
            ],
          ),

           */
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

    final bool response = await _completeProfileController
        .createUserProfile(createProfileParamsInput);

    if (response) {
      Get.offAll(() => const MainBottomNavScreen());
      showSnackMessage("Profile Info Saved.");
    } else {
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
