import 'package:admin/Admin/Doctor_details.dart';
import 'package:admin/Admin/Patient_Details/Patient_Screen.dart';
import 'package:admin/Admin/Unblock_User/unblock_user.dart';
import 'package:admin/Admin/Video_delete/main_video_delete.dart';
import 'package:admin/Admin/tabBar_for_appointment.dart';
import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
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
            "Admin Pannel",
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
                  MaterialPageRoute(builder: (context) => DashbordScreen()));
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          elevation: 0,
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
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 400.0, right: 400.0, top: 50.0, bottom: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Color(0xFFFFCDCE).withOpacity(0.5),
                        Color(0xFFF7F0A5).withOpacity(0.5),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 35.0, bottom: 35.0, left: 35.0, right: 35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [
                            Color(0xFFFFCDCE).withOpacity(0.6),
                            Color(0xFFF7F0A5).withOpacity(0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 35.0, bottom: 35.0, left: 35.0, right: 35.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                Color(0xFFFFCDCE),
                                Color(0xFFF7F0A5),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Text(
                                  "Details",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.black,
                                    fontFamily: 'abril',
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PatientScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 96.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 10.0),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Patients Details",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontFamily: 'abril',
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Click here to see the details",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            fontFamily: 'Italianno',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 22.5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DoctorsDetails()));
                                  },
                                  child: Container(
                                    height: 96.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 10.0),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Doctors Details",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontFamily: 'abril',
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Click here to see the details",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            fontFamily: 'Italianno',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 22.5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TabBarForAppointment()));
                                  },
                                  child: Container(
                                    height: 96.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 10.0),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Appointment Details",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontFamily: 'abril',
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Click here to see the details",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            fontFamily: 'Italianno',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 22.5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainVideoDelete()));
                                  },
                                  child: Container(
                                    height: 96.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 10.0),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Files Detail",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontFamily: 'abril',
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Click here to see the details",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            fontFamily: 'Italianno',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 22.5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UnblockUserScreen()));
                                  },
                                  child: Container(
                                    height: 96.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 10.0),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text(
                                          "Reports Detail",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontFamily: 'abril',
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Click here to see the details",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            fontFamily: 'Italianno',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
