import 'package:flutter/material.dart';
import 'home_screen.dart';  // Import halaman HomeScreen
import 'package:flutter/gestures.dart';  // Paket untuk TapGestureRecognizer

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isVisible = false;

  // Controller untuk mengambil input dari username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  // Controller untuk password

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Memastikan seluruh konten bisa di-scroll
          child: Column(
            children: [
              // Menghapus CircleAvatar, mengganti dengan gambar PNG biasa
              Container(
                height: deviceHeight * 0.30,
                child: Image.asset(
                  'assets/images/burger.png',  // Ganti dengan file gambar PNG Anda
                  fit: BoxFit.cover,  // Menyesuaikan gambar sesuai ukuran kontainer
                  width: 200, // Ukuran lebar gambar
                ),
              ),
              Container(
                height: deviceHeight * 0.65,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login Now',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.06, // Mengurangi jarak vertikal di sini
                      ),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding( // Tambahkan padding di sini untuk username TextField
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              controller: _usernameController,  // Menggunakan controller
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your username',  // Ubah hint menjadi username
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.015, // Mengurangi jarak vertikal di sini
                      ),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15), // Padding yang konsisten dengan username TextField
                          child: Center(
                            child: TextField(
                              controller: _passwordController,  // Controller untuk password
                              obscureText: !_isVisible,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.015, // Mengurangi jarak vertikal di sini
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        child: TextButton(
                          onPressed: () {
                            print('Forgot Password clicked');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.03, // Mengurangi jarak vertikal di sini
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Ambil username dan password dari input
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            // Cek apakah password kosong
                            if (password.isEmpty) {
                              // Tampilkan SnackBar jika password kosong
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Password harus diisi!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Jika password terisi, navigasi ke HomeScreen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(username: username),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),  // Ubah warna menjadi putih
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,  // Mengganti warna tombol menjadi hijau
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.015, // Mengurangi jarak vertikal di sini
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Don\'t Have an Account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Aksi saat 'Register' di-klik
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
