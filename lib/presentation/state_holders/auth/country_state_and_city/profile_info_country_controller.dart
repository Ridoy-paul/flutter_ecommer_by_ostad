import 'profile_info_city_controller.dart';
import 'profile_info_state_controller.dart';
import 'package:get/get.dart';
import '../../../../data/utility/country_cities_and_state_utility.dart';

class ProfileInfoCountryController extends GetxController {
  String? _selectedCountry;
  CountriesCitiesAndStates countryData = CountriesCitiesAndStates();

  String? get selectedCountry => _selectedCountry;

  List<String> _countries = [];
  List<String> get countries => _countries;

  void getCountriesData() {
    _countries = countryData.countriesCitiesAndStates.keys.toList();
    update();
  }

  void onCountryChanged(String? value) {
    print(value);
    print(_selectedCountry);
    if (value != null && _selectedCountry != value) {
      _selectedCountry = value;

      Get.find<ProfileInfoStateController>().selectedState = null;
      Get.find<ProfileInfoStateController>().getStatesData();

      Get.find<ProfileInfoCityController>().selectedCity = null;
      Get.find<ProfileInfoCityController>().getCityData();
      update();
    }
  }
}