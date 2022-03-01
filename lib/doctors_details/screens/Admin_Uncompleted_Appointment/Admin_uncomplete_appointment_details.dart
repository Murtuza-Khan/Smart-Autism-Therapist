import 'package:admin/Admin/tabBar_for_appointment.dart';
import 'package:admin/Dashbord/constants.dart';
import 'package:admin/doctors_details/screens/Admin_Uncompleted_Appointment/Admin_uncompleted_appo_deleting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminUncompleteAppointmentDetails extends StatefulWidget {
  final String? bookingDate;
  final String? bookingTime;
  final String? appointmentTime;
  final String? appointmentDay;
  final String? doctorName;
  final String? userEmail;
  final String? userImageUrl;
  final String? bookingStatus;
  final String? userName;
  final String? userUid;
  final String? docID;

  AdminUncompleteAppointmentDetails(
      {this.appointmentDay,
      this.appointmentTime,
      this.bookingDate,
      this.bookingStatus,
      this.bookingTime,
      this.doctorName,
      this.userEmail,
      this.userImageUrl,
      this.userName,
      this.userUid,
      this.docID});

  @override
  _AdminUncompleteAppointmentDetailsState createState() =>
      _AdminUncompleteAppointmentDetailsState();
}

class _AdminUncompleteAppointmentDetailsState
    extends State<AdminUncompleteAppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/dvpAppBar.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(
            "Booked Appointment Details",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontFamily: 'abril',
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabBarForAppointment()));
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/main_background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 400.0,
                      right: 400.0,
                      top: 25.0,
                      bottom: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: bgColor.withOpacity(0.5),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black54,
                        //     offset: Offset(0.0, 0.0),
                        //     blurRadius: 3.0,
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: bgColor.withOpacity(0.6),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.white54,
                            //     offset: Offset(0.0, 0.0),
                            //     blurRadius: 3.0,
                            //   ),
                            // ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height:
                                      MediaQuery.of(context).size.height / 1.31,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    // border: Border.all(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(height: 40.0),
                                          CircleAvatar(
                                            radius: 45,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 43,
                                              backgroundColor: bgColor,
                                              child: ClipRRect(
                                                child: Image.network(
                                                    widget.userImageUrl!),
                                                borderRadius:
                                                    BorderRadius.circular(43.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "Doctor Name                     : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.doctorName!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "Appointment Status        : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.bookingStatus!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "User Name                          : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.userName!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 341.0),
                                              Text(
                                                "User Email                           : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 300.0,
                                                child: Text(
                                                  widget.userEmail!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "User UID                                : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 300.0,
                                                child: Text(
                                                  widget.userUid!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "Appointment time            : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.appointmentTime!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "Appointment DAY             : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.appointmentDay!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "Booking Date                      : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.bookingDate!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 340.0),
                                              Text(
                                                "Booking Time                      : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.bookingTime!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 40.0),
                                          Container(
                                            height: 50.0,
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFFF7F0A5),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 7.0,
                                                ),
                                              ],
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                stops: [0.0, 1.0],
                                                colors: [
                                                  Color(0xFFF7F0A5),
                                                  Color(0xFF98EAFF),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.black),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                minimumSize:
                                                    Size.fromHeight(10),
                                                shape: StadiumBorder(),
                                              ),
                                              child: FittedBox(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              onPressed: () {
                                                // firstId = itemList.indexWhere((element) => element["appointment_time"] == "9:00 am - 11:00 am")
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    "Please wait",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  duration:
                                                      Duration(seconds: 2),
                                                  backgroundColor: Colors
                                                      .cyanAccent.shade400,
                                                ));
                                                new Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AdminUncompleteAppointmentDeleting(
                                                            docID: widget.docID,
                                                            title:
                                                                "Information",
                                                            description:
                                                                "Do you want to delete this user data?",
                                                          ));
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
