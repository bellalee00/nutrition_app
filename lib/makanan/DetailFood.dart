import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutrition_app/makanan/FoodFormUpdate.dart';
import 'package:nutrition_app/makanan/FoodList.dart';
import 'package:nutrition_app/model/food_model.dart';
import 'package:nutrition_app/service/food_service.dart';

class EditFood extends StatefulWidget {
  final Food food;
  const EditFood({super.key, required this.food});
  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  Stream<Food> getData() async* {
    Food data = await ApiHelper().getById(widget.food.id.toString());
    yield data;
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
          'DETAIL MAKANAN',
          style: GoogleFonts.quicksand(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
            stream: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return Text('Data Tidak Ditemukan');
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransparentImageCard(
                    imageProvider: NetworkImage(snapshot.data!.foto),
                    width: 250,
                    title: Center(
                      child: Text(
                        "${snapshot.data!.nama}",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    description: Center(
                      child: Text(
                        "${snapshot.data!.kalori} kkal",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ), // Set the height of the image
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _tombolUbah(),
                      SizedBox(width: 30),
                      _tombolHapus(),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => Animate(
        effects: [FadeEffect(delay: 250.ms)],
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodFormUpdate(food: snapshot.data),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              elevation: 5),
          child: Text(
            "UBAH",
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ),
      ),
    );
  }

  _tombolHapus() {
    return Animate(
      effects: [FadeEffect(delay: 250.ms)],
      child: ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              StreamBuilder(
                stream: getData(),
                builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                  onPressed: () async {
                    await ApiHelper().hapus(snapshot.data).then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodList(),
                        ),
                      );
                    });
                  },
                  child: Text("YA"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Tidak"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
              ),
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style:
            ElevatedButton.styleFrom(backgroundColor: Colors.red, elevation: 5),
        child: Text(
          "HAPUS",
          style: GoogleFonts.quicksand(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
