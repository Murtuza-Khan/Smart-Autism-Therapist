import 'package:admin/View_Feedback/View_feedback_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StarageDetails extends StatefulWidget {
  StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<StarageDetails> createState() => _StarageDetailsState();
}

class _StarageDetailsState extends State<StarageDetails> {
  final userRef = FirebaseFirestore.instance.collection('Video_Url');
  final userRef2 = FirebaseFirestore.instance.collection('Patient_Data');

  int feedbackLength = 0;

  List itemListMedia = [];

  List itemList2Media = [];

  int? lengthMedia;

  List itemNumberMedia = [];

  List itemListPatient = [];

  List itemList2Patient = [];

  int? lengthPatient;

  List itemNumberPatient = [];

  List<ViewFeedFetchModel> feedbacks = []; 

  Future<List<dynamic>> getFeedbackFormSheet() async {
    var raw = await http.get(
      Uri.parse(
          "https://script.google.com/macros/s/AKfycbwmLV8Cd6GCYeR4B2EbzdJzOspDo-KG9NoiD1pcjvECort7AwEW3OqaQmYicVRGV2Vyww/exec"),
    );
    var jsonFeedback = convert.jsonDecode(raw.body);

    jsonFeedback.forEach((element) {
      ViewFeedFetchModel feedbackModel = new ViewFeedFetchModel();
      feedbackModel.name = element['name'];
      feedbackModel.feedback = element['feedback'];
      feedbackModel.profilePic = element['profile_pic'];
      feedbackModel.email = element['email'];
      feedbackModel.inAppRating = element['rating'];
      feedbackModel.dateAndTime = element['date_and_time'];
      feedbackModel.currentTime = element['only_time'];

      feedbacks.add(feedbackModel);
    });

    setState(() {
      feedbackLength = feedbacks.length;
    });

    // print("${feedbacks[0]}");
    print("THIS IS FEEDBACKS LENGTH>>>>>>>>>>>>>> ${feedbacks.length}");
    print(DateTime.now());
    return feedbacks;
  }

  getAppointmentBookingMonday() {
    userRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        itemListMedia.add(doc.data());
        itemList2Media.add(doc.id);
        itemNumberMedia.add(itemListMedia.length);
        print(itemListMedia.length);
        setState(() {
          lengthMedia = itemListMedia.length;
        });
      });
    });
  }

  patientDetails() {
    userRef2.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        itemListPatient.add(doc.data());
        itemList2Patient.add(doc.id);
        itemNumberPatient.add(itemListPatient.length);
        print(itemListPatient.length);
        setState(() {
          lengthPatient = itemListPatient.length;
        });
      });
    });
  }

  mediaFilesCheck() {
    if (lengthMedia == null) {
      return "Loading...";
    } else {
      return lengthMedia;
    }
  }

  feedbackFilesCheck() {
    if (feedbackLength == 0) {
      return "Loading...";
    } else {
      return feedbackLength;
    }
  }

  patientDetailsLength() {
    if (lengthPatient == 0) {
      return "Loading...";
    } else {
      return lengthPatient;
    }
  }

  @override
  void initState() {
    getAppointmentBookingMonday();
    getFeedbackFormSheet();
    patientDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SAT Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: defaultPadding + 10.0),
            Chart(),
            SizedBox(height: defaultPadding),
            StorageInfoCard(
              icon: Icons.medical_services, iconColor: Color(0xFFFFD700),
              title: "No of Doctors",
              amountOfFiles: "3",
              // numOfFiles: 1328,
            ),
            SizedBox(height: 3.0),
            StorageInfoCard(
              icon: Icons.supervised_user_circle, iconColor: Colors.red,
              title: "No of Patient",
              amountOfFiles: patientDetailsLength().toString(),
              // numOfFiles: 140,
            ),
            SizedBox(height: 3.0),
            StorageInfoCard(
              icon: Icons.file_present_sharp, iconColor: Color(0xFF26E5FF),
              title: "No of Files",
              amountOfFiles: mediaFilesCheck().toString(),
              // numOfFiles: 1328,
            ),
            SizedBox(height: 3.0),
            StorageInfoCard(
              icon: Icons.feedback_sharp, iconColor: Colors.blue,
              title: "No of Feedbacks",
              amountOfFiles: feedbackFilesCheck().toString(),
              // numOfFiles: 1328,
            ),
          ],
        ),
      ),
    );
  }
}
