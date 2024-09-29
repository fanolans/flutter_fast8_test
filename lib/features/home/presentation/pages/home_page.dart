import 'package:flutter/material.dart';
import 'package:flutter_fast8_test/core/styles/app_colors.dart';
import 'package:flutter_fast8_test/shared/widgets/custom_appbar.dart';
import 'package:flutter_fast8_test/shared/widgets/custom_bottom_navbar.dart';

import '../widgets/custom_tab.dart';
import '../widgets/grid_section_category.dart';
import '../widgets/grid_section_product.dart';
import '../widgets/grid_section_wellness.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const CustomAppBar(
        userName: 'Farrel Nolan Syahdony',
        notificationCount: 1,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: const Column(
                children: [
                  CustomTab(),
                  GridSectionProduct(),
                  GridSectionCategory(),
                  GridSectionWellness(),
                ],
              ),
            ),
          ),
          const CustomBottomNavigationBar()
        ],
      ),
    );
  }
}
