import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../../../core/styles/app_colors.dart';
import '../../data/local/shared_preference_service.dart';
import '../../data/models/company_information_model.dart';
import '../../data/models/personal_address_model.dart';
import '../../data/models/personal_bio_model.dart';
import '../widgets/form_information_company_widget.dart';
import '../widgets/form_personal_address_widget.dart';
import '../widgets/form_personal_bio_widget.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  int _currentStep = 0;

  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();

  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _domicileAddressController =
      TextEditingController();
  final TextEditingController _domicileProvinceController =
      TextEditingController();
  final TextEditingController _domicileCityController = TextEditingController();
  final TextEditingController _domicileDistrictController =
      TextEditingController();
  final TextEditingController _domicileVillageController =
      TextEditingController();
  final TextEditingController _domicilePostalCodeController =
      TextEditingController();

  bool _isSameAsKTP = false;

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessAddressController =
      TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _workDurationController = TextEditingController();
  final TextEditingController _incomeSourceController = TextEditingController();
  final TextEditingController _grossIncomeController = TextEditingController();
  final TextEditingController _bankBranchController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountOwnerController = TextEditingController();

  String _selectedGender = 'Laki-laki';
  String _selectedEducation = 'S1';
  String _selectedMaritalStatus = 'Belum Kawin';

  final List<String> _genderOptions = ['Laki-laki', 'Perempuan'];
  final List<String> _educationOptions = [
    'SD',
    'SMP',
    'SMA',
    'D1',
    'D2',
    'D3',
    'S1',
    'S2',
    'S3'
  ];
  final List<String> _maritalStatusOptions = [
    'Belum Kawin',
    'Kawin',
    'Janda',
    'Duda'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _tanggalLahirController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  final SharedPreferenceService _sharedPreferenceService =
      SharedPreferenceService();

  Future<void> _initializeSharedPreferences() async {
    await _sharedPreferenceService.init();
  }

  Future<void> _savePersonalBio() async {
    DateTime? tanggalLahir;
    if (_tanggalLahirController.text.isNotEmpty) {
      List<String> dateParts = _tanggalLahirController.text.split('/');
      int day = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int year = int.parse(dateParts[2]);
      tanggalLahir = DateTime(year, month, day);
    }

    PersonalBioModel bio = PersonalBioModel(
      namaLengkap: _namaLengkapController.text,
      tanggalLahir: tanggalLahir,
      email: _emailController.text,
      noHp: _noHpController.text,
      gender: _selectedGender,
      education: _selectedEducation,
      maritalStatus: _selectedMaritalStatus,
    );

    await _sharedPreferenceService.savePersonalBio(bio);
  }

  Future<void> _savePersonalAddress() async {
    PersonalAddressModel address = PersonalAddressModel(
      nik: _nikController.text,
      fullAddress: _fullAddressController.text,
      province: _provinceController.text,
      city: _cityController.text,
      district: _districtController.text,
      village: _villageController.text,
      postalCode: _postalCodeController.text,
      isSameAsKTP: _isSameAsKTP,
      domicileAddress: _domicileAddressController.text,
      domicileProvince: _domicileProvinceController.text,
      domicileCity: _domicileCityController.text,
      domicileDistrict: _domicileDistrictController.text,
      domicileVillage: _domicileVillageController.text,
      domicilePostalCode: _domicilePostalCodeController.text,
    );

    await _sharedPreferenceService.savePersonalAddress(address);
  }

  Future<void> _saveCompanyInfo() async {
    CompanyInformationModel companyInfo = CompanyInformationModel(
      businessName: _businessNameController.text,
      businessAddress: _businessAddressController.text,
      position: _positionController.text,
      workDuration: _workDurationController.text,
      incomeSource: _incomeSourceController.text,
      grossIncome: _grossIncomeController.text,
      bankBranch: _bankBranchController.text,
      accountNumber: _accountNumberController.text,
      accountOwner: _accountOwnerController.text,
    );

    await _sharedPreferenceService.saveCompanyInfo(companyInfo);
  }

  Future<void> _loadPersonalBio() async {
    final bio = await _sharedPreferenceService.getPersonalBio();
    if (bio != null) {
      setState(() {
        _namaLengkapController.text = bio.namaLengkap ?? '';
        _tanggalLahirController.text = bio.tanggalLahir != null
            ? "${bio.tanggalLahir!.day}/${bio.tanggalLahir!.month}/${bio.tanggalLahir!.year}"
            : '';
        _emailController.text = bio.email ?? '';
        _noHpController.text = bio.noHp ?? '';
        _selectedGender = bio.gender ?? 'Laki-laki';
        _selectedEducation = bio.education ?? 'S1';
        _selectedMaritalStatus = bio.maritalStatus ?? 'Belum Kawin';
      });
    }
  }

  Future<void> _loadPersonalAddress() async {
    final address = await _sharedPreferenceService.getPersonalAddress();
    if (address != null) {
      setState(() {
        _nikController.text = address.nik ?? '';
        _fullAddressController.text = address.fullAddress ?? '';
        _provinceController.text = address.province ?? '';
        _cityController.text = address.city ?? '';
        _districtController.text = address.district ?? '';
        _villageController.text = address.village ?? '';
        _postalCodeController.text = address.postalCode ?? '';
        _isSameAsKTP = address.isSameAsKTP ?? false;
        _domicileAddressController.text = address.domicileAddress ?? '';
        _domicileProvinceController.text = address.domicileProvince ?? '';
        _domicileCityController.text = address.domicileCity ?? '';
        _domicileDistrictController.text = address.domicileDistrict ?? '';
        _domicileVillageController.text = address.domicileVillage ?? '';
        _domicilePostalCodeController.text = address.domicilePostalCode ?? '';
      });
    }
  }

  Future<void> _loadCompanyInfo() async {
    final companyInfo = await _sharedPreferenceService.getCompanyInfo();
    if (companyInfo != null) {
      setState(() {
        _businessNameController.text = companyInfo.businessName ?? '';
        _businessAddressController.text = companyInfo.businessAddress ?? '';
        _positionController.text = companyInfo.position ?? '';
        _workDurationController.text = companyInfo.workDuration ?? '';
        _incomeSourceController.text = companyInfo.incomeSource ?? '';
        _grossIncomeController.text = companyInfo.grossIncome ?? '';
        _bankBranchController.text = companyInfo.bankBranch ?? '';
        _accountNumberController.text = companyInfo.accountNumber ?? '';
        _accountOwnerController.text = companyInfo.accountOwner ?? '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
    _loadPersonalBio();
    _loadPersonalAddress();
    _loadCompanyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FluentIcons.chevron_left_12_regular,
            size: 18,
          ),
        ),
        title: Text(
          'Informasi Pribadi',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          EasyStepper(
            alignment: AlignmentDirectional.center,
            activeStep: _currentStep,
            stepRadius: 20,
            showLoadingAnimation: false,
            activeStepTextColor: AppColors.primary,
            unreachedStepTextColor: AppColors.primary.withOpacity(0.3),
            finishedStepTextColor: AppColors.primary,
            activeStepIconColor: Colors.white,
            unreachedStepIconColor: Colors.white,
            finishedStepIconColor: Colors.white,
            lineStyle: LineStyle(
              lineLength: 80,
              lineType: LineType.normal,
              activeLineColor: AppColors.primary,
              unreachedLineColor: AppColors.primary.withOpacity(0.3),
              finishedLineColor: AppColors.primary,
            ),
            finishedStepBorderColor: AppColors.primary,
            finishedStepBackgroundColor: AppColors.primary,
            activeStepBorderColor: AppColors.primary,
            activeStepBackgroundColor: AppColors.primary,
            unreachedStepBorderColor: AppColors.primary,
            unreachedStepBackgroundColor: AppColors.primary.withOpacity(0.3),
            steps: [
              EasyStep(
                icon: const Icon(FluentIcons.number_circle_1_16_filled),
                customTitle: Text(
                  'Biodata Diri',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.primary),
                ),
              ),
              EasyStep(
                icon: const Icon(FluentIcons.number_circle_2_16_filled),
                customTitle: Text(
                  'Alamat Pribadi',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.primary),
                ),
              ),
              EasyStep(
                icon: const Icon(FluentIcons.number_circle_3_16_filled),
                customTitle: Text(
                  'Informasi Perusahaan',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.primary),
                ),
              ),
            ],
            onStepReached: (index) {
              setState(() {
                _currentStep = index;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _currentStep,
              children: [
                FormPersonalBioWidget(
                  namaLengkapController: _namaLengkapController,
                  tanggalLahirController: _tanggalLahirController,
                  emailController: _emailController,
                  noHpController: _noHpController,
                  selectedGender: _selectedGender,
                  selectedEducation: _selectedEducation,
                  selectedMaritalStatus: _selectedMaritalStatus,
                  genderOptions: _genderOptions,
                  educationOptions: _educationOptions,
                  maritalStatusOptions: _maritalStatusOptions,
                  onGenderChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                  onEducationChanged: (value) {
                    setState(() {
                      _selectedEducation = value!;
                    });
                  },
                  onMaritalStatusChanged: (value) {
                    setState(() {
                      _selectedMaritalStatus = value!;
                    });
                  },
                  onDateSelect: () => _selectDate(context),
                ),
                const FormPersonalAddressWidget(),
                const FormInformationCompanyWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            if (_currentStep > 0)
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.background,
                    foregroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: AppColors.primary),
                    ),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  onPressed: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep--;
                      });
                    }
                  },
                  child: const Text('Sebelumnya'),
                ),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(double.infinity, 55),
                ),
                onPressed: () async {
                  if (_currentStep < 2) {
                    setState(() {
                      _currentStep++;
                    });
                  } else {
                    await _savePersonalBio();
                    await _savePersonalAddress();
                    await _saveCompanyInfo();

                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Data berhasil disimpan'),
                        ),
                      );
                    }
                  }
                },
                child: Text(_currentStep == 2 ? 'Simpan' : 'Selanjutnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
