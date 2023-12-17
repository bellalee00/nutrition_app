import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/bmi/bmi.dart';
import '/bmr/bmr.dart';
import '/makanan/FoodList.dart';
import '/minuman/MinumanList.dart';
import 'sidebar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? tombolBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Welcome, Admin',
          style: GoogleFonts.quicksand(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(0, 58, 206, 1),
        foregroundColor: Colors.white,
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (tombolBack == null ||
              DateTime.now().difference(tombolBack!) > Duration(seconds: 2)) {
            tombolBack = DateTime.now();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text('Tekan sekali lagi untuk keluar'),
                ),
              ),
            );
            return false;
          }
          SystemNavigator.pop();
          return true;
        },
        child: Container(
          child: Column(
            children: [
              Animate(
                effects: [SlideEffect(duration: 500.ms)],
                child: Container(
                  width: double.infinity,
                  height: 270,
                  color: Color.fromRGBO(0, 58, 206, 1),
                  child: Center(
                    child: Lottie.asset(
                      'assets/home.json',
                      width: 500,
                      height: 300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodList(),
                              ),
                            );
                          },
                          child: _Menu(
                            'assets/food.png',
                            'MAKANAN KALORI',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bmr(),
                              ),
                            );
                          },
                          child: _Menu(
                            'assets/kalori.png',
                            'CALC KALORI',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DrinkList(),
                              ),
                            );
                          },
                          child: _Menu(
                            'assets/minuman.png',
                            'MINUMAN KALORI',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bmi(),
                              ),
                            );
                          },
                          child: _Menu(
                            'assets/bmi.png',
                            'BMI KALKULATOR',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Menu(String imagePath, String title) {
    return Animate(
      effects: [FadeEffect(), ScaleEffect(duration: 500.ms)],
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: 135,
            height: 135,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
