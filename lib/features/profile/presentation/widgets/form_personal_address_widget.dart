import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../shared/widgets/custom_textfield.dart';
import 'view_image_widget.dart';

class FormPersonalAddressWidget extends StatefulWidget {
  const FormPersonalAddressWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormPersonalAddressWidgetState createState() =>
      _FormPersonalAddressWidgetState();
}

class _FormPersonalAddressWidgetState extends State<FormPersonalAddressWidget> {
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _domicileAddressController =
      TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedDistrict;
  String? _selectedVillage;

  String? _selectedDomicileProvince;
  String? _selectedDomicileCity;
  String? _selectedDomicileDistrict;
  String? _selectedDomicileVillage;

  bool _isSameAsKTP = false;

  final List<String> provinces = [
    'DKI Jakarta',
    'Jawa Timur',
    'Jawa Tengah',
    'Jawa Barat'
  ];
  final List<String> cities = [
    'Jakarta Timur',
    'Jakarta Selatan',
    'Jakarta Utara',
  ];
  final List<String> districts = [
    'Setia Budi',
    'Tebet',
    'Pancoran',
  ];
  final List<String> villages = [
    'Setiabudi',
    'Karet',
    'Kuningan Timur',
  ];

  File? _image;

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _viewImage(BuildContext context) {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewImageWidget(image: _image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    _pickImageFromCamera();
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          FluentIcons.card_ui_20_filled,
                          size: 30,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Upload KTP'),
                          if (_image != null) ...[
                            InkWell(
                              onTap: () {
                                _viewImage(context);
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    FluentIcons.checkmark_circle_12_filled,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  const SizedBox(height: 5),
                                  InkWell(
                                    onTap: () => _viewImage(context),
                                    child: Text(
                                      'Lihat gambar berhasil diupload',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '* NIK',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextField(
                  controller: _nikController,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '* ALAMAT SESUAI KTP',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _fullAddressController,
          ),
          const SizedBox(height: 16),
          Text(
            '* PROVINSI',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedProvince,
            options: provinces,
            onChanged: (value) {
              setState(() {
                _selectedProvince = value;
                _selectedCity = null;
                _selectedDistrict = null;
                _selectedVillage = null;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            '* KOTA/KABUPATEN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedCity,
            enabled: _selectedProvince != null,
            options: cities,
            onChanged: (value) {
              setState(() {
                _selectedCity = value;
                _selectedDistrict = null;
                _selectedVillage = null;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            '* KECAMATAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedDistrict,
            enabled: _selectedCity != null,
            options: districts,
            onChanged: (value) {
              setState(() {
                _selectedDistrict = value;
                _selectedVillage = null;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            '* KELURAHAN',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomDropdown(
            value: _selectedVillage,
            enabled: _selectedDistrict != null,
            options: villages,
            onChanged: (value) {
              setState(() {
                _selectedVillage = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            '* KODE POS',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          CustomTextField(
            controller: _postalCodeController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: AppColors.primary,
                value: _isSameAsKTP,
                onChanged: (value) {
                  setState(() {
                    _isSameAsKTP = value ?? false;
                  });
                },
              ),
              const Text('Alamat domisili sama dengan alamat KTP'),
            ],
          ),
          if (!_isSameAsKTP) ...[
            const SizedBox(height: 16),
            Text(
              '* ALAMAT DOMISILI',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CustomTextField(
              controller: _domicileAddressController,
            ),
            const SizedBox(height: 16),
            Text(
              '* PROVINSI',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CustomDropdown(
              value: _selectedDomicileProvince,
              options: provinces,
              onChanged: (value) {
                setState(() {
                  _selectedDomicileProvince = value;
                  _selectedDomicileCity = null;
                  _selectedDomicileDistrict = null;
                  _selectedDomicileVillage = null;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              '* KOTA/KABUPATEN',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CustomDropdown(
              value: _selectedDomicileCity,
              enabled: _selectedDomicileProvince != null,
              options: cities,
              onChanged: (value) {
                setState(() {
                  _selectedDomicileCity = value;
                  _selectedDomicileDistrict = null;
                  _selectedDomicileVillage = null;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              '* KECAMATAN',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CustomDropdown(
              value: _selectedDomicileDistrict,
              enabled: _selectedDomicileCity != null,
              options: villages,
              onChanged: (value) {
                setState(() {
                  _selectedDomicileDistrict = value;
                  _selectedDomicileVillage = null;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              '* KELURAHAN',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CustomDropdown(
              value: _selectedDomicileVillage,
              enabled: _selectedDomicileDistrict != null,
              options: villages,
              onChanged: (value) {
                setState(() {
                  _selectedDomicileVillage = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              '* KODE POS',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CustomTextField(
              controller: _postalCodeController,
              keyboardType: TextInputType.number,
            ),
          ],
        ],
      ),
    );
  }
}
