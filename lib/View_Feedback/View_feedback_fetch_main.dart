import 'package:admin/View_Feedback/views/View_feedback_fetch_home.dart';
import 'package:flutter/material.dart';

class ViewFeedbackFetchMain extends StatelessWidget {
  // const FeedbackFetchMain({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Autism Therapist",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ViewFeedbackFetchHome(),
    );
  }
}