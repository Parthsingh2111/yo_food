import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/appscreens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff20164A),

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 132, 114, 204),
                Color.fromARGB(255, 75, 62, 130),
                Color.fromARGB(255, 22, 11, 66)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  blurRadius: 30,
                  spreadRadius: 10)
            ]),
        child: Center(
          child: InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut().whenComplete(
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                  );
            },
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 3,
                  ),
                  color: Colors.blueGrey,
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 132, 114, 204),
                      Color.fromARGB(255, 75, 62, 130),
                      Color.fromARGB(255, 22, 11, 66)
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 30,
                        spreadRadius: 10)
                  ]),
              child: Center(
                  child: InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  "logout",
                  style:
                      GoogleFonts.aclonica(fontSize: 50, color: Colors.black),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
