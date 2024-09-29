import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../shared/widgets/custom_textfield.dart';

class FormInformationCompanyWidget extends StatefulWidget {
  const FormInformationCompanyWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormInformationCompanyWidgetState createState() =>
      _FormInformationCompanyWidgetState();
}

class _FormInformationCompanyWidgetState
    extends State<FormInformationCompanyWidget> {
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessAddressController =
      TextEditingController();
  final TextEditingController _bankBranchController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountOwnerController = TextEditingController();

  String? _selectedPosition;
  String? _selectedWorkDuration;
  String? _selectedIncomeSource;
  String? _selectedGrossIncome;

  final List<String> positions = [
    'Non-Staf',
    'Staf',
    'Supervisor',
    'Manajer',
    'Direktur',
    'Lainnya'
  ];
  final List<String> workDurations = [
    '< 6 Bulan',
    '6 Bulan - 1 Tahun',
    '1 - 2 Tahun',
    '> 2 Tahun'
  ];
  final List<String> incomeSources = [
    'Gaji',
    'Keuntungan Bisnis',
    'Bunga Tabungan',
    'Warisan',
    'Dana dari orang tua atau anak',
    'Undian',
    'Keuntungan Investasi',
    'Lainnya'
  ];
  final List<String> grossIncomeOptions = [
    '< 10 Juta',
    '10 - 50 Juta',
    '50 - 100 Juta',
    '100 - 500 Juta',
    '500 Juta - 1 Milyar',
    '> 1 Milyar'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NAMA USAHA / PERUSAHAAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _businessNameController,
          ),
          const SizedBox(height: 16),
          Text(
            'ALAMAT USAHA / PERUSAHAAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _businessAddressController,
          ),
          const SizedBox(height: 16),
          Text(
            'JABATAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedPosition,
            options: positions,
            onChanged: (value) {
              setState(() {
                _selectedPosition = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'LAMA BEKERJA',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedWorkDuration,
            options: workDurations,
            onChanged: (value) {
              setState(() {
                _selectedWorkDuration = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'SUMBER PENDAPATAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedIncomeSource,
            options: incomeSources,
            onChanged: (value) {
              setState(() {
                _selectedIncomeSource = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'PENDAPATAN KOTOR PERTAHUN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedGrossIncome,
            options: grossIncomeOptions,
            onChanged: (value) {
              setState(() {
                _selectedGrossIncome = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'CABANG BANK',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _bankBranchController,
          ),
          const SizedBox(height: 16),
          Text(
            'NOMOR REKENING',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _accountNumberController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Text(
            'NAMA PEMILIK REKENING',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _accountOwnerController,
          ),
        ],
      ),
    );
  }
}
