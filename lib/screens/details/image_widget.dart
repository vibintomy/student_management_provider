import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_provider/model/model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 300,
              height:300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 183, 253, 185),
                borderRadius: BorderRadius.circular(80),
                boxShadow:const [BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                    offset: Offset(0, 5)
                )]
              ),
            ),
            Padding(padding:const EdgeInsets.only(top: 20,bottom: 20,left: 115),
            child: student.profileimg.isNotEmpty
            ? Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  topLeft: Radius.circular(60),
                  
                ),
                image:DecorationImage(image: 
                FileImage(File(student.profileimg)),
                fit: BoxFit.cover)
              ),
            )
            :Container(
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  topLeft: Radius.circular(60),
                  
                ),
                color: Colors.cyan
              ),
              child:const Icon(Icons.person),
            )
            )
            
          ],
        )
      ],
    );
  }
}
