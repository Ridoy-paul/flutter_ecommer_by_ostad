import 'profile_info_city_controller.dart';
import 'profile_info_country_controller.dart';
import 'package:get/get.dart';
import '../../../../data/utility/country_cities_and_state_utility.dart';

class ProfileInfoStateController extends GetxController {
  CountriesCitiesAndStates countryData = CountriesCitiesAndStates();

  String? selectedState;

  List<String> _states = [];
  List<String> get states => _states;
  String? selectedCountry = Get.find<ProfileInfoCountryController>().selectedCountry;

  void getStatesData() {
    _states = selectedState != null ? countryData.countriesCitiesAndStates[Get.find<ProfileInfoCountryController>().selectedCountry!]!.keys.toList() : [];
    print(selectedCountry);
    update();
  }

  void onStateChanged(String? value) {
    if (value != null && selectedState != value) {
      selectedState = value;
      Get.find<ProfileInfoCityController>().selectedCity = null;
      Get.find<ProfileInfoCityController>().getCityData();
      update();
    }
  }

}