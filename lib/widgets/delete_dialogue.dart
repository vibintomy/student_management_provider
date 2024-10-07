import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteDialogue extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback ondelete;
  const DeleteDialogue({super.key,required this.onCancel,required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Student',
      style: GoogleFonts.crimsonPro(
        fontSize: 20,
        color: Colors.white,
        wordSpacing: 4,
        fontWeight: FontWeight.bold,
      ),),
      content: Text('Are you sure you wanted to delete this student?',
      style: GoogleFonts.crimsonPro(
        color: Colors.white
      ),),
      actions: [
        TextButton(onPressed: onCancel, child: 
        Text('Cancel',
        style: GoogleFonts.crimsonPro(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),)),
        TextButton(onPressed: ondelete, child: Text(
          'Delete',
          style: GoogleFonts.crimsonPro(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ))
      ],
      backgroundColor: Colors.blueGrey,
    );
  }
}
