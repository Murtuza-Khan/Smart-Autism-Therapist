import 'dart:ui';
import 'package:admin/Dashbord/constants.dart';
import 'package:admin/doctors_details/Deleting_Appointment/Doc2_Appointment/doc2_monday_first.dart';
import 'package:admin/doctors_details/Deleting_Appointment/Doc2_Appointment/doc2_monday_second.dart';
import 'package:admin/doctors_details/Deleting_Appointment/Doc2_Appointment/doc2_tuesday_first.dart';
import 'package:admin/doctors_details/Deleting_Appointment/Doc2_Appointment/doc2_tuesday_second.dart';
import 'package:admin/doctors_details/Deleting_Appointment/Doc2_Appointment/doc2_wednesday_first.dart';
import 'package:admin/doctors_details/Deleting_Appointment/Doc2_Appointment/doc2_wednesday_second.dart';
import 'package:admin/doctors_details/doc_back_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdatingAppointment2 extends StatefulWidget {
  // const UpdatingAppointment({ Key? key }) : super(key: key);

  @override
  State<UpdatingAppointment2> createState() => _UpdatingAppointment2State();
}

class _UpdatingAppointment2State extends State<UpdatingAppointment2> {
  final user = FirebaseAuth.instance.currentUser;

  final userRef =
      FirebaseFirestore.instance.collection('Appointment_Doc2_Monday');

  final userRef2 =
      FirebaseFirestore.instance.collection('Appointment_Doc2_Tuesday');
  final userRef3 =
      FirebaseFirestore.instance.collection('Appointment_Doc2_Wednesday');

  List itemList = [];
  List itemList2 = [];
  int index = 0;
  String firstName = "Not Booked",
      firstEmail = "Not Booked",
      firstAppo = "Not Booked",
      firstAppoTime = "Not Booked",
      firstDay = "Not Booked";

  String secondName = "Not Booked",
      secondEmail = "Not Booked",
      secondAppo = "Not Booked",
      secondAppoTime = "Not Booked",
      secondDay = "Not Booked";

  List itemListTuesday = [];
  List itemListTuesday2 = [];
  int indexTuesday = 0;
  String thirdName = "Not Booked",
      thirdEmail = "Not Booked",
      thirdAppo = "Not Booked",
      thirdAppoTime = "Not Booked",
      thirdDay = "Not Booked";

  String fourthName = "Not Booked",
      fourthEmail = "Not Booked",
      fourthAppo = "Not Booked",
      fourthAppoTime = "Not Booked",
      fourthDay = "Not Booked";

  List itemListWednesday = [];
  List itemListWednesday2 = [];
  int indexWednesday = 0;
  String fifthName = "Not Booked",
      fifthEmail = "Not Booked",
      fifthAppo = "Not Booked",
      fifthAppoTime = "Not Booked",
      fifthDay = "Not Booked";

  String sixthName = "Not Booked",
      sixthEmail = "Not Booked",
      sixthAppo = "Not Booked",
      sixthAppoTime = "Not Booked",
      sixthDay = "Not Booked";

  String firstId = "";
  String secondId = "";
  String thirdId = "";
  String fourthId = "";
  String fifthId = "";
  String sixthId = "";

  getAppointmentBookingMonday() {
    userRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        print(doc.id);
        print(doc.exists);
        itemList.add(doc.data());
        itemList2.add(doc.id);
        print(itemList.length);
        print(itemList2);

        if (itemList[index]["isAvailable"] == "Booked" &&
            itemList[index]["appointment_time"] == "10:00 am - 12:00 pm" &&
            itemList[index]["day"] == "Monday") {
          setState(() {
            firstName = itemList[index]["name"];
            firstEmail = itemList[index]["email"];
            firstAppo = itemList[index]["isAvailable"];
            firstAppoTime = itemList[index]["appointment_time"];
            firstDay = itemList[index]["day"];
            firstId = itemList2[index];
          });
        } else if (itemList[index]["isAvailable"] == "Booked" &&
            itemList[index]["appointment_time"] == "02:00 pm - 04:00 pm" &&
            itemList[index]["day"] == "Monday") {
          setState(() {
            secondName = itemList[index]["name"];
            secondEmail = itemList[index]["email"];
            secondAppo = itemList[index]["isAvailable"];
            secondAppoTime = itemList[index]["appointment_time"];
            secondDay = itemList[index]["day"];
            secondId = itemList2[index];
          });
        }
        setState(() {
          index++;
        });
      });
    });
  }

  getAppointmentBookingTuesday() {
    userRef2.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        print(doc.id);
        print(doc.exists);
        itemListTuesday.add(doc.data());
        itemListTuesday2.add(doc.id);
        print(itemListTuesday.length);
        print(itemListTuesday2);

        if (itemListTuesday[indexTuesday]["isAvailable"] == "Booked" &&
            itemListTuesday[indexTuesday]["appointment_time"] ==
                "11:00 am - 01:00 pm" &&
            itemListTuesday[indexTuesday]["day"] == "Tuesday") {
          setState(() {
            thirdName = itemListTuesday[indexTuesday]["name"];
            thirdEmail = itemListTuesday[indexTuesday]["email"];
            thirdAppo = itemListTuesday[indexTuesday]["isAvailable"];
            thirdAppoTime = itemListTuesday[indexTuesday]["appointment_time"];
            thirdDay = itemListTuesday[indexTuesday]["day"];
            thirdId = itemListTuesday2[indexTuesday];
          });
        } else if (itemListTuesday[indexTuesday]["isAvailable"] == "Booked" &&
            itemListTuesday[indexTuesday]["appointment_time"] ==
                "03:00 pm - 05:00 pm" &&
            itemListTuesday[indexTuesday]["day"] == "Tuesday") {
          setState(() {
            fourthName = itemListTuesday[indexTuesday]["name"];
            fourthEmail = itemListTuesday[indexTuesday]["email"];
            fourthAppo = itemListTuesday[indexTuesday]["isAvailable"];
            fourthAppoTime = itemListTuesday[indexTuesday]["appointment_time"];
            fourthDay = itemListTuesday[indexTuesday]["day"];
            fourthId = itemListTuesday2[indexTuesday];
          });
        }
        setState(() {
          indexTuesday++;
        });
      });
    });
  }

  getAppointmentBookingWednesday() {
    userRef3.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        print(doc.id);
        print(doc.exists);
        itemListWednesday.add(doc.data());
        itemListWednesday2.add(doc.id);
        print(itemListWednesday.length);
        print(itemListWednesday2);

        if (itemListWednesday[indexWednesday]["isAvailable"] == "Booked" &&
            itemListWednesday[indexWednesday]["appointment_time"] ==
                "09:00 am - 11:00 am" &&
            itemListWednesday[indexWednesday]["day"] == "Wednesday") {
          setState(() {
            fifthName = itemListWednesday[indexWednesday]["name"];
            fifthEmail = itemListWednesday[indexWednesday]["email"];
            fifthAppo = itemListWednesday[indexWednesday]["isAvailable"];
            fifthAppoTime =
                itemListWednesday[indexWednesday]["appointment_time"];
            fifthDay = itemListWednesday[indexWednesday]["day"];
            fifthId = itemListWednesday2[indexWednesday];
          });
        } else if (itemListWednesday[indexWednesday]["isAvailable"] ==
                "Booked" &&
            itemListWednesday[indexWednesday]["appointment_time"] ==
                "01:00 pm - 03:00 pm" &&
            itemListWednesday[indexWednesday]["day"] == "Wednesday") {
          setState(() {
            sixthName = itemListWednesday[indexWednesday]["name"];
            sixthEmail = itemListWednesday[indexWednesday]["email"];
            sixthAppo = itemListWednesday[indexWednesday]["isAvailable"];
            sixthAppoTime =
                itemListWednesday[indexWednesday]["appointment_time"];
            sixthDay = itemListWednesday[indexWednesday]["day"];
            sixthId = itemListWednesday2[indexWednesday];
          });
        }
        setState(() {
          indexWednesday++;
        });
      });
    });
  }

  sepratingData() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Appointment Details",
                  style: TextStyle(
                      fontFamily: 'abril',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Day                   : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      firstDay,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Time                 : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      firstAppoTime,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 250.0),
                    Text(
                      "Name               : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      firstName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Email                : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      firstEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 160.0,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.fromHeight(10),
                      shape: StadiumBorder(),
                    ),
                    child: FittedBox(
                      child: Text(
                        "Completed?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      // firstId = itemList.indexWhere((element) => element["appointment_time"] == "9:00 am - 11:00 am")
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please wait",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.cyanAccent.shade400,
                      ));
                      new Future.delayed(const Duration(seconds: 2), () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeletingDoc2FirstMondayAppointment(
                                  firstAppoTime: firstAppoTime,
                                  firstDay: firstDay,
                                  firstEmail: firstEmail,
                                  firstIsAvailable: firstAppo,
                                  firstName: firstName,
                                  idList: firstId,
                                  title: "Info",
                                  description:
                                      "Have you completed this appointment?",
                                ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  sepratingData2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Appointment Details",
                  style: TextStyle(
                      fontFamily: 'abril',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Day                   : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      secondDay,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Time                 : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      secondAppoTime,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 250.0),
                    Text(
                      "Name               : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      secondName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Email                : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      secondEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 160.0,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.fromHeight(10),
                      shape: StadiumBorder(),
                    ),
                    child: FittedBox(
                      child: Text(
                        "Completed?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please wait",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.cyanAccent.shade400,
                      ));
                      new Future.delayed(const Duration(seconds: 2), () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeletingDoc2SecondMondayAppointment(
                                  secondAppoTime: secondAppoTime,
                                  secondDay: secondDay,
                                  secondEmail: secondEmail,
                                  secondIsAvailable: secondAppo,
                                  secondName: secondName,
                                  idList: secondId,
                                  title: "Info",
                                  description:
                                      "Have you completed this appointment?",
                                ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  sepratingDataTuesday() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Appointment Details",
                  style: TextStyle(
                      fontFamily: 'abril',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Day                   : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      thirdDay,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Time                 : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      thirdAppoTime,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 250.0),
                    Text(
                      "Name               : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      thirdName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Email                : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      thirdEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 160.0,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.fromHeight(10),
                      shape: StadiumBorder(),
                    ),
                    child: FittedBox(
                      child: Text(
                        "Completed?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please wait",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.cyanAccent.shade400,
                      ));
                      new Future.delayed(const Duration(seconds: 2), () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeletingDoc2FirstTuesdayAppointment(
                                  firstAppoTime: thirdAppoTime,
                                  firstDay: thirdDay,
                                  firstEmail: thirdEmail,
                                  firstIsAvailable: thirdAppo,
                                  firstName: thirdName,
                                  idList: thirdId,
                                  title: "Info",
                                  description:
                                      "Have you completed this appointment?",
                                ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  sepratingDataTuesday2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Appointment Details",
                  style: TextStyle(
                      fontFamily: 'abril',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Day                   : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fourthDay,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Time                 : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fourthAppoTime,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 250.0),
                    Text(
                      "Name               : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fourthName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Email                : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fourthEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 160.0,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.fromHeight(10),
                      shape: StadiumBorder(),
                    ),
                    child: FittedBox(
                      child: Text(
                        "Completed?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please wait",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.cyanAccent.shade400,
                      ));
                      new Future.delayed(const Duration(seconds: 2), () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeletingDoc2SecondTuesdayAppointment(
                                  secondAppoTime: fourthAppoTime,
                                  secondDay: fourthDay,
                                  secondEmail: fourthEmail,
                                  secondIsAvailable: fourthAppo,
                                  secondName: fourthName,
                                  idList: fourthId,
                                  title: "Info",
                                  description:
                                      "Have you completed this appointment?",
                                ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  sepratingDataWednesday() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Appointment Details",
                  style: TextStyle(
                      fontFamily: 'abril',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Day                   : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fifthDay,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Time                 : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fifthAppoTime,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 250.0),
                    Text(
                      "Name               : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fifthName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Email                : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      fifthEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 160.0,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.fromHeight(10),
                      shape: StadiumBorder(),
                    ),
                    child: FittedBox(
                      child: Text(
                        "Completed?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please wait",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.cyanAccent.shade400,
                      ));
                      new Future.delayed(const Duration(seconds: 2), () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeletingDoc2FirstWednesdayAppointment(
                                  firstAppoTime: fifthAppoTime,
                                  firstDay: fifthDay,
                                  firstEmail: fifthEmail,
                                  firstIsAvailable: fifthAppo,
                                  firstName: fifthName,
                                  idList: fifthId,
                                  title: "Info",
                                  description:
                                      "Have you completed this appointment?",
                                ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  sepratingDataWednesday2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Appointment Details",
                  style: TextStyle(
                      fontFamily: 'abril',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Day                   : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      sixthDay,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Time                 : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      sixthAppoTime,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 250.0),
                    Text(
                      "Name               : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      sixthName,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 252.0),
                    Text(
                      "Email                : ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      sixthEmail,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 40.0,
                  width: 160.0,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size.fromHeight(10),
                      shape: StadiumBorder(),
                    ),
                    child: FittedBox(
                      child: Text(
                        "Completed?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please wait",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.cyanAccent.shade400,
                      ));
                      new Future.delayed(const Duration(seconds: 2), () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                DeletingDoc2SecondWednesdayAppointment(
                                  secondAppoTime: sixthAppoTime,
                                  secondDay: sixthDay,
                                  secondEmail: sixthEmail,
                                  secondIsAvailable: sixthAppo,
                                  secondName: sixthName,
                                  idList: sixthId,
                                  title: "Info",
                                  description:
                                      "Have you completed this appointment?",
                                ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    getAppointmentBookingMonday();
    getAppointmentBookingTuesday();
    getAppointmentBookingWednesday();
    // sepratingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            "Appointment Details",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontFamily: 'abril',
            ),
          ),
          centerTitle: true,
          backgroundColor: bgColor.withOpacity(0.0),
          leading: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => DoctorBackDialog(
                  title: "Information",
                  description: "Do you want to leave this page?",
                ),
              );
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/dvp.png"), fit: BoxFit.fill),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 400.0,
                      right: 400.0,
                      top: 30.0,
                      bottom: 30.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        padding:
                            const EdgeInsets.only(left: 150.0, right: 150.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                "Monday",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontFamily: 'abril',
                                ),
                              ),
                              SizedBox(height: 10.0),
                              SizedBox(height: 10.0),
                              sepratingData(),
                              SizedBox(height: 10.0),
                              sepratingData2(),
                              SizedBox(width: 90.0),
                              Text(
                                "Tuesday",
                                style: TextStyle(
                                    fontFamily: 'abril',
                                    fontSize: 35.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(height: 10.0),
                              sepratingDataTuesday(),
                              SizedBox(height: 10.0),
                              sepratingDataTuesday2(),
                              SizedBox(width: 90.0),
                              Text(
                                "Wednesday",
                                style: TextStyle(
                                    fontFamily: 'abril',
                                    fontSize: 35.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(height: 10.0),
                              sepratingDataWednesday(),
                              SizedBox(height: 10.0),
                              sepratingDataWednesday2(),
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
    );
  }
}
