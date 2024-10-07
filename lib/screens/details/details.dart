import 'package:flutter/material.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/widgets/widget.dart';

class StudentDetails extends StatelessWidget {
  final Student student;
  const StudentDetails({super.key,required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Student Details'),
        titleTextStyle: titlestyle,
        backgroundColor: color1,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kheight,
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
