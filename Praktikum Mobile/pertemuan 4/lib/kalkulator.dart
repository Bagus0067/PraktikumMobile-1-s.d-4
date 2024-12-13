import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String hasil = "";

  void calculate(String operation) {
    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        hasil = "Invalid input";
      });
      return;
    }

    double calculation;
    switch (operation) {
      case "+":
        calculation = num1 + num2;
        break;
      case "-":
        calculation = num1 - num2;
        break;
      case "*":
        calculation = num1 * num2;
        break;
      case "/":
        if (num2 == 0) {
          setState(() {
            hasil = "Cannot divide by zero";
          });
          return;
        }
        calculation = num1 / num2;
        break;
      default:
        return;
    }

    setState(() {
      hasil = "Hasil: $calculation";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemilihan Perhitungan"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Angka 1",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Angka 2",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculate("+"),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("-"),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("*"),
                  child: const Text("*"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("/"),
                  child: const Text("/"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              hasil,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
