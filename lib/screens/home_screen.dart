import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;  // Menerima parameter username

  HomeScreen({required this.username});  // Constructor untuk menerima nama pengguna

  // Daftar makanan hanya dengan Mie Ayam, Nasi Goreng, dan Sate Ayam
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Nasi Goreng',
      'price': 'Rp 20.000',
      'image': 'assets/images/nasi_goreng.png',
    },
    {
      'name': 'Mie Ayam',
      'price': 'Rp 15.000',
      'image': 'assets/images/mie_ayam.png',
    },
    {
      'name': 'Sate Ayam',
      'price': 'Rp 25.000',
      'image': 'assets/images/sate_ayam.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  // Menghilangkan tombol back default
        backgroundColor: Colors.white,     // Set warna latar belakang AppBar
        elevation: 0,                      // Menghilangkan bayangan AppBar
        toolbarHeight: 100,                // Tinggi AppBar yang lebih besar
        title: Row(
          children: [
            // Foto profil di sebelah kiri pada AppBar
            CircleAvatar(
              radius: 30,  // Ukuran radius foto profil
              backgroundImage: AssetImage('assets/images/profile_picture.png'),  // Ganti dengan gambar di assets
            ),
            SizedBox(width: 16),  // Jarak antara foto profil dan teks ucapan
            // Ucapan selamat pagi dan username dalam satu baris (Row)
            Row(
              children: [
                Text(
                  'Selamat Pagi, ',  // Teks ucapan selamat pagi
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,  // Warna teks
                  ),
                ),
                Text(
                  username,  // Nama pengguna dari login
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,  // Warna teks
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16), // Jarak antara AppBar dan gambar makanan
            // Tambahkan gambar makanan besar dengan border halus
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),  // Border halus
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,  // Warna bayangan
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),  // Posisi bayangan
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,  // Agar border radius diterapkan
              child: Image.asset(
                'assets/images/food_image.png',  // Gambar makanan besar dari assets
                height: 200,  // Tinggi gambar
                width: double.infinity,  // Lebar gambar mengikuti layar
                fit: BoxFit.cover,  // Memastikan gambar penuh dalam kontainer
              ),
            ),
            SizedBox(height: 16), // Jarak antara gambar besar dan ListView
            Text(
              'Menu Makanan:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // ListView untuk menampilkan makanan dan harganya
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = foodItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 12), // Jarak antar item lebih besar
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),  // Border halus pada card
                    ),
                    elevation: 4,  // Bayangan lebih jelas pada card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Padding dalam card
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar makanan dengan border halus
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),  // Border halus pada gambar
                            child: Image.asset(
                              foodItem['image']!,  // Gambar makanan
                              width: 80,  // Lebar gambar lebih besar
                              height: 80,  // Tinggi gambar lebih besar
                              fit: BoxFit.cover,  // Memastikan gambar penuh dalam kontainer
                            ),
                          ),
                          SizedBox(width: 16),  // Jarak antara gambar dan teks
                          // Nama makanan dan harga
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodItem['name']!,  // Nama makanan
                                style: TextStyle(
                                  fontSize: 20,  // Memperbesar ukuran teks
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),  // Jarak antara nama dan harga
                              Text(
                                foodItem['price']!,  // Harga makanan
                                style: TextStyle(
                                  fontSize: 18,  // Ukuran teks harga juga diperbesar
                                  color: Colors.green[700],  // Warna hijau untuk harga
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // FloatingActionButton untuk tombol tambah
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi yang akan dilakukan saat tombol tambah ditekan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tambah makanan baru!')),
          );
        },
        child: Icon(Icons.add),  // Ikon tambah
        backgroundColor: Colors.green,  // Warna tombol
      ),
    );
  }
}
