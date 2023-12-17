import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/home.dart';
import 'bmi_result.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  int tinggi = 0;
  int berat = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003ACE),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'KALKULATOR BMI',
          style: GoogleFonts.quicksand(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Animate(
                effects: [ScaleEffect(duration: 400.ms)],
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Tinggi Badan',
                          style: GoogleFonts.quicksand(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            tinggi = int.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            suffix: Text('cm'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Berat Badan',
                          style: GoogleFonts.quicksand(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            berat = int.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            suffix: Text('kg'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BmiResult(
                                    tinggi_badan: tinggi,
                                    berat_badan: berat,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'HITUNG',
                              style: GoogleFonts.quicksand(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF003ACE),
                                foregroundColor: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
