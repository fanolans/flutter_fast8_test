import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  bool isPayungPribadiSelected = true;
  bool isPayungKaryawanSelected = false;

  void _onTabTapped(String tab) {
    setState(() {
      if (tab == 'Payung Pribadi') {
        isPayungPribadiSelected = true;
        isPayungKaryawanSelected = false;
      } else {
        isPayungKaryawanSelected = true;
        isPayungPribadiSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _onTabTapped('Payung Pribadi'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isPayungPribadiSelected
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Payung Pribadi',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: () => _onTabTapped('Payung Karyawan'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isPayungKaryawanSelected
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Payung Karyawan',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
