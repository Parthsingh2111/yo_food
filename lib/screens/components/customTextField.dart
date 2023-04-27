import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController mycontroller,
  // required emailController,
  required String hint,
  required bool obscuretheText,
  required TextInputType keyboard,
  required Icon picon,
  required hintStyle,
}) {
  return Container(
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
          controller: mycontroller,
          cursorColor: Colors.yellow,
          cursorHeight: 22,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.orange),
          keyboardType: keyboard,
          obscureText: obscuretheText,
          decoration: InputDecoration(
            prefixIcon: picon,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: GoogleFonts.aclonica(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ),
    ),
  );
}
