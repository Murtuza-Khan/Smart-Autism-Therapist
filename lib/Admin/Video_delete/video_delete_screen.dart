import 'package:admin/Admin/Video_delete/Video_delete_confirm_dialog.dart';
import 'package:admin/Admin/Video_delete/video_delete_list_screen.dart';
import 'package:admin/Dashbord/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

final userRef = FirebaseFirestore.instance.collection('Video_Url');

class VideoDeleteScreen extends StatefulWidget {
  final String? videoLink;
  final String? userEmail;
  final String? userImageUrl;
  final String? userName;
  final String? userUid;
  final String? docId;
  final String? uploadDate;
  final String? uploaTime;
  final String? fileType;
  final String? doctorName;

  VideoDeleteScreen({
    this.videoLink,
    this.userEmail,
    this.userImageUrl,
    this.userName,
    this.userUid,
    required this.docId,
    this.uploaTime,
    this.uploadDate,
    this.fileType,
    this.doctorName,
  });

  @override
  _VideoDeleteScreenState createState() => _VideoDeleteScreenState();
}

class _VideoDeleteScreenState extends State<VideoDeleteScreen> {
  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

  @override
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
            "Delete Files",
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
                      builder: (context) => VideoDeleteListScreen()));
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
                padding: const EdgeInsets.only(left: 500.0, right: 500.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.25,
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.25,
                          decoration: BoxDecoration(
                            color: secondaryColor.withOpacity(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.25,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      // SizedBox(height: 30.0),
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
                                      SizedBox(height: 60.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 260.0),
                                          Text(
                                            "User Name                  : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
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
                                          SizedBox(width: 260.0),
                                          Text(
                                            "User Email                   : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Container(
                                            width: 150.0,
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
                                          SizedBox(width: 260.0),
                                          Text(
                                            "User UID                       : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 38.0),
                                          Container(
                                            width: 250.0,
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
                                          SizedBox(width: 260.0),
                                          Text(
                                            "Doctor Name            : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Container(
                                            width: 250.0,
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
                                          SizedBox(width: 260.0),
                                          Text(
                                            "File Type                      : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Container(
                                            width: 250.0,
                                            child: Text(
                                              widget.fileType!,
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
                                          SizedBox(width: 260.0),
                                          Text(
                                            "Upload Time              : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Container(
                                            width: 250.0,
                                            child: Text(
                                              widget.uploaTime!,
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
                                          SizedBox(width: 260.0),
                                          Text(
                                            "Upload Date              : ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Container(
                                            width: 250.0,
                                            child: Text(
                                              widget.uploadDate!,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 60.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50.0,
                                            width: 270.0,
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
                                                  "Download",
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
                                                  downloadFile(
                                                      widget.videoLink!);
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 40.0),
                                          Container(
                                            height: 50.0,
                                            width: 270.0,
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
                                                          VideoDeleteConfirmDialog(
                                                            videoUrl: widget
                                                                .videoLink!,
                                                            docID:
                                                                widget.docId!,
                                                            title:
                                                                "Information",
                                                            description:
                                                                "Do you want to delete this file",
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
