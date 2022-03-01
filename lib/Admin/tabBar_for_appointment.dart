import 'package:admin/Admin/Admin_page.dart';
import 'package:admin/doctors_details/screens/Admin_Completed_Appointment/Admin_Completed_Appo_Screen.dart';
import 'package:admin/doctors_details/screens/Admin_Uncompleted_Appointment/Admin_Uncompleted_Appo_Screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabBarForAppointment extends StatelessWidget {
  const TabBarForAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new DefaultTabController(
        length: 2,
        child: Scaffold(
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
              "Appointments Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontFamily: 'abril',
              ),
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPage()));
              },
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                size: 30.0,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    "Compelted",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'abril',
                      fontSize: 23.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Total Booked",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'abril',
                      fontSize: 23.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/main_background.png"),
                      fit: BoxFit.fill),
                ),
                child: TabBarView(
                  children: [
                    Center(child: AdminCompletedAppointmentScreen()),
                    Center(child: AdminUncompletedAppointmentScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
