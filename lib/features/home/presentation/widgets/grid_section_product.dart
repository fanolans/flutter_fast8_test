import 'package:flutter/material.dart';
import '../../../../core/constants/assets.dart';
import 'grid_item.dart';

class GridSectionProduct extends StatelessWidget {
  const GridSectionProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
        bottom: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Produk Keuangan',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
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
                isNew: true,
                title: 'Urun',
                svgPath: Assets.iconUrun,
                onTap: () {},
              ),
              GridItem(
                title: 'Pembiayaan Porsi Haji',
                svgPath: Assets.iconPembiayaanHaji,
                onTap: () {},
              ),
              GridItem(
                title: 'Financial Checkup',
                svgPath: Assets.iconFinancialCheckup,
                onTap: () {},
              ),
              GridItem(
                title: 'Asuransi Mobil',
                svgPath: Assets.iconAsuransiMobil,
                onTap: () {},
              ),
              GridItem(
                title: 'Asuransi Properti',
                svgPath: Assets.iconAsuransiProperti,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
