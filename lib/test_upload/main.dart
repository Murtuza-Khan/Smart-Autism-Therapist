import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/dialog_success_error.dart';
import 'package:admin/generalSuccessDialogBox.dart';
import 'package:admin/test_upload/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:intl/intl.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

final userCurrent = FirebaseAuth.instance.currentUser;
final userRef = FirebaseFirestore.instance.collection('reports');
String? _report, _email, reportError = "Enter a valid email address";

bool _validate = false;

bool _validate2 = false;

File? file2;

File? file3;

bool _isSelected = false;

Future<Uri>? downloadLink;

var currentDateTime = DateTime.now();
String reportTime =
    DateFormat.jm().format(DateTime.parse(currentDateTime.toString()));
String reportDate =
    DateFormat('yyyy-MM-dd').format(DateTime.parse(currentDateTime.toString()));

final TextEditingController reportController = TextEditingController();

final TextEditingController emailController = TextEditingController();

class MainReportScreen extends StatefulWidget {
  @override
  State<MainReportScreen> createState() => _MainReportScreenState();
}

class _MainReportScreenState extends State<MainReportScreen> {
  @override
  void initState() {
    setState(() {
      reportController.text = "";
      emailController.text = "";
      file3 = null;
      _isSelected = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>(
      initialData: CurrentUser(id: "Reports", name: "", photoUrl: ""),
      create: (context) => userStream(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Autism Therapist',
        theme: ThemeData(
          scaffoldBackgroundColor: secondaryColor,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = Provider.of<CurrentUser>(context);
    Center(child: CircularProgressIndicator());
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
                              "Type the description to report the user and write the user email\n and also attach screenshot for investigation.",
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
                                onPressed: () {
                                  uploadImage(onSelected: (file2) {
                                    print("selected");
                                    setState(() {
                                      file3 = file2;
                                      print("File : " + file3!.type);
                                      _isSelected = true;
                                    });
                                  });
                                },
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
                                  String pattern =
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                      r"{0,253}[a-zA-Z0-9])?)*$";
                                  RegExp regex = RegExp(pattern);
                                  setState(() {
                                    reportController.text.isEmpty
                                        ? _validate = true
                                        : _validate = false;
                                  });
                                  setState(() {
                                    emailController.text.isEmpty
                                        ? _validate2 = true
                                        : _validate2 = false;
                                  });
                                  if (emailController.text.isNotEmpty &&
                                      reportController.text.isNotEmpty) {
                                    if (!regex.hasMatch(emailController.text)) {
                                      setState(() {
                                        reportError =
                                            "Enter a valid email address";
                                        _validate2 = true;
                                      });
                                    } else {
                                      if (_isSelected == true) {
                                        uploadToStorage(context, _currentUser);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Row(
                                              children: [
                                                Text(
                                                  "First select a file",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 5.0),
                                                Icon(
                                                  Icons.error_outline_rounded,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                )
                                              ],
                                            ),
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  } else {
                                    return;
                                  }
                                },
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
          ),
        ],
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
}

class ProfilePicture extends StatefulWidget {
  ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = Provider.of<CurrentUser>(context);
    Center(child: CircularProgressIndicator());

    return StreamBuilder<Uri>(
      stream: downloadUrl(_currentUser.photoUrl!).asStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          child: Text(_currentUser.photoUrl!.toString()),
        );
      },
    );
  }
}

Future<Uri> downloadUrl(String photoUrl) {
  return downloadLink = fb
      .storage()
      .refFromURL("gs://smart-autism-therapist-54615.appspot.com/")
      .child(photoUrl)
      .getDownloadURL();
}

Stream<CurrentUser> userStream() {
  return FirebaseFirestore.instance
      .collection('usersReport')
      .doc('Reports')
      .snapshots()
      .map((doc) => CurrentUser.fromDoc(doc));
}

Future<void> uploadImage({required Function(File file) onSelected}) async {
  InputElement uploadInput = FileUploadInputElement() as InputElement
    ..accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files?.first;
    final reader = FileReader();
    reader.readAsDataUrl(file!);
    reader.onLoadEnd.listen((event) {
      onSelected(file);
    });
  });
}

Future uploadToStorage(BuildContext context, CurrentUser user) async {
  // final dateTime = DateTime.now();
  final String fileType = file3!.type;
  final userId = user.id;
  int? idxForday = fileType.indexOf("/");
  List? partsForday = [
    fileType.substring(0, idxForday),
    fileType.substring(idxForday + 1).trim(),
  ];
  String sf = "." + partsForday[1];
  final path = '$userId/$reportTime$sf';
  // final path = '$userId/$dateTime';

  // UploadTask? task;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Text(
          "Uploading ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        SizedBox(width: 5.0),
        CircularProgressIndicator(
          color: Colors.black,
        ),
      ],
    ),
    duration: Duration(seconds: 3.5.toInt()),
    backgroundColor: Colors.cyanAccent.shade400,
  ));
  return fb
      .storage()
      .refFromURL("gs://smart-autism-therapist-54615.appspot.com/")
      .child(path)
      .put(file3!)
      .future
      .whenComplete(
    () async {
      final ref = await storage()
          .refFromURL("gs://smart-autism-therapist-54615.appspot.com/")
          .child(path)
          .getDownloadURL();
      print("This is photo Url : " + ref.toString());

      String? url = ref.toString();

      FirebaseFirestore.instance
          .collection('usersReport')
          .add({
            'photo_url': url,
            "doctor_email": userCurrent!.email,
            "doctor_name": userCurrent!.displayName,
            "report_description": _report,
            "report_date": reportDate,
            "report_time": reportTime,
            "day": "Tuesday",
            "user_email": _email,
          })
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
    },
  );
}

Future reportFileDelete(String photoUrl) async {
  return await fb
      .storage()
      .refFromURL("gs://smart-autism-therapist-54615.appspot.com/")
      .child(photoUrl)
      .delete()
      .then((value) {
    print("File Deleted");
  });
}
