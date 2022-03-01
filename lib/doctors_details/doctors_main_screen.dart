import 'package:admin/doctors_details/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DoctorsDetails extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Autism Therapist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFD8ECF1)),
      ),
      home: HomeScreen(),
    );
  }
}
