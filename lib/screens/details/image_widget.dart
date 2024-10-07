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
                color: Colors.white,
                borderRadius: BorderRadius.circular(80),
                boxShadow: [BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                    offset: Offset(0, 5)
                )]
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20,bottom: 20,left: 115),
            child: student.profileimg.isNotEmpty
            ? Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only()
              ),
            )
            :Container()
            )
            
          ],
        )
      ],
    );
  }
}
