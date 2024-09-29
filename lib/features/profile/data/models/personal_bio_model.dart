class PersonalBioModel {
  String? namaLengkap;
  DateTime? tanggalLahir;
  String? email;
  String? noHp;
  String? gender;
  String? education;
  String? maritalStatus;

  PersonalBioModel({
    this.namaLengkap,
    this.tanggalLahir,
    this.email,
    this.noHp,
    this.gender,
    this.education,
    this.maritalStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'namaLengkap': namaLengkap,
      'tanggalLahir': tanggalLahir?.toIso8601String(),
      'email': email,
      'noHp': noHp,
      'gender': gender,
      'education': education,
      'maritalStatus': maritalStatus,
    };
  }

  factory PersonalBioModel.fromJson(Map<String, dynamic> json) {
    return PersonalBioModel(
      namaLengkap: json['namaLengkap'],
      tanggalLahir: json['tanggalLahir'] != null
          ? DateTime.parse(json['tanggalLahir'])
          : null,
      email: json['email'],
      noHp: json['noHp'],
      gender: json['gender'],
      education: json['education'],
      maritalStatus: json['maritalStatus'],
    );
  }
}
