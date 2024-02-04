import 'package:get/get.dart';
import '../../../data/utility/country_cities_and_state_utility.dart';

class CountryStateCityProcessingController extends GetxController {
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;
  CountriesCitiesAndStates countryData = CountriesCitiesAndStates();

  List<String> _countries = [];
  List<String> states = [];
  List<String> cities = [];

  List<String> get countries => _countries;
  String? get selectedCountry => _selectedCountry;
  String? get selectedState => _selectedState;
  String? get selectedCity => _selectedCity;

  void getCountriesData() {
    _countries = countryData.countriesCitiesAndStates.keys.toList();
    update();
  }

  void onCountryChanged(String? value) {
    print(_selectedCountry);
    print(value);
    if (value != null) {
      _selectedCountry = value;
      _selectedState = null;
      _selectedCity = null;
    }
    update();
  }

/*
  void setSelectedCountry(String country) {
    _selectedCountry = country;
    _selectedState = '';
    _selectedCity = '';
    update();
  }

  void getStateData() {
    // if (_selectedCountry.isNotEmpty) {
    //   states = countryData.countriesCitiesAndStates[_selectedCountry]!.keys.toList();
    //   update();
    // }
  }

  void setSelectedState(String state) {
    _selectedState = state;
    _selectedCity = '';
    update();
  }

  void getCityData() {
    // if (_selectedCountry.isNotEmpty && _selectedState.isNotEmpty) {
    //   cities = countryData.countriesCitiesAndStates[_selectedCountry]![_selectedState]!;
    //   update();
    // }
  }

  void setSelectedCity(String city) {
    _selectedCity = city;
    update();
  }

   */
}
