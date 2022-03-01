import 'package:admin/Dashbord/constants.dart';
import 'package:admin/doctors_details/screens/Admin_Completed_Appointment/Admin_completed_appointment_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminCompletedAppointmentScreen extends StatefulWidget {
  // final int noAppointment;

  // AdminScreen({this.noAppointment});

  @override
  _AdminCompletedAppointmentScreenState createState() =>
      _AdminCompletedAppointmentScreenState();
}

class _AdminCompletedAppointmentScreenState
    extends State<AdminCompletedAppointmentScreen> {
  final userRef = FirebaseFirestore.instance
      .collection('Admin_Data_Completed_Appointments');

  List itemList = [];
  List itemList2 = [];
  int index = 0;
  int? length;
  String? id;
  List itemNumber = [];
  int number = 0;

  getAppointmentBookingMonday() {
    userRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        print(doc.id);
        print(doc.exists);
        itemList.add(doc.data());
        itemList2.add(doc.id);
        itemNumber.add(itemList.length);
        print(itemList.length);
        print(itemList2);
        print(itemNumber);
        setState(() {
          length = itemList.length;
        });
      });
    });
  }

  appointmentNumberCreating() {
    itemNumber.length = length!;
  }

  @override
  void initState() {
    getAppointmentBookingMonday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
          backgroundColor: bgColor,
          // appBar: AppBar(
          //   flexibleSpace: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("assets/dvpAppBar.png"),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          //   title: Text(
          //     "Appointment Details",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 30.0,
          //       fontFamily: 'abril',
          //     ),
          //   ),
          //   centerTitle: true,
          //   backgroundColor: bgColor.withOpacity(0.0),
          //   leading: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => AdminPage()));
          //     },
          //     child: Icon(
          //       FontAwesomeIcons.arrowLeft,
          //       size: 30.0,
          //       color: Colors.black,
          //     ),
          //   ),
          //   elevation: 0,
          // ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Admin_Data_Completed_Appointments')
                .orderBy('sort', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/main_background.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 400.0,
                          right: 400.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: bgColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 30.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 150.0, right: 150.0),
                            child: Column(
                              children: [
                                SizedBox(height: 15.0),
                                Container(
                                  height: 70.0,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.yellow,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Completed Appointments :  $length",
                                        style: TextStyle(
                                          fontFamily: "abril",
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: 1,
                                      itemBuilder:
                                          (BuildContext context, int fIndex) {
                                        return Column(
                                          children: snapshot.data!.docs
                                              .map((document) {
                                            fIndex++;
                                            return SafeArea(
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0,
                                                          bottom: 15.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        id = document.id;
                                                      });
                                                      print(document.id);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AdminCompletedAppointmentDetails(
                                                                    bookingTime:
                                                                        document[
                                                                            'appointment_booked_on_time'],
                                                                    bookingDate:
                                                                        document[
                                                                            'appointment_booked_on_date'],
                                                                    appointmentTime:
                                                                        document[
                                                                            'appointment_time'],
                                                                    appointmentDay:
                                                                        document[
                                                                            'day'],
                                                                    doctorName:
                                                                        document[
                                                                            'doctor_name'],
                                                                    userEmail:
                                                                        document[
                                                                            'email'],
                                                                    userImageUrl:
                                                                        document[
                                                                            'image'],
                                                                    bookingStatus:
                                                                        document[
                                                                            'isAvailable'],
                                                                    userName:
                                                                        document[
                                                                            'name'],
                                                                    userUid:
                                                                        document[
                                                                            'uid'],
                                                                    docID:
                                                                        document
                                                                            .id,
                                                                  )));
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.1,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              6,
                                                      decoration: BoxDecoration(
                                                          color: secondaryColor,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      15.0))),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                              height: 20.0),
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          0.0),
                                                                  blurRadius:
                                                                      10.0,
                                                                ),
                                                              ],
                                                              gradient:
                                                                  LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                colors: [
                                                                  Color(
                                                                      0xFFFFCDCE),
                                                                  Color(
                                                                      0xFFF7F0A5),
                                                                ],
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "$fIndex",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'abril',
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 15.0),
                                                          Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              223.0),
                                                                      Text(
                                                                        "Doctor Name",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              20.0),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              257.0),
                                                                      Text(
                                                                        "Appointment Time",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              20.0),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              222.0),
                                                                      Text(
                                                                        "Booking Date",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              20.0),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 75.0,
                                                                width: 1.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              30.0),
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            Text(
                                                                          document[
                                                                              'doctor_name'],
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              30.0),
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            Text(
                                                                          document[
                                                                              'appointment_time'],
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              30.0),
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            Text(
                                                                          document[
                                                                              'appointment_booked_on_date'],
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          // Row(
                                                          //   children: [

                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
