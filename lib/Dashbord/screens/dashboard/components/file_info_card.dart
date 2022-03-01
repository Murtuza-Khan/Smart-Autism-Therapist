import 'package:admin/Chat_App/new_chat_main.dart';
import 'package:admin/Dashbord/models/MyFiles.dart';
import 'package:admin/Dashbord/responsive.dart';
import 'package:admin/Video_Download/main_video_download.dart';
import 'package:admin/View_Feedback/View_feedback_fetch_main.dart';
import 'package:admin/doctors_details/screens/default_doctor_verification_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class FileInfoCard extends StatelessWidget {
  FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: info.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xFFFFD700), width: 2.0)),
                child: info.icon,
              ),
              SizedBox(width: defaultPadding),
            ],
          ),
          Center(
            child: Text(
              info.title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (Responsive.isMobile(context)) ...[
            Center(
              child: OutlinedButton(
                onPressed: () {
                  if (info.id == 4) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewFeedbackFetchMain(),
                      ),
                    );
                  } else if (info.id == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyNewChatFinalApp(),
                      ),
                    );
                  } else if (info.id == 3) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainDownloadScreen(),
                      ),
                    );
                  } else if (info.id == 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DefaultDoctorVerificationScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.teal,
                  backgroundColor: Color(0xFFFFD700).withOpacity(0.1),
                  // minimumSize:
                  shadowColor: Color(0xFFFFD700),
                  side: BorderSide(color: Colors.white, width: 2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  minimumSize: Size(200, 50),
                ),
              ),
            ),
          ],

          if (Responsive.isTablet(context)) ...[
            Expanded(
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (info.id == 4) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewFeedbackFetchMain(),
                        ),
                      );
                    } else if (info.id == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyNewChatFinalApp(),
                        ),
                      );
                    } else if (info.id == 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainDownloadScreen(),
                        ),
                      );
                    } else if (info.id == 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DefaultDoctorVerificationScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                      // fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.teal,
                    backgroundColor: Color(0xFFFFD700).withOpacity(0.1),
                    // minimumSize:
                    shadowColor: Color(0xFFFFD700),
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    minimumSize: Size(200, 50),
                  ),
                ),
              ),
            ),
          ],

          if (Responsive.isDesktop(context)) ...[
            Expanded(
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (info.id == 4) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewFeedbackFetchMain(),
                        ),
                      );
                    } else if (info.id == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyNewChatFinalApp(),
                        ),
                      );
                    } else if (info.id == 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainDownloadScreen(),
                        ),
                      );
                    } else if (info.id == 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DefaultDoctorVerificationScreen(),
                        ),
                      );
                    }
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => FeedBackScreen(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.teal,
                    backgroundColor: Color(0xFFFFD700).withOpacity(0.1),
                    // minimumSize:
                    shadowColor: Color(0xFFFFD700),
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    maximumSize: Size(400, 200),
                    minimumSize: Size(250, 50),
                  ),
                ),
              ),
            ),
          ],
          // ProgressLine(
          //   color: info.color,
          //   percentage: info.percentage,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "${info.numOfFiles} Files",
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption!
          //           .copyWith(color: Colors.white70),
          //     ),
          //     Text(
          //       info.totalStorage!,
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption!
          //           .copyWith(color: Colors.white),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
