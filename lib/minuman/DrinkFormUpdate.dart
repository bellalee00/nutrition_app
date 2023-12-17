import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/model/drink_model.dart';
import '/service/drink_service.dart';
import 'DetailDrink.dart';

class DrinkFormUpdate extends StatefulWidget {
  final Drink drink;
  const DrinkFormUpdate({Key? key, required this.drink}) : super(key: key);

  @override
  State<DrinkFormUpdate> createState() => _DrinkFormUpdateState();
}

class _DrinkFormUpdateState extends State<DrinkFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _fotoDrinkCtrl = TextEditingController();
  final _namaDrinkCtrl = TextEditingController();
  final _kaloriDrinkCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _fotoDrinkCtrl.text = widget.drink.foto;
      _namaDrinkCtrl.text = widget.drink.nama;
      _kaloriDrinkCtrl.text = widget.drink.kalori.toString();
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
          'EDIT MINUMAN',
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
            padding: const EdgeInsets.all(15.0),
            child: Animate(
              effects: [ScaleEffect(delay: 250.ms)],
              child: Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Foto Minuman",
                        style: GoogleFonts.quicksand(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _fieldFotoMakanan(),
                      SizedBox(height: 20),
                      Text(
                        "Nama Minuman",
                        style: GoogleFonts.quicksand(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      _fieldNamaMakanan(),
                      SizedBox(height: 20),
                      Text(
                        "Kalori Minuman",
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
      controller: _fotoDrinkCtrl,
    );
  }

  _fieldNamaMakanan() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      controller: _namaDrinkCtrl,
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
      controller: _kaloriDrinkCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Drink drink = new Drink(
            foto: _fotoDrinkCtrl.text,
            nama: _namaDrinkCtrl.text,
            kalori: int.parse(_kaloriDrinkCtrl.text));

        String id = widget.drink.id.toString();
        await ApiHelper().ubah(drink, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => EditDrink(drink: value)));
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => EditDrink(drink: drink)));
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
