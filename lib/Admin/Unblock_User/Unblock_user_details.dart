import 'package:admin/Admin/Unblock_User/delete_confirmation_screen.dart';
import 'package:admin/Admin/Unblock_User/unblock_user.dart';
import 'package:admin/Dashbord/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class UnblockUserDetailsScreen extends StatefulWidget {
  final String? doctorEmail;
  final String? doctorName;
  final String? userEmail;
  final String? reportSubmissionDate;
  final String? reportSubmissionTime;
  final String? docID;
  final String? day;
  final String? reportDescription;
  final String? imageUrl;

  const UnblockUserDetailsScreen(
      {this.doctorEmail,
      this.doctorName,
      this.userEmail,
      this.reportSubmissionDate,
      this.reportSubmissionTime,
      this.docID,
      this.day,
      this.reportDescription,
      this.imageUrl});

  @override
  _UnblockUserDetailsScreenState createState() =>
      _UnblockUserDetailsScreenState();
}

class _UnblockUserDetailsScreenState extends State<UnblockUserDetailsScreen> {
  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

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
            "Report Details",
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
                  MaterialPageRoute(builder: (context) => UnblockUserScreen()));
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
                      left: 470.0,
                      right: 470.0,
                      top: 60.0,
                      bottom: 60.0,
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
                                  // width:
                                  // MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 1.48,
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
                                          Center(
                                            child: Stack(
                                              children: [
                                                Icon(
                                                  Icons.report,
                                                  color: Colors.black38,
                                                  size: 102.0,
                                                ),
                                                Icon(
                                                  Icons.report,
                                                  color: Colors.red,
                                                  size: 100.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 40.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 220.0),
                                              Text(
                                                "Doctor Name                                 : ",
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
                                              SizedBox(width: 220.0),
                                              Text(
                                                "Doctor Email                                   : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 300.0,
                                                child: Text(
                                                  widget.doctorEmail!,
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
                                              SizedBox(width: 220.0),
                                              Text(
                                                "Report Submission Day              : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.day!,
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
                                              SizedBox(width: 220.0),
                                              Text(
                                                "Report Submission Time            : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.reportSubmissionTime!,
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
                                              SizedBox(width: 220.0),
                                              Text(
                                                "Report Submission Date            : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 150.0,
                                                child: Text(
                                                  widget.reportSubmissionDate!,
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
                                              SizedBox(width: 220.0),
                                              Text(
                                                "Report Description",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 75.0),
                                              Text(
                                                " : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                width: 300.0,
                                                child: Text(
                                                  widget.reportDescription!,
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
                                              SizedBox(width: 220.0),
                                              Text(
                                                "User Email                                       : ",
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
                                          // SizedBox(height: 30.0),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   children: [
                                          //     SizedBox(width: 220.0),
                                          //     Text(
                                          //       "Booking Time                      : ",
                                          //       style: TextStyle(
                                          //         color: Colors.white,
                                          //       ),
                                          //     ),
                                          //     SizedBox(width: 30.0),
                                          //     Container(
                                          //       width: 150.0,
                                          //       child: Text(
                                          //         widget.bookingTime!,
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          SizedBox(height: 40.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent,
                                                    minimumSize:
                                                        Size.fromHeight(10),
                                                    shape: StadiumBorder(),
                                                  ),
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Download",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    print(widget.imageUrl!);
                                                    // firstId = itemList.indexWhere((element) => element["appointment_time"] == "9:00 am - 11:00 am")
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Row(
                                                        children: [
                                                          Text(
                                                            "Please wait",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          CircularProgressIndicator(
                                                            color: Colors.black,
                                                          ),
                                                        ],
                                                      ),
                                                      duration:
                                                          Duration(seconds: 2),
                                                      backgroundColor: Colors
                                                          .cyanAccent.shade400,
                                                    ));
                                                    new Future.delayed(
                                                        const Duration(
                                                            seconds: 2), () {
                                                      downloadFile(
                                                          widget.imageUrl!);
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 80.0),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent,
                                                    minimumSize:
                                                        Size.fromHeight(10),
                                                    shape: StadiumBorder(),
                                                  ),
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Unblock",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    print(widget.docID);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Row(
                                                        children: [
                                                          Text(
                                                            "Please wait",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          CircularProgressIndicator(
                                                            color: Colors.black,
                                                          ),
                                                        ],
                                                      ),
                                                      duration:
                                                          Duration(seconds: 2),
                                                      backgroundColor: Colors
                                                          .cyanAccent.shade400,
                                                    ));
                                                    new Future.delayed(
                                                        const Duration(
                                                            seconds: 2), () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              DeleteConfirmationScreen(
                                                                docID: widget
                                                                    .docID!,
                                                                photoUrl: widget
                                                                    .imageUrl!,
                                                                title:
                                                                    "Information",
                                                                description:
                                                                    "Do you want to Unblock this user?",
                                                              ));
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
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
