import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/provider/add_page_provider.dart';
import 'package:student_management_provider/provider/details_page_provider.dart';
import 'package:student_management_provider/provider/edit_page_provider.dart';
import 'package:student_management_provider/provider/home_page_provider.dart';
import 'package:student_management_provider/provider/splash_provider.dart';
import 'package:student_management_provider/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AddPageProvider()),
      ChangeNotifierProvider(create: (_)=>DetailsPageProvider()),
      ChangeNotifierProvider(create: (_)=>EditPageProvider()),
      ChangeNotifierProvider(create: (_)=>HomePageProvider()),
      ChangeNotifierProvider(create: (_)=>SplashProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'student management',
      theme:  ThemeData(
        fontFamily: GoogleFonts.crimsonPro().fontFamily,
        textTheme:const TextTheme(
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      
      ),
      home:const SplashScreen(),
    ),
    );
  }
}
