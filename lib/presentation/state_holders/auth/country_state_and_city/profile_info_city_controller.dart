import 'profile_info_state_controller.dart';
import 'profile_info_country_controller.dart';
import 'package:get/get.dart';
import '../../../../data/utility/country_cities_and_state_utility.dart';

class ProfileInfoCityController extends GetxController {
  String? selectedCity;
  CountriesCitiesAndStates countryData = CountriesCitiesAndStates();

  List<String> _cities = [];
  List<String> get cities => _cities;

  ProfileInfoCountryController profileInfoCountryController = Get.find<ProfileInfoCountryController>();
  ProfileInfoStateController profileInfoStateController = Get.find<ProfileInfoStateController>();

  void getCityData() {
    _cities = (profileInfoCountryController.selectedCountry != null && profileInfoStateController.selectedState != null) ? countryData.countriesCitiesAndStates[profileInfoCountryController.selectedCountry!]![profileInfoStateController.selectedState!]! : [];
    update();
  }

  void onCityChanged(String? value) {
    if (value != null && selectedCity != value) {
      selectedCity = value;
      update();
    }
  }
}