import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/data/utility/helpers.dart';
import '../main_bottom_nav_screen.dart';
import '../../widgets/app_logo.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileNameTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();
  final TextEditingController _shippingAddressNameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    Text("Complete Profile", style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 5,),
                    Text("Get started with us with your details", style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _firstNameTEController,
                      validator: (value) => inputValidate(value, "Enter First Name"),
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _lastNameTEController,
                      validator: (value) => inputValidate(value, "Enter Last Name"),
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _mobileNameTEController,
                      validator: (value) => inputValidate(value, "Enter Mobile Number"),
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _cityNameTEController,
                      validator: (value) => inputValidate(value, "Enter Your City Name"),
                      decoration: const InputDecoration(
                        hintText: 'City',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _shippingAddressNameTEController,
                      validator: (value) => inputValidate(value, "Enter Shipping Address"),
                      decoration: const InputDecoration(
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
      ),
    );
  }


  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileNameTEController.dispose();
    _cityNameTEController.dispose();
    _shippingAddressNameTEController.dispose();
    super.dispose();
  }

}
