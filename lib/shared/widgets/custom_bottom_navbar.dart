import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast8_test/core/styles/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': FluentIcons.home_12_regular, 'title': 'Beranda'},
      {'icon': FluentIcons.search_12_regular, 'title': 'Cari'},
      {'icon': FluentIcons.cart_16_regular, 'title': 'Keranjang'},
      {'icon': FluentIcons.money_16_regular, 'title': 'Daftar Transaksi'},
      {
        'icon': FluentIcons.ticket_horizontal_20_regular,
        'title': 'Voucher Saya'
      },
      {'icon': FluentIcons.location_12_regular, 'title': 'Alamat Pengiriman'},
      {'icon': FluentIcons.group_20_regular, 'title': 'Daftar Teman'},
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.12,
      minChildSize: 0.12,
      maxChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                spreadRadius: 2,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 4,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            menuItems[index]['icon'],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            menuItems[index]['title'],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
