import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast8_test/features/profile/presentation/pages/profile_page.dart';

import '../../core/styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final int notificationCount;
  const CustomAppBar({
    super.key,
    required this.userName,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Malam',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
          ),
          Text(
            userName, // Nama pengguna
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              icon: const Icon(FluentIcons.alert_48_regular),
              color: Colors.white,
              onPressed: () {},
            ),
            if (notificationCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Badge.count(
                  count: notificationCount,
                  backgroundColor: Colors.red,
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14, left: 6),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ProfilePage();
                },
              ));
            },
            child: const CircleAvatar(
              child: Text('F'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
