import 'package:flutter/material.dart';
import 'package:food_app/models/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/screens/appscreens/home_screen.dart';
import 'package:food_app/screens/appscreens/phone_entry_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/customTextField.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  //var emailController = TextEditingController();
  // var passController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius / 2),
              child: Image.asset(
                "assets/images/foodprotrait.jpg",
                height: MediaQuery.of(context).size.height, //for giving height
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextField(
                  mycontroller: emailController,
                  hint: 'Enter your Email',
                  obscuretheText: false,
                  keyboard: TextInputType.emailAddress,
                  picon: const Icon(Icons.email, color: Colors.orange),
                  hintStyle: GoogleFonts.aclonica(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                    mycontroller: passwordController,
                    obscuretheText: true,
                    //  controller: passController,
                    hint: 'Enter your password',
                    hintStyle: GoogleFonts.aclonica(
                      color: Colors.white.withOpacity(0.7),
                    ),
                    keyboard: TextInputType.visiblePassword,
                    picon: const Icon(Icons.password, color: Colors.orange)),
                const SizedBox(
                  height: defaultBorderRadius,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        print("USER SUCCESSFULLY SIGNED UP");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Center(
                        child: Text("Sign in",
                            style: GoogleFonts.aclonica(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpScreen())); // for pushing in to different page

                    // Navigator.pop(context);  --- for back button
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        border: Border.all(color: Colors.white, width: 3)),
                    child: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Center(
                        child: Text(
                          "New User? Sign up",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const PhoneScreen()),
                      ),
                    );
                  },
                  child: const Text(
                    "Signin Using Phone Number",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text, password: passwordController.text);
  // }
}
