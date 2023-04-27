import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/appscreens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/customTextField.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var cpassController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/foodprotrait.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              //I blured the parent container to blur background image, you can get rid of this part
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  //you can change opacity with color here(I used black) for background.
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextField(
                        hint: "Name",
                        hintStyle: GoogleFonts.aclonica(
                          color: Colors.white.withOpacity(0.7),
                        ),
                        obscuretheText: false,
                        keyboard: TextInputType.name,
                        picon: const Icon(Icons.person, color: Colors.orange),
                        mycontroller: nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextField(
                          hint: "Email",
                          hintStyle: GoogleFonts.aclonica(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          obscuretheText: false,
                          keyboard: TextInputType.emailAddress,
                          picon: const Icon(Icons.email, color: Colors.orange),
                          mycontroller: emailController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextField(
                          hint: "Password",
                          hintStyle: GoogleFonts.aclonica(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          obscuretheText: true,
                          keyboard: TextInputType.visiblePassword,
                          picon:
                              const Icon(Icons.password, color: Colors.orange),
                          mycontroller: passController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextField(
                          hint: "confirm Password",
                          hintStyle: GoogleFonts.aclonica(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          obscuretheText: true,
                          keyboard: TextInputType.visiblePassword,
                          picon: const Icon(
                            Icons.password,
                            color: Colors.orange,
                          ),
                          mycontroller: cpassController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        width: 150,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Center(
                            child: InkWell(
                          onTap: () async {
                            if (cpassController.text == passController.text) {
                              try {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passController.text)
                                    .then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen())));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                                print('error' + e.code.toString());
                              } catch (e) {
                                print('error' + e.toString());
                              }
                            }
                            else{
                              
                            }
                          },
                          child: Text(
                            "Signup",
                            style: GoogleFonts.aclonica(
                                color: Colors.orange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
