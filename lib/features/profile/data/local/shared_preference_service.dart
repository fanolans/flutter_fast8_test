import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/company_information_model.dart';
import '../models/personal_address_model.dart';
import '../models/personal_bio_model.dart';

class SharedPreferenceService {
  Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  /// Menyimpan Personal Bio
  Future<void> savePersonalBio(PersonalBioModel bio) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('personalBio', jsonEncode(bio.toJson()));
  }

  /// Mengambil Personal Bio
  Future<PersonalBioModel?> getPersonalBio() async {
    final prefs = await SharedPreferences.getInstance();
    String? bioString = prefs.getString('personalBio');
    if (bioString != null) {
      Map<String, dynamic> bioMap = jsonDecode(bioString);
      return PersonalBioModel.fromJson(bioMap);
    }
    return null;
  }

  /// Menyimpan Personal Address
  Future<void> savePersonalAddress(PersonalAddressModel address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('personalAddress', jsonEncode(address.toJson()));
  }

  /// Mengambil Personal Address
  Future<PersonalAddressModel?> getPersonalAddress() async {
    final prefs = await SharedPreferences.getInstance();
    String? addressString = prefs.getString('personalAddress');
    if (addressString != null) {
      Map<String, dynamic> addressMap = jsonDecode(addressString);
      return PersonalAddressModel.fromJson(addressMap);
    }
    return null;
  }

  /// Menyimpan Company Info
  Future<void> saveCompanyInfo(CompanyInformationModel companyInfo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('companyInfo', jsonEncode(companyInfo.toJson()));
  }

  /// Mengambil Company Info
  Future<CompanyInformationModel?> getCompanyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? companyString = prefs.getString('companyInfo');
    if (companyString != null) {
      Map<String, dynamic> companyMap = jsonDecode(companyString);
      return CompanyInformationModel.fromJson(companyMap);
    }
    return null;
  }
}
