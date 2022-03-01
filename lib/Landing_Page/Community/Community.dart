import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Landing_Page/Community/Community_Text.dart';
import 'package:admin/Landing_Page/footer.dart';
import 'package:admin/Landing_Page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/dvpAppBar.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Text(
          "Community",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'abril',
          ),
        ),
        centerTitle: true,
        backgroundColor: bgColor.withOpacity(0.0),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage()));
          },
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            size: 25.0,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommunityTextScreen(),
            FooterScreen(),
          ],
        ),
      ),
    );
  }
}
