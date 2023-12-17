import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'bmr_result.dart';

class Bmr extends StatefulWidget {
  @override
  _BmrState createState() => _BmrState();
}

class _BmrState extends State<Bmr> {
  String jenisKelamin = '';
  int usia = 0;
  double tinggi = 0.0;
  double beratBadan = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KALKULATOR KALORI',
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Jenis Kelamin',
                          style: GoogleFonts.quicksand(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  jenisKelamin = 'Laki-laki';
                                });
                              },
                              icon: Icon(Icons.male),
                              label: Text('Laki-laki'),
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                foregroundColor: Colors.white,
                                backgroundColor: jenisKelamin == 'Laki-laki'
                                    ? Colors.green
                                    : Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  jenisKelamin = 'Wanita';
                                });
                              },
                              icon: Icon(Icons.female),
                              label: Text('Wanita'),
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                foregroundColor: Colors.white,
                                shadowColor: Colors.black,
                                backgroundColor: jenisKelamin == 'Wanita'
                                    ? Colors.green
                                    : Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Usia',
                          style: GoogleFonts.quicksand(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            usia = int.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            suffix: Text('th'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Tinggi Badan',
                          style: GoogleFonts.quicksand(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          cursorRadius: Radius.circular(10),
                          onChanged: (value) {
                            tinggi = double.tryParse(value) ?? 0.0;
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
                            beratBadan = double.tryParse(value) ?? 0.0;
                          },
                          decoration: InputDecoration(
                            suffix: Text('kg'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BmrResult(
                                    jenisKelamin: jenisKelamin,
                                    usia: usia,
                                    tinggi: tinggi,
                                    beratBadan: beratBadan,
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
