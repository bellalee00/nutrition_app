import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_view/profile_view.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'login/login.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inisiasi Format Waktu Indo
    initializeDateFormatting('id_ID');

    DateTime now = DateTime.now();
    String Time = DateFormat('EEEE, d MMMM y - HH:mm', 'id_ID').format(now);

    return Drawer(
      backgroundColor: Colors.blueAccent,
      child: ListView(
        padding: EdgeInsets.only(top: 25),
        children: [
          ProfileView(
            height: 150,
            width: 50,
            circle: true,
            borderRadius: 20,
            image: NetworkImage(
                "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg"),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Text(
                "Admin",
                style: GoogleFonts.quicksand(fontSize: 20, color: Colors.white),
              ),
              Text(
                "admin@gmail.com",
                style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
                height: 20,
                indent: 20,
                endIndent: 20,
              ),
              Text(
                Time,
                style: GoogleFonts.quicksand(fontSize: 15, color: Colors.white),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
                height: 20,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.quicksand(fontSize: 16, color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
