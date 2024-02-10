class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static userLoginEmailVerification(String email) => '$_baseUrl/UserLogin/$email';
  static userLoginOTPVerification(String email, int otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static const String userReadProfileInfo = '$_baseUrl/ReadProfile';
  static const String createProfile = '$_baseUrl/CreateProfile';
  static const String homeSliderList = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';
  static const String popularProductList = '$_baseUrl/ListProductByRemark/Popular';
  static const String specialProductList = '$_baseUrl/ListProductByRemark/Special';
  static const String newProductList = '$_baseUrl/ListProductByRemark/New';
  static String allProductListByRemarks(String type) => '$_baseUrl/ListProductByRemark/$type';
  static listProductByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static const String brandList = '$_baseUrl/BrandList';
  static listProductByBrand(int brandId) => '$_baseUrl/ListProductByBrand/$brandId';
  static productDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static const String createCartList = '$_baseUrl/CreateCartList';










}