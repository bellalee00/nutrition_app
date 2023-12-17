import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = false;

  @override
  Widget build(BuildContext context) {
    myColor = Color(0xFF003ACE);
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.3), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 100, child: _bagianTop()),
          Positioned(bottom: 0, child: _bagianBottom()),
        ]),
      ),
    );
  }

  Widget _bagianTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Animate(
        effects: [FadeEffect(delay: 400.ms)],
        child: Column(
          children: [
            Icon(
              Icons.door_front_door_outlined,
              size: 150,
              color: Color.fromARGB(255, 221, 221, 221),
            ),
            Text(
              "KELOMPOK 2",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 2),
            )
          ],
        ),
      ),
    );
  }

  Widget _bagianBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Animate(
        effects: [FadeEffect(delay: 600.ms)],
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
          child: Padding(
            padding: EdgeInsets.all(35.0),
            child: _Form(),
          ),
        ),
      ),
    );
  }

  Widget _Form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Halaman Login",
            style: GoogleFonts.quicksand(
              color: myColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 40),
        _TextGrey("Username"),
        _inputField(usernameController),
        SizedBox(height: 40),
        _TextGrey("Password"),
        _inputField(passwordController, isPassword: true),
        SizedBox(height: 20),
        _ButtonLogin(),
      ],
    );
  }

  Widget _TextGrey(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(color: Colors.grey),
    );
  }

  Widget _inputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                    tampilPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    tampilPassword = !tampilPassword;
                  });
                },
              )
            : null,
      ),
      obscureText: isPassword && !tampilPassword,
    );
  }

  Widget _ButtonLogin() {
    return ElevatedButton(
      onPressed: () {
        String Username = usernameController.text;
        String Password = passwordController.text;

        if (Username == "admin" && Password == "admin") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
          _alertSukses();
        } else {
          _alertGagal();
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        backgroundColor: Color(0xFF003ACE),
        minimumSize: const Size.fromHeight(60),
      ),
      child: Text(
        "MASUK",
        style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),
      ),
    );
  }

  void _alertGagal() {
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Oops...",
            text: "Login Gagal"));
  }

  void _alertSukses() {
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Success..",
            text: "Login Berhasil"));
  }
}
