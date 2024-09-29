class CompanyInformationModel {
  String? businessName;
  String? businessAddress;
  String? position;
  String? workDuration;
  String? incomeSource;
  String? grossIncome;
  String? bankBranch;
  String? accountNumber;
  String? accountOwner;

  CompanyInformationModel({
    this.businessName,
    this.businessAddress,
    this.position,
    this.workDuration,
    this.incomeSource,
    this.grossIncome,
    this.bankBranch,
    this.accountNumber,
    this.accountOwner,
  });

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'businessAddress': businessAddress,
      'position': position,
      'workDuration': workDuration,
      'incomeSource': incomeSource,
      'grossIncome': grossIncome,
      'bankBranch': bankBranch,
      'accountNumber': accountNumber,
      'accountOwner': accountOwner,
    };
  }

  factory CompanyInformationModel.fromJson(Map<String, dynamic> json) {
    return CompanyInformationModel(
      businessName: json['businessName'],
      businessAddress: json['businessAddress'],
      position: json['position'],
      workDuration: json['workDuration'],
      incomeSource: json['incomeSource'],
      grossIncome: json['grossIncome'],
      bankBranch: json['bankBranch'],
      accountNumber: json['accountNumber'],
      accountOwner: json['accountOwner'],
    );
  }
}
