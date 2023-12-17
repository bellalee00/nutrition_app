import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/model/food_model.dart';
import '/service/food_service.dart';
import 'DetailFood.dart';

class FoodFormUpdate extends StatefulWidget {
  final Food food;
  const FoodFormUpdate({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodFormUpdate> createState() => _FoodFormUpdateState();
}

class _FoodFormUpdateState extends State<FoodFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _fotoFoodCtrl = TextEditingController();
  final _namaFoodCtrl = TextEditingController();
  final _kaloriFoodCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _fotoFoodCtrl.text = widget.food.foto;
      _namaFoodCtrl.text = widget.food.nama;
      _kaloriFoodCtrl.text = widget.food.kalori.toString();
    });
  }

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
          'EDIT MAKANAN',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Animate(
              effects: [ScaleEffect(delay: 300.ms)],
              child: Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Foto Makanan",
                        style: GoogleFonts.quicksand(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _fieldFotoMakanan(),
                      SizedBox(height: 20),
                      Text(
                        "Nama Makanan",
                        style: GoogleFonts.quicksand(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _fieldNamaMakanan(),
                      SizedBox(height: 20),
                      Text(
                        "Kalori Makanan",
                        style: GoogleFonts.quicksand(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _fieldKaloriMakanan(),
                      SizedBox(height: 20),
                      _tombolSimpan()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fieldFotoMakanan() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      controller: _fotoFoodCtrl,
    );
  }

  _fieldNamaMakanan() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      controller: _namaFoodCtrl,
    );
  }

  _fieldKaloriMakanan() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      keyboardType: TextInputType.number,
      controller: _kaloriFoodCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Food food = new Food(
            foto: _fotoFoodCtrl.text,
            nama: _namaFoodCtrl.text,
            kalori: int.parse(_kaloriFoodCtrl.text));

        String id = widget.food.id.toString();
        await ApiHelper().ubah(food, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => EditFood(food: value)));
        });
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF003ACE),
          foregroundColor: Colors.white,
          elevation: 5),
      child: Text(
        "SIMPAN",
        style: GoogleFonts.quicksand(fontSize: 16),
      ),
    );
  }
}
