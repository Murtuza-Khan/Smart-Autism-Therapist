import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/doctors_details/doctors_main_screen.dart';
import 'package:admin/doctors_details/screens/default_doctor_verification_screen.dart';
import 'package:admin/doctors_details/widgets/destination_carousel.dart';
import 'package:admin/doctors_details/widgets/hotel_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final useer = FirebaseAuth.instance.currentUser;

  int _selectedIndex = 1;
  // int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.arrowLeft,
    FontAwesomeIcons.home,
    FontAwesomeIcons.crown,
    FontAwesomeIcons.listAlt,
    FontAwesomeIcons.question,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });

        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashbordScreen(),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorsDetails(),
            ),
          );
        } else if (index == 2) {
          if (useer!.email == "khanmurtuza690@gmail.com") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Welcome Murtuza",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.cyanAccent.shade400,
            ));
            new Future.delayed(const Duration(seconds: 0), () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AdminScreen(),
              //   ),
              // );
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "You don't have the permission to access\nthis section",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
            ));
          }
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DefaultDoctorVerificationScreen(),
            ),
          );
        }
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : secondaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashbordScreen()));
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [bgColor, bgColor])),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 90.0),
                  child: Text(
                    "What would you like to find?",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map(
                        (MapEntry map) => _buildIcon(map.key),
                      )
                      .toList(),
                ),
                SizedBox(height: 20.0),
                DestinationCarousel(),
                SizedBox(height: 13.0),
                HotelCarousel(),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _currentTab,
        //   onTap: (int value) {
        //     setState(() {
        //       _currentTab = value;
        //     });
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.search,
        //         size: 30.0,
        //       ),
        //       title: SizedBox.shrink(),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.location_pin,
        //         size: 30.0,
        //       ),
        //       title: SizedBox.shrink(),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: CircleAvatar(
        //         radius: 15.0,
        //         backgroundImage: AssetImage('assets/dashboard_and_doctor_details/doctors_images/bpanther.jpg'),
        //       ),
        //       title: SizedBox.shrink(),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
