import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nutrition_app/makanan/FoodList.dart';
import 'package:nutrition_app/model/food_model.dart';
import '../service/food_service.dart';

class TambahFood extends StatefulWidget {
  const TambahFood({super.key});

  @override
  _TambahFoodState createState() => _TambahFoodState();
}

class _TambahFoodState extends State<TambahFood> {
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
          'TAMBAH MAKANAN',
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
                  'Foto Makanan',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _TextField(_fotoCtrl, 'Masukkan Link Foto'),
                SizedBox(height: 20),
                Text(
                  'Nama Makanan',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _TextField(_namaCtrl, 'Masukkan Nama Makanan'),
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
                    Food food = new Food(
                        foto: _fotoCtrl.text,
                        nama: _namaCtrl.text,
                        kalori: int.parse(_kaloriCtrl.text));
                    await ApiHelper().simpan(food).then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => FoodList()));
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








// class TambahFood extends StatefulWidget {
//   final Function(String, int) onFoodAdded;

//   TambahFood({required this.onFoodAdded});

//   @override
//   _TambahFoodState createState() => _TambahFoodState();
// }

// class _TambahFoodState extends State<TambahFood> {
//   late TextEditingController _namaMakananController;
//   late TextEditingController _jumlahKaloriController;

//   @override
//   void initState() {
//     super.initState();
//     _namaMakananController = TextEditingController();
//     _jumlahKaloriController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _namaMakananController.dispose();
//     _jumlahKaloriController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF003ACE),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           'TAMBAH MAKANAN',
//           style: GoogleFonts.quicksand(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Nama Makanan',
//                 style: GoogleFonts.quicksand(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               _TextField(_namaMakananController, 'Masukkan Nama Makanan'),
//               SizedBox(height: 20),
//               Text(
//                 'Jumlah Kalori',
//                 style: GoogleFonts.quicksand(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               _TextField(_jumlahKaloriController, 'Masukkan Jumlah Kalori'),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   String namaMakanan = _namaMakananController.text;
//                   int jumlahKalori =
//                       int.tryParse(_jumlahKaloriController.text) ?? 0;
//                   // Post data makanan ke API
//                   try {
//                     await ApiHelper.addFood(namaMakanan, jumlahKalori);
//                     // Panggil callback untuk menambahkan data ke FoodList.dart
//                     widget.onFoodAdded(namaMakanan, jumlahKalori);
//                     Navigator.pop(context);
//                   } catch (e) {
//                     print('Error posting food: $e');
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFF003ACE),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Text(
//                     'Submit',
//                     style: GoogleFonts.quicksand(
//                         fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _TextField(TextEditingController controller, String hintText) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       ),
//     );
//   }
// }
