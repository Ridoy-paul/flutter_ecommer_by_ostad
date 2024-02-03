class CreateProfileParams {
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;

  CreateProfileParams({
    this.cusName,
    this.cusAdd,
    this.cusCity,
    this.cusState,
    this.cusPostcode,
    this.cusCountry,
    this.cusPhone,
    this.cusFax,
    this.shipName,
    this.shipAdd,
    this.shipCity,
    this.shipState,
    this.shipPostcode,
    this.shipCountry,
    this.shipPhone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cus_name'] = cusName;
    data['cus_add'] = cusAdd;
    data['cus_city'] = cusCity;
    data['cus_state'] = cusState;
    data['cus_postcode'] = cusPostcode;
    data['cus_country'] = cusCountry;
    data['cus_phone'] = cusPhone;
    data['cus_fax'] = cusFax;
    data['ship_name'] = shipName;
    data['ship_add'] = shipAdd;
    data['ship_city'] = shipCity;
    data['ship_state'] = shipState;
    data['ship_postcode'] = shipPostcode;
    data['ship_country'] = shipCountry;
    data['ship_phone'] = shipPhone;
    return data;
  }
}