import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/database/database.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/provider/edit_page_provider.dart';
import 'package:student_management_provider/provider/home_page_provider.dart';
import 'package:student_management_provider/widgets/text_field.dart';
import 'package:student_management_provider/widgets/widget.dart';

class StudentEdit extends StatelessWidget {
  final Student student;
  StudentEdit({super.key, required this.student});

  final formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _schoolNameController = TextEditingController();
  final _phonenameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final editStudentProvider = Provider.of<EditPageProvider>(context);
    _nameController.text = student.name;
    _schoolNameController.text = student.school;
    _phonenameController.text = student.phone.toString();
    _ageController.text = student.age.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text('Edit Student'),
        centerTitle: true,
        titleTextStyle: titlestyle,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(35), child: SizedBox()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor1,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          editStudentProvider.setImage(image);
                        }
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: editStudentProvider.profilepath != null
                                    ? FileImage(
                                        File(editStudentProvider.profilepath!))
                                    : student.profileimg.isNotEmpty
                                        ? FileImage(File(student.profileimg))
                                        : const NetworkImage(
                                            "https://banner2.cleanpng.com/20180802/gyc/kisspng-computer-icons-shape-user-person-scalable-vector-g-imag-icons-3-617-free-vector-icons-page-4-5b62ba06c36336.0063904315331968068003.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    kheight,
                    buildTextFeild(
                        hint: "Name",
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          }
                          return null;
                        }),
                    kheight,
                    buildTextFeild(
                        hint: "School",
                        controller: _schoolNameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the school name';
                          }
                          return null;
                        }),
                    kheight,
                    buildTextFeild(
                        hint: "Age",
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          } else if (int.tryParse(value) == null ||
                              value.length > 2 ||
                              int.tryParse(value) == 0) {
                            return 'please enter a valid age';
                          }
                          return null;
                        }),
                    kheight,
                    buildTextFeild(
                        hint: "phone",
                        controller: _phonenameController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          } else if (value.length != 10) {
                            return 'please enter a valid mobile number';
                          }
                          return null;
                        }),
                    kheight,
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            final name = _nameController.text;
                            final school = _schoolNameController.text;
                            final age = _ageController.text;
                            final phone = _phonenameController.text;
                            final studentupdate = Student(
                                id: student.id,
                                name: name,
                                school: school,
                                age: int.parse(age),
                                phone: int.parse(phone),
                                profileimg: editStudentProvider.profilepath ??
                                    student.profileimg);
                            DatabaseHelper datahelp = DatabaseHelper();
                            datahelp.updateStudent(studentupdate).then((id) {
                              if (id > 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                        content: Text(
                                            'Student Updated successfuly')));
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                const    SnackBar(
                                        content:
                                            Text('Failed to update student')));
                              }
                            });
                          }
                          editStudentProvider.clearImage();
                          HomePageProvider homeprovider = HomePageProvider();
                          homeprovider.refreshStudentList();

                        },
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Save'),
                            kwidth,
                            Icon(Icons.save),
                          ],
                        ))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
