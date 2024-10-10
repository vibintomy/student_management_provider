import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextFeild({
  required String hint,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyboardType,
    style:const TextStyle(
      fontSize: 18,
      color: Colors.black 
    ),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.dancingScript(
        fontSize: 18,
        color: Colors.blueGrey,
         fontWeight: FontWeight.bold 
      ),
      filled: true,
      fillColor:const Color.fromARGB(255, 250, 163, 214),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none
      )
      
    ),
    validator: validator,
  );
}
