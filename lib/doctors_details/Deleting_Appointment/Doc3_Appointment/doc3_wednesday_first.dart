import 'package:admin/dialog_success_error.dart';
import 'package:admin/doctors_details/screens/Doc3_Destination/updating_appointment3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final user = FirebaseAuth.instance.currentUser;
final userRef =
    FirebaseFirestore.instance.collection('Appointment_Doc3_Wednesday');

class DeletingDoc3FirstWednesdayAppointment extends StatefulWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final Image? image;

  final String? firstIsAvailable;
  final String? firstAppoTime;
  final String? firstDay;
  final String? firstEmail;
  final String? firstName;

  final String? idList;
  DeletingDoc3FirstWednesdayAppointment({
    this.title,
    this.description,
    this.buttonText,
    this.image,
    @required this.firstAppoTime,
    @required this.firstDay,
    @required this.firstEmail,
    @required this.firstIsAvailable,
    @required this.firstName,
    @required this.idList,
  });

  @override
  State<DeletingDoc3FirstWednesdayAppointment> createState() =>
      _DeletingDoc3FirstWednesdayAppointmentState();
}

class _DeletingDoc3FirstWednesdayAppointmentState
    extends State<DeletingDoc3FirstWednesdayAppointment> {
  var currentDateTime = DateTime.now();

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
          width: 500.0,
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
              Text(
                widget.description!,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No", style: TextStyle(fontSize: 18.0)),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        try {
                          userRef.doc(widget.idList).delete().whenComplete(() {
                            Map<String, dynamic> data = {
                              "email": user!.email,
                              "name": user!.displayName,
                              "appointment_time": widget.firstAppoTime,
                              "isAvailable": "Completed",
                              "day": "Wednesday",
                              "image": user!.photoURL,
                              "uid": user!.uid,
                              "appointment_booked_on_date": formattedyear,
                              "appointment_booked_on_time": _feedbackTime,
                              "doctor_name": "Sohaib-ur-Rehman",
                              "sort": currentDateTime,
                            };
                            FirebaseFirestore.instance
                                .collection("Admin_Data_Completed_Appointments")
                                .add(data)
                                .then(
                                  (value) => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdatingAppointment3(),
                                      ),
                                    ),
                                  },
                                );
                          });
                        } catch (e) {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialogBoxSigninError(
                              title: "Error",
                              description: "No data available",
                            ),
                          );
                        }
                      },
                      child: Text("Yes", style: TextStyle(fontSize: 18.0)),
                    ),
                  ),
                ],
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
