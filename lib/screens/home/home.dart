import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';

import 'package:student_management_provider/provider/home_page_provider.dart';
import 'package:student_management_provider/screens/adding/add_student.dart';
import 'package:student_management_provider/screens/details/details.dart';
import 'package:student_management_provider/widgets/widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeprovider = Provider.of<HomePageProvider>(context);
    homeprovider.refreshStudentList();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color1,
        title: const Text('STUDENT LIST'),
        titleTextStyle: titlestyle,
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoSearchTextField(
                onChanged: (value) {
                  homeprovider.filterStudents(value);
                },
                backgroundColor: Colors.white,
              ),
            )),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: maincolor,
          child: homeprovider.filteredStudents.isEmpty
              ? const Center(
                  child: Text(
                    "No Students Found",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: homeprovider.filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = homeprovider.filteredStudents[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  StudentDetails(student: student,))),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color:const Color.fromARGB(255, 130, 250, 164),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  offset: Offset(4, 4),
                                )
                              ]),
                              child: Center(
                                child: ListTile(
                                  leading: student.profileimg.isNotEmpty
                                  ?Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: FileImage(File(student.profileimg),),
                                      fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )
                                  :Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.circular(8)
                                      
                                    ),
                                    child:const Icon(
                                      Icons.person,
                                      size: 40,
                                        color: Colors.white
                                        ,
                                    ),
                                  ),
                                  title: Text(student.name,
                                  style: GoogleFonts.crimsonPro(
                                    color: Colors.black,
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold
                                  ),),
                                  subtitle: Text(
                                    
                                    student.school,
                                    style: GoogleFonts.crimsonPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  trailing: Text("Age : ${student.age}",
                                  style: GoogleFonts.crimsonPro(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  minTileHeight: 60,
                                ),
                              ),
                        ),
                      ),
                    );
                  },
                )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddStudent()),
        ).then((value) => homeprovider.refreshStudentList());
      },
      child:const Icon(Icons.add),
      ),
    );
  }
}
