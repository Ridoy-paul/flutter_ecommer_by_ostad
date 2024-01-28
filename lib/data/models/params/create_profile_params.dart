import 'dart:core';

class CreateProfileParams {
  final String firstName;
  final String lastName;
  final String mobile;
  final String city;
  final String address;

  CreateProfileParams({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.city,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "city": city,
    "shippingAddress": address
  };

}