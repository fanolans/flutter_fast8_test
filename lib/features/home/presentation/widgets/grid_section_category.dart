import 'package:flutter/material.dart';
import 'package:flutter_fast8_test/core/styles/app_colors.dart';

import '../../../../core/constants/assets.dart';
import 'grid_item.dart';

class GridSectionCategory extends StatelessWidget {
  const GridSectionCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  'Kategori Pilihan',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Wishlist',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 5),
                    Badge.count(
                      count: 0,
                      backgroundColor: AppColors.primary,
                    )
                  ],
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 2,
            childAspectRatio: 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            children: [
              GridItem(
                title: 'Hobi',
                svgPath: Assets.iconHobi,
                onTap: () {},
              ),
              GridItem(
                title: 'Merchandise',
                svgPath: Assets.iconMerchandise,
                onTap: () {},
              ),
              GridItem(
                title: 'Gaya Hidup Sehat',
                svgPath: Assets.iconGayaHidupSehat,
                onTap: () {},
              ),
              GridItem(
                title: 'Konseling & Rohani',
                svgPath: Assets.iconKonselingRohani,
                onTap: () {},
              ),
              GridItem(
                title: ' Self Development',
                svgPath: Assets.iconSelfDevelopment,
                onTap: () {},
              ),
              GridItem(
                title: ' Perencanaan Keuangan',
                svgPath: Assets.iconPerencanaanKeuangan,
                onTap: () {},
              ),
              GridItem(
                title: 'Konsultasi Medis',
                svgPath: Assets.iconKonsultasiMedis,
                onTap: () {},
              ),
              GridItem(
                title: 'Lihat Semua',
                svgPath: Assets.iconLihatSemua,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
