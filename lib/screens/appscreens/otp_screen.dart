import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_app/models/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/screens/appscreens/home_screen.dart';
import 'package:food_app/screens/appscreens/phone_entry_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
//import '../components/customTextField.dart';
import 'sign_up_screen.dart';
//import 'package:food_app/screens/models/signup_page.dart';

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);
  late String serviceName;
  var phone;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  //var emailController = TextEditingController();
  late String serviceNameTemp = widget.serviceName;

  late var getPhone = widget.phone;

  var otpController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to exit?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: SafeArea(
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
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Align(
                      // AlignmentGeometry alignment = Alignment.center,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Enter the code sent",
                        style: GoogleFonts.aclonica(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "to your Phone",
                        style: GoogleFonts.aclonica(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        //  border: Border.all(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Pinput(
                        length: 6,
                        controller: otpController,
                      )
                      // child: Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Center(
                      //     child: TextField(
                      //       keyboardType: TextInputType.phone,
                      //       //  obscureText: obscuretheText,
                      //       //    controller: controller,
                      //       cursorColor: Colors.yellow,
                      //       cursorHeight: 22,

                      //       textAlign: TextAlign.start,
                      //       style: const TextStyle(color: Colors.orange),
                      //       decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           prefixIcon: const Align(
                      //             widthFactor: 1.0,
                      //             heightFactor: 1.0,
                      //             child: Icon(
                      //               Icons.phone,
                      //               color: Colors.orange,
                      //             ),
                      //           ),
                      //           hintText: "Enter your mobile number",
                      //           hintStyle: GoogleFonts.aclonica(
                      //               color: Colors.white.withOpacity(0.7))),
                      //     ),
                      //   ),
                      // ),
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
                        "WE sent you confirmation code",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhoneScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Center(
                                child: Text(
                              //   "New User? Sign up",
                              "Resend",
                              style: GoogleFonts.aclonica(
                                  color: Colors.orangeAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: PhoneScreen.verify,
                                    smsCode: otpController.text);

                            // Sign the user in (or link) with the credential
                            await auth
                                .signInWithCredential(credential)
                                .whenComplete(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            });
                            // PersistentNavBarNavigator.pushNewScreen(
                            //   context,
                            //   screen: SmsConfirm(phone: this.getPhone,serviceName:serviceNameTemp),
                            //   withNavBar: true,
                            //   pageTransitionAnimation: PageTransitionAnimation.cupertino,// OPTIONAL VALUE. True by default.

                            // );
                          } catch (e) {
                            print("wrong otp");
                          }
                        },
                        //  {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               SignUpPage())); // for pushing in to different page

                        //   // Navigator.pop(context);  --- for back button
                        // },
                        child: Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Center(
                                child: Text(
                              //   "New User? Sign up",
                              "Next",
                              style: GoogleFonts.aclonica(
                                  color: Colors.orangeAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
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
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PhoneScreen()));
                        },
                        child: Text(
                          //   "New User? Sign up",
                          "Change number ?",
                          style: GoogleFonts.aclonica(
                            color: Colors.blue,
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
