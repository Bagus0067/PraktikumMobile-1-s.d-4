import 'package:flutter/material.dart';
import 'image01.dart'; // Pastikan file ini ada di direktori yang sama

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Praktikum 03',
      home: Image01(),
    );
  }
}
