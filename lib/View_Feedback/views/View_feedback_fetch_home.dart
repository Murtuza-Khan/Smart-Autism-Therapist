import 'dart:async';
import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Home_page.dart';
import 'package:admin/View_Feedback/View_feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

class ViewFeedbackFetchHome extends StatefulWidget {
  // const FeedbackFetchHome({ Key key }) : super(key: key);

  @override
  _ViewFeedbackFetchHomeState createState() => _ViewFeedbackFetchHomeState();
}

class _ViewFeedbackFetchHomeState extends State<ViewFeedbackFetchHome> {
  List<ViewFeedFetchModel> feedbacks = [];

  Future<List<dynamic>> getFeedbackFormSheet() async {
    var raw = await http.get(
      Uri.parse(
          "https://script.google.com/macros/s/AKfycbwmLV8Cd6GCYeR4B2EbzdJzOspDo-KG9NoiD1pcjvECort7AwEW3OqaQmYicVRGV2Vyww/exec"),
    );
    var jsonFeedback = convert.jsonDecode(raw.body);

    print('This is json feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedFetchModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print(element);
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

    // print("${feedbacks[0]}");
    print("THIS IS FEEDBACKS LENGTH>>>>>>>>>>>>>> ${feedbacks.length}");
    print(DateTime.now());
    return feedbacks;
  }

  @override
  void initState() {
    super.initState();
  }

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feedback",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'abril',
          ),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(
            FontAwesomeIcons.arrowLeft,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              child: FutureBuilder<List<dynamic>>(
                future: getFeedbackFormSheet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Timer(
                      Duration(milliseconds: 100),
                      () => _controller
                          .jumpTo(_controller.position.maxScrollExtent + 40.0),
                    );
                    return ListView.builder(
                      controller: _controller,
                      reverse: true,
                      itemCount: feedbacks.length,
                      itemBuilder: (context, index) {
                        return FeedbackTile(
                            profilePic: feedbacks[index].profilePic,
                            name: feedbacks[index].name,
                            email: feedbacks[index].email,
                            feedback: feedbacks[index].feedback,
                            inAppRating: feedbacks[index].inAppRating,
                            dateAndTime: feedbacks[index].dateAndTime,
                            currentTime: feedbacks[index].currentTime,
                            feedbacksCheck: feedbacks.last.feedback);
                      },
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FeedbackTile extends StatefulWidget {
  // const FeedbackTile({ Key key }) : super(key: key);

  final String? profilePic, name, email, feedback, dateAndTime, currentTime;

  String? feedbacksCheck;

  final int? inAppRating;

  FeedbackTile({
    @required this.name,
    @required this.email,
    @required this.feedback,
    @required this.profilePic,
    @required this.inAppRating,
    @required this.dateAndTime,
    @required this.currentTime,
    @required this.feedbacksCheck,
  });

  @override
  State<FeedbackTile> createState() => _FeedbackTileState();
}

class _FeedbackTileState extends State<FeedbackTile> {
  @override
  void initState() {
    super.initState();
  }

  ratingInfo() {
    RatingBar.builder(
      minRating: 1,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) => setState(() {
        this.rating = widget.inAppRating!.toDouble();
      }),
    );
  }

  buildRatingStarWithIcon() {
    if (widget.inAppRating == 1) {
      return Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
        ],
      );
    } else if (widget.inAppRating == 2) {
      return Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
        ],
      );
    } else if (widget.inAppRating == 3) {
      return Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
        ],
      );
    } else if (widget.inAppRating == 4) {
      return Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Colors.white),
        ],
      );
    } else if (widget.inAppRating == 5) {
      return Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
        ],
      );
    } else if (widget.inAppRating! > 5) {
      return Row(
        children: [
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
          Icon(Icons.star, color: Color(0xFFFFD700)),
        ],
      );
    }
  }

  bool? greenDot;
  double? rating;
  String? ratingStar;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEE d MMM').format(DateTime.parse(widget.dateAndTime!));

    String formattedyear =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.dateAndTime!));

    // String _feedbackTime =
    //     DateFormat('kk:mm').format(DateTime.parse(widget.dateAndTime));

    String _feedbackTime =
        DateFormat.jm().format(DateTime.parse(widget.dateAndTime!));

    dayAdjustment() {
      String? finalResult = "", resultDay, sForday = formattedDate;
      int? resultDate, idxForday = sForday.indexOf(" ");
      List? partsForday = [
        sForday.substring(0, idxForday),
        sForday.substring(idxForday + 1).trim(),
      ];

      String sForday2 = partsForday[1], forMonth;
      int idxForday2 = sForday2.indexOf(" ");

      List partsForday2 = [
        sForday2.substring(0, idxForday2),
        sForday2.substring(idxForday2 + 1).trim(),
      ];

      resultDay = partsForday[0];
      resultDate = int.parse(partsForday2[0]);
      forMonth = partsForday2[1];

      String? g, s = _feedbackTime;
      int idx = s.indexOf(":");
      List parts = [s.substring(0, idx).trim(), s.substring(idx + 1).trim()];
      int mm = int.parse(parts[0]);

      String? sTwo = s.substring(idx + 1).trim();
      int indexPartTow = sTwo.indexOf(" ");
      List partsTwo = [
        sTwo.substring(0, indexPartTow).trim(),
        sTwo.substring(indexPartTow + 1).trim()
      ];
      String? amPm = partsTwo[1];

      mm = mm + 5;
      if (mm == 13) {
        mm = 1;
      } else if (mm == 14) {
        mm = 2;
      } else if (mm == 15) {
        mm = 3;
      } else if (mm == 16) {
        mm = 4;
      } else if (mm == 17) {
        mm = 5;
      } else if (mm == 18) {
        mm = 6;
      } else if (mm == 19) {
        mm = 7;
      } else if (mm == 20) {
        mm = 8;
      } else if (mm == 21) {
        mm = 9;
      } else if (mm == 22) {
        mm = 10;
      } else if (mm == 23) {
        mm = 11;
      } else if (mm == 24) {
        mm = 12;
      }

      if (mm == 5 && amPm == "PM") {
        g = "PM";
      } else if (mm == 6 && amPm == "PM") {
        g = "PM";
      } else if (mm == 7 && amPm == "PM") {
        g = "PM";
      } else if (mm == 8 && amPm == "PM") {
        g = "PM";
      } else if (mm == 9 && amPm == "PM") {
        g = "PM";
      } else if (mm == 10 && amPm == "PM") {
        g = "PM";
      } else if (mm == 11 && amPm == "PM") {
        g = "PM";
      } else if (mm == 12 && amPm == "PM") {
        g = "AM";
      } else if (mm == 1 && amPm == "PM") {
        g = "AM";
      } else if (mm == 2 && amPm == "PM") {
        g = "AM";
      } else if (mm == 3 && amPm == "PM") {
        g = "AM";
      } else if (mm == 4 && amPm == "PM") {
        g = "AM";
      } else if (mm == 5 && amPm == "AM") {
        g = "AM";
      } else if (mm == 6 && amPm == "AM") {
        g = "AM";
      } else if (mm == 7 && amPm == "AM") {
        g = "AM";
      } else if (mm == 8 && amPm == "AM") {
        g = "AM";
      } else if (mm == 9 && amPm == "AM") {
        g = "AM";
      } else if (mm == 10 && amPm == "AM") {
        g = "AM";
      } else if (mm == 11 && amPm == "AM") {
        g = "AM";
      } else if (mm == 12 && amPm == "AM") {
        g = "PM";
      } else if (mm == 1 && amPm == "AM") {
        g = "PM";
      } else if (mm == 2 && amPm == "AM") {
        g = "PM";
      } else if (mm == 3 && amPm == "AM") {
        g = "PM";
      } else if (mm == 4 && amPm == "AM") {
        g = "PM";
      }

      if (mm == 12 && g == "AM" && resultDay == "Mon") {
        resultDay = "Tue";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Mon") {
        resultDay = "Tue";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Mon") {
        resultDay = "Tue";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Mon") {
        resultDay = "Tue";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Mon") {
        resultDay = "Tue";
        resultDate = resultDate + 1;
      } else if (mm == 12 && g == "AM" && resultDay == "Tue") {
        resultDay = "Wed";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Tue") {
        resultDay = "Wed";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Tue") {
        resultDay = "Wed";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Tue") {
        resultDay = "Wed";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Tue") {
        resultDay = "Wed";
        resultDate = resultDate + 1;
      } else if (mm == 12 && g == "AM" && resultDay == "Wed") {
        resultDay = "Thu";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Wed") {
        resultDay = "Thu";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Wed") {
        resultDay = "Thu";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Wed") {
        resultDay = "Thu";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Wed") {
        resultDay = "Thu";
        resultDate = resultDate + 1;
      } else if (mm == 12 && g == "AM" && resultDay == "Thu") {
        resultDay = "Fri";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Thu") {
        resultDay = "Fri";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Thu") {
        resultDay = "Fri";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Thu") {
        resultDay = "Fri";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Thu") {
        resultDay = "Fri";
        resultDate = resultDate + 1;
      } else if (mm == 12 && g == "AM" && resultDay == "Fri") {
        resultDay = "Sat";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Fri") {
        resultDay = "Sat";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Fri") {
        resultDay = "Sat";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Fri") {
        resultDay = "Sat";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Fri") {
        resultDay = "Sat";
        resultDate = resultDate + 1;
      } else if (mm == 12 && g == "AM" && resultDay == "Sat") {
        resultDay = "Sun";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Sat") {
        resultDay = "Sun";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Sat") {
        resultDay = "Sun";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Sat") {
        resultDay = "Sun";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Sat") {
        resultDay = "Sun";
        resultDate = resultDate + 1;
      } else if (mm == 12 && g == "AM" && resultDay == "Sun") {
        resultDay = "Mon";
        resultDate = resultDate + 1;
      } else if (mm == 1 && g == "AM" && resultDay == "Sun") {
        resultDay = "Mon";
        resultDate = resultDate + 1;
      } else if (mm == 2 && g == "AM" && resultDay == "Sun") {
        resultDay = "Mon";
        resultDate = resultDate + 1;
      } else if (mm == 3 && g == "AM" && resultDay == "Sun") {
        resultDay = "Mon";
        resultDate = resultDate + 1;
      } else if (mm == 4 && g == "AM" && resultDay == "Sun") {
        resultDay = "Mon";
        resultDate = resultDate + 1;
      }

      if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Mon") {
        forMonth = "Feb";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Tue") {
        forMonth = "Feb";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Wed") {
        forMonth = "Feb";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Thu") {
        forMonth = "Feb";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Fri") {
        forMonth = "Feb";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Sat") {
        forMonth = "Feb";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jan" &&
          resultDay == "Sun") {
        forMonth = "Feb";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Mon") {
        forMonth = "Mar";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Tue") {
        forMonth = "Mar";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Wed") {
        forMonth = "Mar";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Thu") {
        forMonth = "Mar";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Fri") {
        forMonth = "Mar";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Sat") {
        forMonth = "Mar";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 28 &&
          forMonth == "Feb" &&
          resultDay == "Sun") {
        forMonth = "Mar";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Mon") {
        forMonth = "Apr";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Tue") {
        forMonth = "Apr";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Wed") {
        forMonth = "Apr";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Thu") {
        forMonth = "Apr";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Fri") {
        forMonth = "Apr";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Sat") {
        forMonth = "Apr";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Mar" &&
          resultDay == "Sun") {
        forMonth = "Apr";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Mon") {
        forMonth = "May";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Tue") {
        forMonth = "May";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Wed") {
        forMonth = "May";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Thu") {
        forMonth = "May";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Fri") {
        forMonth = "May";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Sat") {
        forMonth = "May";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Apr" &&
          resultDay == "Sun") {
        forMonth = "May";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Mon") {
        forMonth = "Jun";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Tue") {
        forMonth = "Jun";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Wed") {
        forMonth = "Jun";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Thu") {
        forMonth = "Jun";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Fri") {
        forMonth = "Jun";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Sat") {
        forMonth = "Jun";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "May" &&
          resultDay == "Sun") {
        forMonth = "Jun";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Mon") {
        forMonth = "Jul";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Tue") {
        forMonth = "Jul";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Wed") {
        forMonth = "Jul";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Thu") {
        forMonth = "Jul";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Fri") {
        forMonth = "Jul";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Sat") {
        forMonth = "Jul";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Jun" &&
          resultDay == "Sun") {
        forMonth = "Jul";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Mon") {
        forMonth = "Aug";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Tue") {
        forMonth = "Aug";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Wed") {
        forMonth = "Aug";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Thu") {
        forMonth = "Aug";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Fri") {
        forMonth = "Aug";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Sat") {
        forMonth = "Aug";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Jul" &&
          resultDay == "Sun") {
        forMonth = "Aug";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Mon") {
        forMonth = "Sep";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Tue") {
        forMonth = "Sep";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Wed") {
        forMonth = "Sep";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Thu") {
        forMonth = "Sep";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Fri") {
        forMonth = "Sep";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Sat") {
        forMonth = "Sep";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Aug" &&
          resultDay == "Sun") {
        forMonth = "Sep";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Mon") {
        forMonth = "Oct";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Tue") {
        forMonth = "Oct";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Wed") {
        forMonth = "Oct";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Thu") {
        forMonth = "Oct";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Fri") {
        forMonth = "Oct";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Sat") {
        forMonth = "Oct";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Sep" &&
          resultDay == "Sun") {
        forMonth = "Oct";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Mon") {
        forMonth = "Nov";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Tue") {
        forMonth = "Nov";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Wed") {
        forMonth = "Nov";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Thu") {
        forMonth = "Nov";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Fri") {
        forMonth = "Nov";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Sat") {
        forMonth = "Nov";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Oct" &&
          resultDay == "Sun") {
        forMonth = "Nov";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Mon") {
        forMonth = "Dec";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Tue") {
        forMonth = "Dec";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Wed") {
        forMonth = "Dec";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Thu") {
        forMonth = "Dec";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Fri") {
        forMonth = "Dec";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Sat") {
        forMonth = "Dec";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 30 &&
          forMonth == "Nov" &&
          resultDay == "Sun") {
        forMonth = "Dec";
        resultDay = "Mon";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Mon") {
        forMonth = "Jan";
        resultDay = "Tue";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Tue") {
        forMonth = "Jan";
        resultDay = "Wed";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Wed") {
        forMonth = "Jan";
        resultDay = "Thu";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Thu") {
        forMonth = "Jan";
        resultDay = "Fri";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Fri") {
        forMonth = "Jan";
        resultDay = "Sat";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Sat") {
        forMonth = "Jan";
        resultDay = "Sun";
        resultDate = 1;
      } else if ((mm == 12 || mm == 1 || mm == 2 || mm == 3 || mm == 4) &&
          g == "AM" &&
          resultDate == 31 &&
          forMonth == "Dec" &&
          resultDay == "Sun") {
        forMonth = "Jan";
        resultDay = "Mon";
        resultDate = 1;
      }
      print(finalResult);
      return finalResult = "$resultDay $resultDate $forMonth";

      // return result = ", $result";
    }

    dateYearAdjustment() {
      String? g, s = formattedyear;
      int idx = s.indexOf("-");
      List parts = [
        s.substring(0, idx).trim(),
        s.substring(idx + 1).trim(),
        s.substring(idx + 2).trim()
      ];
      g = parts[0];
      return g = ", $g";
    }

    timeAdjust() {
      String? sdf = "", g, s = _feedbackTime;
      int idx = s.indexOf(":");
      List parts = [s.substring(0, idx).trim(), s.substring(idx + 1).trim()];
      int mm = int.parse(parts[0]);

      String sTwo = s.substring(idx + 1).trim();
      int indexPartTow = sTwo.indexOf(" ");
      List partsTwo = [
        sTwo.substring(0, indexPartTow).trim(),
        sTwo.substring(indexPartTow + 1).trim()
      ];
      String amPm = sTwo.substring(indexPartTow + 1).trim();
      String secondHalf = partsTwo[0];

      mm = mm + 5;
      if (mm == 13) {
        mm = 1;
      } else if (mm == 14) {
        mm = 2;
      } else if (mm == 15) {
        mm = 3;
      } else if (mm == 16) {
        mm = 4;
      } else if (mm == 17) {
        mm = 5;
      } else if (mm == 18) {
        mm = 6;
      } else if (mm == 19) {
        mm = 7;
      } else if (mm == 20) {
        mm = 8;
      } else if (mm == 21) {
        mm = 9;
      } else if (mm == 22) {
        mm = 10;
      } else if (mm == 23) {
        mm = 11;
      } else if (mm == 24) {
        mm = 12;
      }

      // if (amPm == "PM") {
      //   g = "AM";
      // } else if (amPm == "AM") {
      //   g = "PM";
      // }

      if (mm == 5 && amPm == "PM") {
        g = "PM";
      } else if (mm == 6 && amPm == "PM") {
        g = "PM";
      } else if (mm == 7 && amPm == "PM") {
        g = "PM";
      } else if (mm == 8 && amPm == "PM") {
        g = "PM";
      } else if (mm == 9 && amPm == "PM") {
        g = "PM";
      } else if (mm == 10 && amPm == "PM") {
        g = "PM";
      } else if (mm == 11 && amPm == "PM") {
        g = "PM";
      } else if (mm == 12 && amPm == "PM") {
        g = "AM";
      } else if (mm == 1 && amPm == "PM") {
        g = "AM";
      } else if (mm == 2 && amPm == "PM") {
        g = "AM";
      } else if (mm == 3 && amPm == "PM") {
        g = "AM";
      } else if (mm == 4 && amPm == "PM") {
        g = "AM";
      } else if (mm == 5 && amPm == "AM") {
        g = "AM";
      } else if (mm == 6 && amPm == "AM") {
        g = "AM";
      } else if (mm == 7 && amPm == "AM") {
        g = "AM";
      } else if (mm == 8 && amPm == "AM") {
        g = "AM";
      } else if (mm == 9 && amPm == "AM") {
        g = "AM";
      } else if (mm == 10 && amPm == "AM") {
        g = "AM";
      } else if (mm == 11 && amPm == "AM") {
        g = "AM";
      } else if (mm == 12 && amPm == "AM") {
        g = "PM";
      } else if (mm == 1 && amPm == "AM") {
        g = "PM";
      } else if (mm == 2 && amPm == "AM") {
        g = "PM";
      } else if (mm == 3 && amPm == "AM") {
        g = "PM";
      } else if (mm == 4 && amPm == "AM") {
        g = "PM";
      }

      if (secondHalf.length == 1) {
        secondHalf = "0$secondHalf";
      }
      print(sdf);
      return sdf = "$mm:$secondHalf $g";
    }

    return Column(
      children: [
        // forSizedBox(),
        Padding(
          padding: const EdgeInsets.only(
              left: 150.0, right: 150.0, top: 50.0, bottom: 25.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                greenDot = false;
              });
            },
            child: Container(
              // height: height,
              // width: (feedback.length + 5.0).toDouble(),
              // height: (widget.feedback.length + 30.0).toDouble(),
              constraints: BoxConstraints(
                minHeight: 100,
                // maxHeight: (widget.feedback.length + 30.0).toDouble(),
              ),

              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFD700),
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFFFFCDCE),
                  Color(0xFFF7F0A5),
                ]),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: primaryDashColor.withOpacity(0.2),
                            //     blurRadius: 10,
                            //     offset: Offset(0, 0),
                            //   ),
                            // ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF2F266B).withOpacity(0.5),
                                Color(0xFF9B3265).withOpacity(0.5),
                              ],
                            ),
                          ),
                          height: 50,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                              child: Image.network(widget.profilePic!),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: primaryDashColor.withOpacity(0.2),
                            //     blurRadius: 10,
                            //     offset: Offset(0, 0),
                            //   ),
                            // ],
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(
                              tileMode: TileMode.clamp,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF2F266B).withOpacity(0.5),
                                Color(0xFF9B3265).withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name!,
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    buildRatingStarWithIcon(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        // Visibility(
                        //   visible: greenDot,
                        //   child: Container(
                        //     height: 20.0,
                        //     width: 20.0,
                        //     decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //         colors: [
                        //           Color(0xFF19B2D1),
                        //           Color(0xFF98EAFF),
                        //         ],
                        //       ),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(30.0)),
                        //       // border: Border.all(color: Colors.cyanAccent, width: 1),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.black,
                        //           blurRadius: 10,
                        //           offset: Offset(0, 0),
                        //         ),
                        //       ],
                        //       // color: Colors.green,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 35.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.feedback!,
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                            // maxLines: 12,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          timeAdjust(),
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                          // maxLines: 12,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          dayAdjustment() + dateYearAdjustment(),
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                          // maxLines: 12,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
