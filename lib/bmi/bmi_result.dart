import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import '/bmi/bmi.dart';

class BmiResult extends StatelessWidget {
  const BmiResult(
      {super.key, required this.tinggi_badan, required this.berat_badan});

  final int tinggi_badan;
  final int berat_badan;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    String cBMI;
    if (bmi >= 28)
      cBMI = "Obesitas";
    else if (bmi >= 23)
      cBMI = "Overweight";
    else if (bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF003ACE),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Bmi()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            'BMI RESULT',
            style: GoogleFonts.quicksand(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              cBMI,
              style: GoogleFonts.quicksand(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: GoogleFonts.quicksand(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            Text(
              '17.5 - 22.9 ',
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
