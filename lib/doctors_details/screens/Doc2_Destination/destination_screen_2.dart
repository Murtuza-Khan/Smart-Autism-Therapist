import 'package:admin/Dashbord/constants.dart';
import 'package:admin/doctors_details/Appointment_Booking/Doc2/Booking_screen_2.dart';
import 'package:admin/doctors_details/Appointment_Booking/Doc2/Booking_screen_2_Tuesday.dart';
import 'package:admin/doctors_details/Appointment_Booking/Doc2/Booking_screen_2_Wednesday.dart';
import 'package:admin/doctors_details/doctors_main_screen.dart';
import 'package:admin/doctors_details/models/activity_model.dart';
import 'package:admin/doctors_details/models/destination_model.dart';
import 'package:admin/doctors_details/screens/Doc2_Destination/doctor_verification_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen2 extends StatefulWidget {
  final Destination2 destination2;

  DestinationScreen2({required this.destination2});

  @override
  _DestinationScreen2State createState() => _DestinationScreen2State();
}

class _DestinationScreen2State extends State<DestinationScreen2> {
  // Text _buildRatingStars(int rating) {
  //   String stars = "";
  //   for (int i = 0; i < rating; i++) {
  //     stars += '⭐ ';
  //   }
  //   stars.trim();
  //   return Text(stars);
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoctorsDetails()));
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF98EAFF),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: widget.destination2.imageUrl!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        image: AssetImage(widget.destination2.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(FontAwesomeIcons.arrowLeft),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     // IconButton(
                      //     //   icon: Icon(Icons.search),
                      //     //   iconSize: 30.0,
                      //     //   color: Colors.black,
                      //     //   onPressed: () {},
                      //     // ),
                      //     IconButton(
                      //       icon: Icon(FontAwesomeIcons.userEdit),
                      //       iconSize: 25.0,
                      //       color: Colors.black,
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => DoctorVerification2(),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.destination2.city!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            widget.destination2.country!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.listAlt),
                      iconSize: 25.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorVerification2(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination2.activities2!.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity2 activity = widget.destination2.activities2![index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF98EAFF),
                              offset: Offset(0, 5),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 30.0),
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      activity.name!,
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      // Text(
                                      //   '${activity.price}',
                                      //   style: TextStyle(
                                      //     fontSize: 22.0,
                                      //     fontWeight: FontWeight.w600,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   'PKR',
                                      //   style: TextStyle(
                                      //     color: Colors.grey,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    activity.type!,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              // _buildRatingStars(activity.rating),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    width: 72.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes![0],
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    width: 72.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes![1],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    width: 72.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes2![0],
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    width: 72.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes2![1],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Center(
                                child: Container(
                                  height: 40.0,
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 4),
                                        blurRadius: 5.0,
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
                                        "Book Appointment",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (activity.name == "  Monday") {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              BookingScreen2Monday(
                                            title: "Monday Appointment",
                                            description: "10:00 am - 12:00 pm",
                                            description2: "02:00 pm - 04:00 pm",
                                          ),
                                        );
                                      } else if (activity.name == "  Tuesday") {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              BookingScreen2Tuesday(
                                            title: "Tuesday Appointment",
                                            description: "11:00 am - 01:00 pm",
                                            description2: "03:00 pm - 05:00 pm",
                                          ),
                                        );
                                      } else if (activity.name == "Wednesday") {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              BookingScreen2Wednesday(
                                            title: "Wednesday Appointment",
                                            description: "09:00 am - 11:00 am",
                                            description2: "01:00 pm - 03:00 pm",
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(
                              activity.imageUrl!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
