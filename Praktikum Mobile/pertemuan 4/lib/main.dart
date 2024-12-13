import 'package:flutter/material.dart';
import 'gaji.dart'; // Import file gaji.dart
import 'BagianInformasi.dart'; // Import file BagianInformasi.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Penghitungan Gaji'),
        backgroundColor: const Color.fromARGB(255, 0, 175, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Aplikasi Penghitungan Gaji',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman perhitungan gaji
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GajiScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 153, 13),
              ),
              child: const Text('Hitung Gaji'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman informasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BagianInformasi()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 12, 145, 19),
              ),
              child: const Text('Bagian Informasi'),
            ),
          ],
        ),
      ),
    );
  }
}
