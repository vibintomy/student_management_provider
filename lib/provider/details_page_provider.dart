import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/database/database.dart';
import 'package:student_management_provider/provider/home_page_provider.dart';

class DetailsPageProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper();

  Future<void> deleteStudent(int studentId,BuildContext context) async {
    await db.deleteStudent(studentId);
    Provider.of<HomePageProvider>(context, listen: false).refreshStudentList();
    notifyListeners();
  }
}
