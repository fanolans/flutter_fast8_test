import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_date_textfield.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../shared/widgets/custom_textfield.dart';

class FormPersonalBioWidget extends StatelessWidget {
  final TextEditingController namaLengkapController;
  final TextEditingController tanggalLahirController;
  final TextEditingController emailController;
  final TextEditingController noHpController;
  final String selectedGender;
  final String selectedEducation;
  final String selectedMaritalStatus;
  final List<String> genderOptions;
  final List<String> educationOptions;
  final List<String> maritalStatusOptions;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onEducationChanged;
  final ValueChanged<String?> onMaritalStatusChanged;
  final VoidCallback onDateSelect;

  const FormPersonalBioWidget({
    super.key,
    required this.namaLengkapController,
    required this.tanggalLahirController,
    required this.emailController,
    required this.noHpController,
    required this.selectedGender,
    required this.selectedEducation,
    required this.selectedMaritalStatus,
    required this.genderOptions,
    required this.educationOptions,
    required this.maritalStatusOptions,
    required this.onGenderChanged,
    required this.onEducationChanged,
    required this.onMaritalStatusChanged,
    required this.onDateSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '* NAMA LENGKAP',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(controller: namaLengkapController),
          const SizedBox(height: 16),
          Text(
            '* TANGGAL LAHIR',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDateTextField(
            controller: tanggalLahirController,
            onTap: onDateSelect,
          ),
          const SizedBox(height: 16),
          Text(
            '* JENIS KELAMIN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: selectedGender,
            options: genderOptions,
            onChanged: onGenderChanged,
          ),
          const SizedBox(height: 16),
          Text(
            '* ALAMAT EMAIL',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          Text(
            '* NO HP',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: noHpController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Text(
            'PENDIDIKAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: selectedEducation,
            options: educationOptions,
            onChanged: onEducationChanged,
          ),
          const SizedBox(height: 16),
          Text(
            'TATUS PERNIKAHAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: selectedMaritalStatus,
            options: maritalStatusOptions,
            onChanged: onMaritalStatusChanged,
          ),
        ],
      ),
    );
  }
}
