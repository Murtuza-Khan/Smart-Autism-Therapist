import 'package:admin/Admin/Admin_page.dart';
import 'package:admin/Chat_App/new_chat_main.dart';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/FAQS/faqs.dart';
import 'package:admin/Landing_Page/landing_page.dart';
import 'package:admin/Video_Download/main_video_download.dart';
import 'package:admin/View_Feedback/View_feedback_fetch_main.dart';
import 'package:admin/doctors_details/screens/default_doctor_verification_screen.dart';
import 'package:admin/test_upload/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  child: Image.asset("assets/images/sma_logo_final_new.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.0,
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 30.0),
                      Text(
                        "SMART",
                        style: TextStyle(
                          fontFamily: 'abril',
                          color: Colors.white,
                          fontSize: 35.0,
                        ),
                      ),
                      Text(
                        "Autism Therapist",
                        style: TextStyle(
                          fontFamily: 'abril',
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: "Home",
            icon: Icon(Icons.home, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DashbordScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Admin",
            icon: Icon(
              FontAwesomeIcons.crown,
              color: Colors.white,
              size: 20.0,
            ),
            press: () {
              if (user!.email == "khanmurtuza690@gmail.com") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Welcome Murtuza",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.cyanAccent.shade400,
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "You do not have the permission to access this section",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
          DrawerListTile(
            title: "Doctors",
            icon: Icon(Icons.medical_services, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DefaultDoctorVerificationScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Chat",
            icon: Icon(Icons.chat, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyNewChatFinalApp(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Download Files",
            icon: Icon(Icons.cloud, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainDownloadScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "View Feedback",
            icon: Icon(Icons.feedback, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewFeedbackFetchMain(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "FAQ's",
            icon: Icon(Icons.question_answer, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FAQScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Report",
            icon: Icon(Icons.report, color: Colors.white),
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainReportScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Sign out",
            icon: Icon(Icons.logout, color: Colors.white),
            press: () async {
              final googleSignin = GoogleSignIn();
              await googleSignin.disconnect();
              FirebaseAuth.instance.signOut().whenComplete(() async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              });
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.0),
        ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          leading: icon,
          title: Text(
            title,
            style: TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}
