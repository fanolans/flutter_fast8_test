class Product {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double discount;

  Product({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.discount,
  });
}

List<Product> dummyProducts = [
  Product(
    title: 'Produk A',
    description:
        'Produk A adalah solusi sempurna untuk kebutuhan sehari-hari Anda. Didesain dengan inovasi terbaru, Produk A memberikan performa yang sangat baik dan efisiensi yang optimal. Dengan bahan berkualitas tinggi, produk ini menjamin daya tahan dan keandalan untuk digunakan dalam waktu lama.',
    imageUrl:
        'https://assets.indomaret.co.id/images/indomaret/meta/meta_home_07122021105655.jpg',
    price: 200000,
    discount: 10,
  ),
  Product(
    title: 'Produk B',
    description:
        'Dengan desain yang modern dan fungsional, Produk B adalah pilihan ideal bagi Anda yang menginginkan sesuatu yang lebih dari sekedar produk biasa. Dengan fitur yang mudah digunakan dan hasil yang memuaskan, Produk B adalah teman setia dalam setiap aktivitas Anda. Nikmati pengalaman menggunakan produk yang dibuat dengan perhatian terhadap detail.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Grab_Logo.svg/1200px-Grab_Logo.svg.png',
    price: 150000,
    discount: 0,
  ),
  Product(
    title: 'Produk C',
    description:
        'Produk C menawarkan kombinasi sempurna antara gaya dan fungsi. Dengan tampilan yang elegan dan berbagai fitur canggih, produk ini dirancang untuk memenuhi kebutuhan konsumen modern. Apakah Anda mencari kepraktisan atau estetika, Produk C mampu memberikan keduanya dengan sangat baik.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Grab_Logo.svg/1200px-Grab_Logo.svg.png',
    price: 300000,
    discount: 15,
  ),
  Product(
    title: 'Produk D',
    description:
        'Dengan performa tinggi dan teknologi mutakhir, Produk D menjadi pilihan utama bagi Anda yang ingin meningkatkan efisiensi dan produktivitas. Produk ini tidak hanya mudah digunakan, tetapi juga memberikan hasil yang memuaskan di setiap kesempatan. Jadikan Produk D sebagai bagian dari rutinitas harian Anda dan rasakan perbedaannya.',
    imageUrl:
        'https://assets.indomaret.co.id/images/indomaret/meta/meta_home_07122021105655.jpg',
    price: 250000,
    discount: 20,
  ),
  Product(
    title: 'Produk E',
    description:
        'Produk E adalah inovasi terbaru yang dirancang untuk memenuhi kebutuhan pelanggan dengan standar tertinggi. Dikenal dengan kualitasnya yang tak tertandingi dan performa yang handal, Produk E siap menjadi solusi untuk berbagai tantangan sehari-hari. Investasikan pada Produk E dan nikmati keuntungannya yang luar biasa.',
    imageUrl:
        'https://assets.indomaret.co.id/images/indomaret/meta/meta_home_07122021105655.jpg',
    price: 180000,
    discount: 8,
  ),
  Product(
    title: 'Produk D',
    description:
        'Produk D adalah inovasi terbaru yang dirancang untuk memenuhi kebutuhan pelanggan dengan standar tertinggi. Dikenal dengan kualitasnya yang tak tertandingi dan performa yang handal, Produk D siap menjadi solusi untuk berbagai tantangan sehari-hari. Investasikan pada Produk D dan nikmati keuntungannya yang luar biasa.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Grab_Logo.svg/1200px-Grab_Logo.svg.png',
    price: 15000,
    discount: 0,
  ),
];
