import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../dialog_success_error.dart';

final user = FirebaseAuth.instance.currentUser;
final userRef =
    FirebaseFirestore.instance.collection('Appointment_Doc2_Tuesday');

class BookingScreen2Tuesday extends StatefulWidget {
  final String? title, description, description2, buttonText;
  final Image? image;

  BookingScreen2Tuesday(
      {this.title,
      this.description,
      this.description2,
      this.buttonText,
      this.image});

  @override
  State<BookingScreen2Tuesday> createState() => _BookingScreen2TuesdayState();
}

class _BookingScreen2TuesdayState extends State<BookingScreen2Tuesday> {
  var currentDateTime = DateTime.now();
  Color changeColor = Colors.grey;
  bool isChecked = false;
  bool isChecked2 = false;
  bool isBooked = true;
  String appointmentAvailable = "Booked";
  String appointmentAvailable2 = "Booked";
  String appoAvailPrint = "Available";
  String appoAvailPrint2 = "Available";
  Color? checkColor;
  List itemList = [];
  int index = 0;

  @override
  void initState() {
    getAppointmentBooking();
    super.initState();
  }

  getAppointmentBooking() {
    userRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        print(doc.id);
        print(doc.exists);
        itemList.add(doc.data());
        print(itemList.length);

        if (itemList[index]["isAvailable"] == "Booked" &&
            itemList[index]["appointment_time"] == "11:00 am - 01:00 pm" &&
            itemList[index]["day"] == "Tuesday") {
          setState(() {
            appoAvailPrint = "Booked";
            if (appoAvailPrint2 == "") {
              appoAvailPrint2 = "Available";
            }
          });
        } else if (itemList[index]["isAvailable"] == "Booked" &&
            itemList[index]["appointment_time"] == "03:00 pm - 05:00 pm" &&
            itemList[index]["day"] == "Tuesday") {
          setState(() {
            appoAvailPrint2 = "Booked";
            if (appoAvailPrint == "") {
              appoAvailPrint = "Available";
            }
          });
        }
        setState(() {
          index++;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    String _feedbackTime =
        DateFormat.jm().format(DateTime.parse(currentDateTime.toString()));
    String formattedyear = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(currentDateTime.toString()));
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title!,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                onTap: () {
                  print(widget.description);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.description!,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    SizedBox(width: 10.0),
                    if (appoAvailPrint == "Booked") ...[
                      Spacer(),
                      Container(
                        height: 18.0,
                        width: 18.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                    ] else ...[
                      Spacer(),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            if (appoAvailPrint == "Available" ||
                                appoAvailPrint == "") {
                              this.isChecked = value!;
                            } else {
                              this.isChecked = false;
                            }
                          });
                        },
                      ),
                    ],
                    SizedBox(width: 7.0),
                    Text(
                      appoAvailPrint,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                onTap: () {
                  print(widget.description2);
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.description2!,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(width: 10.0),
                    if (appoAvailPrint2 == "Booked") ...[
                      Spacer(),
                      Container(
                        height: 18.0,
                        width: 18.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                    ] else ...[
                      Spacer(),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: isChecked2,
                        onChanged: (value) {
                          setState(() {
                            if (appoAvailPrint2 == "Available" ||
                                appoAvailPrint2 == "") {
                              this.isChecked2 = value!;
                            } else {
                              this.isChecked2 = false;
                              checkColor = Colors.grey;
                            }
                          });
                        },
                      ),
                    ],
                    SizedBox(width: 7.0),
                    Text(
                      appoAvailPrint2,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    if (isChecked == true && isChecked2 == true) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialogBoxSigninError(
                                title: "Error",
                                description:
                                    "You can select only one appointment at a time",
                              ));
                    } else {
                      if (isChecked == true) {
                        Map<String, dynamic> data = {
                          "email": user!.email,
                          "name": user!.displayName,
                          "appointment_time": widget.description,
                          "isAvailable": appointmentAvailable,
                          "day": "Tuesday"
                        };
                        FirebaseFirestore.instance
                            .collection("Appointment_Doc2_Tuesday")
                            .add(data)
                            .then((value) {
                          Map<String, dynamic> data = {
                            "email": user!.email,
                            "name": user!.displayName,
                            "appointment_time": widget.description,
                            "isAvailable": appointmentAvailable,
                            "day": "Tuesday",
                            "image": user!.photoURL,
                            "uid": user!.uid,
                            "appointment_booked_on_date": formattedyear,
                            "appointment_booked_on_time": _feedbackTime,
                            "doctor_name": "Zain Ahmed",
                            "sort": currentDateTime,
                          };
                          FirebaseFirestore.instance
                              .collection("Admin_Data")
                              .add(data)
                              .then((value) {
                            setState(() {
                              appoAvailPrint = "Booked";
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Your appointment is booked",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.cyanAccent.shade400,
                            ));
                          });
                        });
                      } else if (isChecked2 == true) {
                        Map<String, dynamic> data = {
                          "email": user!.email,
                          "name": user!.displayName,
                          "appointment_time": widget.description2,
                          "isAvailable": appointmentAvailable2,
                          "day": "Tuesday"
                        };
                        FirebaseFirestore.instance
                            .collection("Appointment_Doc2_Tuesday")
                            .add(data)
                            .then((value) {
                          Map<String, dynamic> data = {
                            "email": user!.email,
                            "name": user!.displayName,
                            "appointment_time": widget.description2,
                            "isAvailable": appointmentAvailable2,
                            "day": "Tuesday",
                            "image": user!.photoURL,
                            "uid": user!.uid,
                            "appointment_booked_on_date": formattedyear,
                            "appointment_booked_on_time": _feedbackTime,
                            "doctor_name": "Zain Ahmed",
                            "sort": currentDateTime,
                          };
                          FirebaseFirestore.instance
                              .collection("Admin_Data")
                              .add(data)
                              .then((value) {
                            setState(() {
                              appoAvailPrint2 = "Booked";
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Your appointment is booked",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.cyanAccent.shade400,
                            ));
                          });
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    }

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => FAQScreen()));
                  },
                  child: Text("Confirm"),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16.0,
          right: 16.0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 55,
            child: ClipRRect(
              child: Image.asset('assets/info.jpg'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ],
    );
  }
}
