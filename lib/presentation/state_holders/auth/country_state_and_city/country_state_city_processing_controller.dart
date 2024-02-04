import 'package:get/get.dart';
import '../../../../data/utility/country_cities_and_state_utility.dart';

class CountryStateCityProcessingController extends GetxController {
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;
  CountriesCitiesAndStates countryData = CountriesCitiesAndStates();

  List<String> _countries = [];
  List<String> _states = [];
  List<String> _cities = [];

  List<String> get countries => _countries;
  List<String> get states => _states;
  List<String> get cities => _cities;

  String? get selectedCountry => _selectedCountry;
  String? get selectedState => _selectedState;
  String? get selectedCity => _selectedCity;

  void getCountriesData() {
    _countries = countryData.countriesCitiesAndStates.keys.toList();
    update();
  }

  void onCountryChanged(String? value) {
    if (value != null && _selectedCountry != value) {
      _selectedCountry = value;
      _selectedState = null;
      _selectedCity = null;

      getStatesData();
      getCityData();
      update();
    }
  }

  void getStatesData() {
    _states = _selectedCountry != null ? countryData.countriesCitiesAndStates[_selectedCountry!]!.keys.toList() : [];
    update();
  }

  void onStateChanged(String? value) {
    if (value != null && _selectedState != value) {
      _selectedState = value;
      _selectedCity = null;

      getCityData();
      update();
    }
  }

  void getCityData() {
    _cities = (_selectedCountry != null && _selectedState != null) ? countryData.countriesCitiesAndStates[_selectedCountry!]![_selectedState!]! : [];
    update();
  }

  void onCityChanged(String? value) {
    if (value != null && _selectedCity != value) {
      _selectedCity = value;
      update();
    }
  }

}
