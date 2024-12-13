import 'package:flutter/material.dart';

class GajiModel {
  String? golongan;
  String? status;
  int masakerja = 0;

  int tunjGapok() {
    int tunjangan = 0;
    if (golongan == "I") {
      tunjangan = 2500000;
    } else if (golongan == "II") {
      tunjangan = 3000000;
    } else if (golongan == "III") {
      tunjangan = 3500000;
    } else {
      tunjangan = 4000000;
    }
    return tunjangan;
  }

  int tunjStatus() {
    int tunjangan = 0;
    if (status == "Menikah") {
      tunjangan = 1000000;
      if (masakerja > 5) {
        tunjangan += 500000;
      }
    } else {
      tunjangan = 500000;
    }
    return tunjangan;
  }

  int totalGaji() {
    return tunjGapok() + tunjStatus();
  }
}

class GajiScreen extends StatefulWidget {
  @override
  _GajiScreenState createState() => _GajiScreenState();
}

class _GajiScreenState extends State<GajiScreen> {
  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController masaKerjaController = TextEditingController();

  String? selectedGolongan;
  String? selectedStatus;

  String result = "";

  void hitungGaji() {
    GajiModel pegawai = GajiModel();

    pegawai.golongan = selectedGolongan;
    pegawai.status = selectedStatus;
    pegawai.masakerja = int.tryParse(masaKerjaController.text) ?? 0;

    setState(() {
      result = """
NIP: ${nipController.text}
Nama: ${namaController.text}
Golongan: ${pegawai.golongan}
Status: ${pegawai.status}
Masa Kerja: ${pegawai.masakerja} tahun
Tunjangan Gaji Pokok: Rp${pegawai.tunjGapok()}
Tunjangan Status: Rp${pegawai.tunjStatus()}
Total Gaji: Rp${pegawai.totalGaji()}
      """;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penghitungan Gaji"),
        backgroundColor: const Color.fromARGB(255, 3, 145, 3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nipController,
                decoration: const InputDecoration(
                  labelText: "NIP Pegawai",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Pegawai",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGolongan,
                onChanged: (value) {
                  setState(() {
                    selectedGolongan = value;
                  });
                },
                items: ["I", "II", "III", "IV"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "Golongan",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
                items: ["Menikah", "Belum Menikah"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "Status",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: masaKerjaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Masa Kerja (tahun)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: hitungGaji,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 158, 8),
                ),
                child: const Text("Hitung Gaji"),
              ),
              const SizedBox(height: 16),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
