import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _animateSplash();
  }

  _animateSplash() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      opacityLevel = 1.0;
    });

    await Future.delayed(Duration(seconds: 4));

    // Navigasi ke Home
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003ACE),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/splash.json',
                width: 500,
                height: 200,
              ),
              SizedBox(height: 16),
              Text(
                'NUTRITION APPS',
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Lottie.asset(
                'assets/loading.json',
                width: 250,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
