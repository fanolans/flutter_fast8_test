import 'package:intl/intl.dart';

/// Fungsi untuk memformat angka menjadi format Rupiah
String formatterRupiah(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}
