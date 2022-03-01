import 'package:admin/Primary_graph/page/home_page.dart';
import 'package:flutter/material.dart';

class PrimaryChart extends StatelessWidget {
  static final String title = 'Smart Autism Therapist';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.blueGrey[900]),
        home: GraphHomePage(),
      );
}
