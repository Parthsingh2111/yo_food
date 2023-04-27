import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_app/models/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/screens/appscreens/otp_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_screen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  var phone = "";
  //var emailController = TextEditingController();
//   var otp = '';

//   var varifID = 'verifID';

//  var otpController = TextEditingController();

//  FirebaseAuth auth = FirebaseAuth.instance;

//  sendOtp({Phone}) async {
//     await auth.verifyPhoneNumber(
//         phoneNumber: Phone,
//         verificationCompleted: (phoneAuthCredential) async {
//           await auth.signInWithCredential(phoneAuthCredential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.toString());
//         },
//         codeSent: (String? verificationId, int? resendTocken) {
//           varifID = verificationId.toString();
//         },
//         codeAutoRetrievalTimeout: (value) {});
//   }

//   loginMethod()async{
//     try {
//        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: varifID, smsCode: otpController.text);
//  await auth.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       print(e.toString());
//     }

//   }

  var phoneController = TextEditingController();

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
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Align(
                    // AlignmentGeometry alignment = Alignment.center,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Enter your",
                      style: GoogleFonts.aclonica(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "mobile number",
                      style: GoogleFonts.aclonica(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        //  obscureText: obscuretheText,
                        //    controller: controller,
                        cursorColor: Colors.yellow,
                        cursorHeight: 22,

                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.orange),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefix: const Text("+91)"),
                          prefixIcon: const Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.phone,
                              color: Colors.orange,
                            ),
                          ),
                          hintText: "Enter your mobile number",
                          hintStyle: GoogleFonts.aclonica(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "WE will send you confirmation code",
                      style: GoogleFonts.aclonica(
                          color: Colors.black,
                          //  fontWeight: FontWeight.,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: defaultBorderRadius,
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
                    width: 150,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Center(
                          child: InkWell(
                        onTap: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: "+91${phoneController.text}",
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              // Navigator.pushNamed(context, '/verify');
                              PhoneScreen.verify = verificationId;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpScreen()),
                              );
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        },
                        // {

                        // },
                        child: Text(
                          //   "New User? Sign up",
                          "Next",
                          style: GoogleFonts.aclonica(
                              color: Colors.orange,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
