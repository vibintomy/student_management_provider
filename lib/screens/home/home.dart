import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/colors.dart';
import 'package:student_management_provider/provider/home_page_provider.dart';
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
        title:const Text('STUDENT LIST'),
        titleTextStyle: titlestyle,
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize:const Size.fromHeight(55),
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
    );
  }
}
