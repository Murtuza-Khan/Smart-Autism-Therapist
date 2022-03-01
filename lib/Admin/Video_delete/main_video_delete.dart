import 'package:admin/Admin/Video_delete/video_delete_list_screen.dart';
import 'package:admin/Dashbord/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainVideoDelete extends StatelessWidget {
  static final String title = 'Firebase Download';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Autism Therapist',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: VideoDeleteListScreen(),
      );
}
