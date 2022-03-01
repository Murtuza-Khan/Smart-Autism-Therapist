import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/dialog_success_error.dart';
import 'package:admin/generalSuccessDialogBox.dart';
import 'package:admin/test_upload/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

final user = FirebaseAuth.instance.currentUser;
final userRef = FirebaseFirestore.instance.collection('reports');

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? _report, _email, reportError = "Enter a valid email address";
  bool _validate = false;
  bool _validate2 = false;
  final TextEditingController reportController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _currentUser = Provider.of<CurrentUser>(context);
    // final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
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
          "Report",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'abril',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashbordScreen()));
          },
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            size: 25.0,
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
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 500.0,
                  right: 500.0,
                  top: 100.0,
                  bottom: 100.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFCDCE),
                        Color(0xFFF7F0A5),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60.0, right: 60.0, top: 30.0, bottom: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Report",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'abril',
                                fontSize: 40.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Type the description to report the user and also write the\nuser email for investigation.",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Italianno',
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        _buildTextFieldReportDescription(reportController,
                            Icons.description, "Report Description"),
                        SizedBox(height: 40.0),
                        _buildTextFieldEmail(
                            emailController, Icons.email, "User Email"),
                        SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
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
                                    Color(0xFFFFCDCE),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(color: Colors.black, width: 2.0),
                              ),
                              width: 380.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size.fromHeight(60),
                                  shape: StadiumBorder(),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attach_file,
                                      color: Colors.black,
                                      size: 25.0,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      "Attach File",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(child: SizedBox(width: double.infinity)),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
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
                                    Color(0xFFFFCDCE),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(color: Colors.black, width: 2.0),
                              ),
                              // width: MediaQuery.of(context).size.width / 2.4,
                              width: 380.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size.fromHeight(60),
                                  shape: StadiumBorder(),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.report_outlined,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      "Send Report",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  // String pattern =
                                  //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  //     r"{0,253}[a-zA-Z0-9])?)*$";
                                  // RegExp regex = RegExp(pattern);
                                  // setState(() {
                                  //   reportController.text.isEmpty
                                  //       ? _validate = true
                                  //       : _validate = false;
                                  // });
                                  // setState(() {
                                  //   emailController.text.isEmpty
                                  //       ? _validate2 = true
                                  //       : _validate2 = false;
                                  // });
                                  // if (emailController.text.isNotEmpty &&
                                  //     reportController.text.isNotEmpty) {
                                  //   if (!regex.hasMatch(emailController.text)) {
                                  //     setState(() {
                                  //       reportError =
                                  //           "Enter a valid email address";
                                  //       _validate2 = true;
                                  //     });
                                  //   } else {
                                  //     final _currentUser = Provider.of<CurrentUser>(context);
                                  //     uploadToStorage(_currentUser);
                                  //     // sendReport(context);
                                  //   }
                                  // } else {
                                  //   return;
                                  // }

                                  uploadToStorage(_currentUser);
                                },
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 20.0),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(left: 110.0, right: 160.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         fileName,
                        //         style: TextStyle(
                        //           fontSize: 20.0,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       task != null
                        //           ? buildUploadStatus(task!)
                        //           : Container(
                        //               child: Center(
                        //                 child: Text(
                        //                   "0.00",
                        //                   style: TextStyle(
                        //                     fontSize: 22.0,
                        //                     fontWeight: FontWeight.w500,
                        //                     color: Colors.black,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
  //       stream: task.snapshotEvents,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final snap = snapshot.data!;
  //           final progress = snap.bytesTransferred / snap.totalBytes;
  //           final percentage = (progress * 100).toStringAsFixed(2);

  //           return Text(
  //             '$percentage %',
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //           );
  //         } else {
  //           return Container();
  //         }
  //       },
  //     );

  // Future selectFile() async {
  //   final result =
  //       // ignore: invalid_use_of_visible_for_testing_member
  //       await ImagePicker.platform.pickImage(source: ImageSource.gallery);

  //   if (result == null) return;
  //   final path = result.path;
  //   print(path);
  //   // final path = result.files.single.path!;

  //   setState(() => file = File(path));
  // }

  // Future uploadFile() async {
  //   if (file == null) return;

  //   final fileName = basename(file!.path);
  //   final destination = 'report/$fileName';
  //   task = FirebaseApi.uploadFile(destination, file!);
  //   setState(() {});

  //   if (task == null) return;

  //   final snapshot = await task!.whenComplete(() {});
  //   final urlDownload = await snapshot.ref.getDownloadURL();

  //   print('Download-Link: $urlDownload');
  // }

  void sendReport(BuildContext context) {
    var currentDateTime = DateTime.now();
    String reportTime =
        DateFormat.jm().format(DateTime.parse(currentDateTime.toString()));
    String reportDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(currentDateTime.toString()));
    Map<String, dynamic> data = {
      "doctor_email": user!.email,
      "doctor_name": user!.displayName,
      "report_description": _report,
      "report_date": reportDate,
      "report_time": reportTime,
      "day": "Tuesday",
      "user_email": _email,
    };
    FirebaseFirestore.instance
        .collection("reports")
        .doc(_email)
        .set(data)
        .then(
          (value) => {
            reportController.text = "",
            emailController.text = "",
            showDialog(
              context: context,
              builder: (context) => GeneralInfoDialogBox(
                title: "Information",
                description: "Report sent",
                onClicked: () {
                  Navigator.pop(context);
                },
              ),
            ),
          },
        )
        .catchError(
      (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialogBoxSigninError(
            title: "Error",
            description: "$e",
          ),
        );
      },
    );
  }

  _buildTextFieldReportDescription(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          minLines: 2,
          maxLines: 6,
          keyboardType: TextInputType.multiline,
          controller: controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none,
            errorText: _validate ? 'Description Can\'t Be Empty' : null,
          ),
          onChanged: (value) {
            setState(() {
              _report = value.trim();
              print(_report);
            });
          },
        ),
      ),
    );
  }

  _buildTextFieldEmail(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          // minLines: 2,
          // maxLines: 6,
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none,
            errorText: _validate2 ? reportError : null,
          ),
          onChanged: (value) {
            setState(() {
              _email = value.trim();
              print(_email);
            });
          },
        ),
      ),
    );
  }
}

Future<void> uploadImage({required Function(File file) onSelected}) async {
    InputElement uploadInput = FileUploadInputElement() as InputElement
      ..accept = 'image/*';
    uploadInput.click();
    // final snapshot = await task!.whenComplete(() {});
    // final urlDownload = await snapshot.ref.getDownloadURL();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files?.first;
      final reader = FileReader();
      reader.readAsDataUrl(file!);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  Future uploadToStorage(CurrentUser user) async {
    final dateTime = DateTime.now();
    final userId = user.id;
    final path = '$userId/$dateTime';
    uploadImage(
      onSelected: (file) {
        fb
            .storage()
            .refFromURL("gs://smart-autism-therapist-54615.appspot.com/")
            .child(path)
            .put(file)
            .future
            .then((_) {
          FirebaseFirestore.instance
              .collection('usersReport')
              .doc(user.id)
              .update({'photo_url': path}).catchError((e) {
            FirebaseFirestore.instance
                .collection('usersReport')
                .doc(user.id)
                .set({'photo_url': path});
          });
        });
      },
    );
  }
