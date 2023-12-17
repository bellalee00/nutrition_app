import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'MinumanList.dart';
import '/model/drink_model.dart';
import '/service/drink_service.dart';

class TambahDrink extends StatefulWidget {
  const TambahDrink({super.key});

  @override
  _TambahDrinkState createState() => _TambahDrinkState();
}

class _TambahDrinkState extends State<TambahDrink> {
  // final _formKey = GlobalKey<FormState>();
  final _fotoCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _kaloriCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003ACE),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'TAMBAH MINUMAN',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Animate(
            effects: [FadeEffect(delay: 250.ms)],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Foto Minuman',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _TextField(_fotoCtrl, 'Masukkan Link Foto'),
                SizedBox(height: 20),
                Text(
                  'Nama Minuman',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _TextField(_namaCtrl, 'Masukkan Nama Minuman'),
                SizedBox(height: 20),
                Text(
                  'Jumlah Kalori',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _TextField(_kaloriCtrl, 'Masukkan Jumlah Kalori'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    Drink drink = new Drink(
                        foto: _fotoCtrl.text,
                        nama: _namaCtrl.text,
                        kalori: int.parse(_kaloriCtrl.text));
                    await ApiHelper().simpan(drink).then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => DrinkList()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003ACE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.quicksand(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _TextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
