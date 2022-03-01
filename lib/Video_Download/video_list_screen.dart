import 'dart:ui';
import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Home_page.dart';
import 'package:admin/Video_Download/video_download_screen.dart';
import 'package:admin/const_doctor_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoListScreen extends StatefulWidget {
  // final int noAppointment;

  // AdminScreen({this.noAppointment});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  dynamic userRef = "";

  final user = FirebaseAuth.instance.currentUser;

  List itemList = [];
  List itemList2 = [];
  int index = 0;
  int? length;
  String? id;
  List itemNumber = [];
  int number = 0;

  getAppointmentBookingMonday() {
    if (user!.email == firstDoctorEmail) {
      setState(() {
        userRef = FirebaseFirestore.instance.collection('Video_Url');
      });
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
    } else if (user!.email == secondDoctorEmail) {
      setState(() {
        userRef = FirebaseFirestore.instance.collection('Video_Url2');
      });
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
    } else if (user!.email == thirdDoctorEmail) {
      setState(() {
        userRef = FirebaseFirestore.instance.collection('Video_Url3');
      });
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
    return Scaffold(
        backgroundColor: bgColor,
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
            "Files List",
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
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
                    image: AssetImage("assets/dvp.png"), fit: BoxFit.fill),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 500.0,
                      right: 500.0,
                      top: 50.0,
                      bottom: 50.0,
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
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: StreamBuilder(
                          stream: userRef
                              .orderBy('Sort', descending: true)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Column(
                              children: [
                                SizedBox(height: 35.0),
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
                                        "Total Files:  $length",
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
                                                                  VideoDownloadScreen(
                                                                    documentID:
                                                                        document
                                                                            .id,
                                                                    fileType:
                                                                        document[
                                                                            'File_type'],
                                                                    videoSort:
                                                                        document[
                                                                            'Sort'],
                                                                    uploadTime:
                                                                        document[
                                                                            'time'],
                                                                    uploadDate:
                                                                        document[
                                                                            'date'],
                                                                    userEmail:
                                                                        document[
                                                                            'email'],
                                                                    userImageUrl:
                                                                        document[
                                                                            'profile_pic'],
                                                                    userName:
                                                                        document[
                                                                            'name'],
                                                                    userUid:
                                                                        document[
                                                                            'uid'],
                                                                    videoLink:
                                                                        document[
                                                                            'video_url'],
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
                                                                .center,
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
                                                              height: 40.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "User Name  :  ${document['name']}",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
