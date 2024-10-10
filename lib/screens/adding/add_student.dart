import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/database/database.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/provider/add_page_provider.dart';
import 'package:student_management_provider/widgets/text_field.dart';
import 'package:student_management_provider/widgets/widget.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final schoolNameController = TextEditingController();
  final phoneController = TextEditingController();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text('Add Student'),
        titleTextStyle: titlestyle,
        centerTitle: true,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(55), child: SizedBox()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor1,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Consumer<AddPageProvider>(
                builder: (context, addPageProvider, _) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            Provider.of<AddPageProvider>(context, listen: false)
                                .setImage(image);
                          }
                        },
                        child: addPageProvider.profileImgPath != null
                            ? Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: FileImage(File(
                                            addPageProvider.profileImgPath!)),
                                        fit: BoxFit.cover)),
                              )
                            : Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:const Color.fromARGB(255, 244, 153, 238),
                                ),
                                child: const Icon(Icons.person),
                              ),
                      ),
                      kheight,
                      buildTextFeild(
                          hint: 'Name',
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the name';
                            }
                            return null;
                          }),
                      kheight,
                      buildTextFeild(
                          hint: 'School',
                          controller: schoolNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the school name';
                            }
                            return null;
                          }),
                      kheight,
                      buildTextFeild(
                          hint: 'Age',
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an age';
                            } else if (int.tryParse(value) == null ||
                                value.length > 2 ||
                                int.parse(value) == 0) {
                              return 'Please enter a valid age';
                            }
                            return null;
                          }),
                      kheight,
                      buildTextFeild(
                          hint: 'phone',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the phonr number';
                            } else if (value.length != 10) {
                              return 'please enter a valid phone number';
                            }
                            return null;
                          }),
                      kheight,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color.fromARGB(255, 246, 177, 172)
                        ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final name = nameController.text;
                              final school = schoolNameController.text;
                              final age = ageController.text;
                              final phone = phoneController.text;
                              final student = Student(
                                  id: 0,
                                  name: name,
                                  school: school,
                                  age: int.parse(age),
                                  phone: int.parse(phone),
                                  profileimg: addPageProvider.profileImgPath!);
                              addPageProvider.clearImage();
                              databaseHelper.insertStudent(student).then((id) {
                                if (id > 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const  SnackBar(
                                        content:
                                            Text('Student Added successfully')),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                     const SnackBar(
                                          content:
                                              Text('Failed to add student')));
                                }
                              });
                              Provider.of<AddPageProvider>(context, listen: false)
                                  .clearImage();
                            }
                          },
                          child:const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Save'),
                              kwidth,
                              Icon(Icons.save)
                            ],
                          ))
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
