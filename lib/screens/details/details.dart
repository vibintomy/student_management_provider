import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/screens/details/button_widget.dart';
import 'package:student_management_provider/screens/details/image_widget.dart';
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
        decoration: maincolor1,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kheight,
                ImageWidget(student: student),
                kheight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 320,
                      width:200,
                      decoration:const BoxDecoration(
                        color: Color.fromARGB(255, 245, 165, 213),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5),
                          
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          )
                        ],
                        
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: ${student.name}',
                            style:   styledetails(),),
                              Text('School: ${student.school}',
                            style:   styledetails(),),
                            Text('Age: ${student.age}',
                            style:   styledetails(),),
                              Text('Phone: ${student.phone}',
                            style:   styledetails(),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                kheight1,
               ButtonWidget(student: student)
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle styledetails()=> GoogleFonts.crimsonPro(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.w600
  );
}
