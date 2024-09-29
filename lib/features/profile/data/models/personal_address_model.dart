class PersonalAddressModel {
  String? nik;
  String? fullAddress;
  String? province;
  String? city;
  String? district;
  String? village;
  String? postalCode;
  bool? isSameAsKTP;
  String? domicileAddress;
  String? domicileProvince;
  String? domicileCity;
  String? domicileDistrict;
  String? domicileVillage;
  String? domicilePostalCode;

  PersonalAddressModel({
    this.nik,
    this.fullAddress,
    this.province,
    this.city,
    this.district,
    this.village,
    this.postalCode,
    this.isSameAsKTP,
    this.domicileAddress,
    this.domicileProvince,
    this.domicileCity,
    this.domicileDistrict,
    this.domicileVillage,
    this.domicilePostalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'fullAddress': fullAddress,
      'province': province,
      'city': city,
      'district': district,
      'village': village,
      'postalCode': postalCode,
      'isSameAsKTP': isSameAsKTP,
      'domicileAddress': domicileAddress,
      'domicileProvince': domicileProvince,
      'domicileCity': domicileCity,
      'domicileDistrict': domicileDistrict,
      'domicileVillage': domicileVillage,
      'domicilePostalCode': domicilePostalCode,
    };
  }

  factory PersonalAddressModel.fromJson(Map<String, dynamic> json) {
    return PersonalAddressModel(
      nik: json['nik'],
      fullAddress: json['fullAddress'],
      province: json['province'],
      city: json['city'],
      district: json['district'],
      village: json['village'],
      postalCode: json['postalCode'],
      isSameAsKTP: json['isSameAsKTP'],
      domicileAddress: json['domicileAddress'],
      domicileProvince: json['domicileProvince'],
      domicileCity: json['domicileCity'],
      domicileDistrict: json['domicileDistrict'],
      domicileVillage: json['domicileVillage'],
      domicilePostalCode: json['domicilePostalCode'],
    );
  }
}
