class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static userLoginEmailVerification(String email) => '$_baseUrl/UserLogin/$email';

}