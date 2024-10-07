import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/provider/details_page_provider.dart';
import 'package:student_management_provider/screens/edit/student_edit.dart';
import 'package:student_management_provider/widgets/delete_dialogue.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 300,
          decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(10, 0),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentEdit(student: student)));
                  },
                  label:const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon:const Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              TextButton.icon(
                onPressed: () {
                  _deleteDialog(context);
                },
                label:const Text(
                  'Delete',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _deleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => DeleteDialogue(onCancel: () {
              Navigator.pop(context);
            }, ondelete: () {
              Provider.of<DetailsPageProvider>(context, listen: false)
                  .deleteStudent(student.id);
              void popUntilHomeScreen(BuildContext context) {
                Navigator.popUntil(context, (route) => route.isFirst);
              }

              popUntilHomeScreen(context);
            }));
  }
}
