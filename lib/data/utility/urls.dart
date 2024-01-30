class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static userLoginEmailVerification(String email) => '$_baseUrl/UserLogin/$email';
  static userLoginOTPVerification(String email, int otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static const String userReadProfileInfo = '$_baseUrl/ReadProfile';
  static const String createProfile = '$_baseUrl/CreateProfile';
  static const String homeSliderList = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';
  static const String popularProductList = '$_baseUrl/ListProductByRemark/Popular';
  static const String specialProductList = '$_baseUrl/ListProductByRemark/Special';







}