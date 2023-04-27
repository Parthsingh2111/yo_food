import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/provider/function_class.dart';
import 'package:food_app/screens/appscreens/login_screen.dart';
import 'package:food_app/screens/appscreens/pay_summary_screen.dart';
import 'package:food_app/screens/appscreens/selectedcart_screen.dart';
import 'package:food_app/screens/appscreens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartFun(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          
          title: 'YO FOOD',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
            primarySwatch: Colors.orange,
          ),
          // theme: ThemeData.dark(),
          home: LoginScreen()),

      ///fctdcyt
    );
  }
}
