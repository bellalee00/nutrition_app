import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmrResult extends StatelessWidget {
  final String jenisKelamin;
  final int usia;
  final double tinggi;
  final double beratBadan;

  BmrResult({
    required this.jenisKelamin,
    required this.usia,
    required this.tinggi,
    required this.beratBadan,
  });

  String formatKalori(double kalori) {
    return kalori.toStringAsFixed(2);
  }

  double hitungKalori() {
    if (jenisKelamin.toLowerCase() == 'laki-laki') {
      return (66 + (13.7 * beratBadan) + (5 * tinggi) - (6.8 * usia));
    } else if (jenisKelamin.toLowerCase() == 'wanita') {
      return (665 + (9.6 * beratBadan) + (1.8 * tinggi) - (4.7 * usia));
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double kalori = hitungKalori();
    String formattedKalori = formatKalori(kalori);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KALORI RESULT',
          style: GoogleFonts.quicksand(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF003ACE),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Jenis Kelamin: $jenisKelamin',
                      style: GoogleFonts.quicksand(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Usia: $usia tahun',
                      style: GoogleFonts.quicksand(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Tinggi: $tinggi cm',
                      style: GoogleFonts.quicksand(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Berat Badan: $beratBadan kg',
                      style: GoogleFonts.quicksand(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Kalori Harian Anda',
                  style: GoogleFonts.quicksand(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Center(
                child: Text(
                  '$formattedKalori kkal/Hari',
                  style: GoogleFonts.quicksand(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
