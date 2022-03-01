import 'dart:ui';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/doctors_details/screens/Doc1_Destination/updating_appointment.dart';
import 'package:admin/doctors_details/screens/Doc2_Destination/updating_appointment2.dart';
import 'package:admin/doctors_details/screens/Doc3_Destination/updating_appointment3.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultDoctorVerificationScreen extends StatefulWidget {
  // const DoctorVerification({ Key? key }) : super(key: key);

  @override
  State<DefaultDoctorVerificationScreen> createState() =>
      _DefaultDoctorVerificationScreenState();
}

class _DefaultDoctorVerificationScreenState
    extends State<DefaultDoctorVerificationScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? _email, _password;

  bool isHidden = true;

  IconData passwordViewIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            "Verification",
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
                  MaterialPageRoute(builder: (context) => DashbordScreen()));
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
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
                        left: 600.0, right: 600.0, top: 130.0, bottom: 130.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
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
                        padding:
                            const EdgeInsets.only(left: 150.0, right: 150.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Verification,",
                                  style: TextStyle(
                                      fontFamily: 'abril',
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Please enter your email and password to\nverify your account",
                                  style: TextStyle(
                                      fontFamily: 'Italianno',
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            _buildTextFieldEmail(
                                emailController, Icons.email, "Email"),
                            SizedBox(height: 25),
                            _buildTextFieldPassword(passwordController,
                                Icons.lock, passwordViewIcon, "Password"),
                            SizedBox(height: 25),
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
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size.fromHeight(50),
                                  shape: StadiumBorder(),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                                onPressed: () {
                                  if (_email == "khanmurtuza690@gmail.com" &&
                                      _password == "abc123456") {
                                    setState(() {
                                      _email = "";
                                      _password = "";
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        children: [
                                          Text(
                                            "Please wait",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Welcome Murtuza",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));
                                    new Future.delayed(
                                        const Duration(seconds: 2), () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdatingAppointment()));
                                    });
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) => AlertDialogBoxSigninSuccess(
                                    //           title: "Success",
                                    //           description: "Welcome Murtuza",
                                    //         ));
                                  } else if (_email == "zain123@gmail.com" &&
                                      _password == "abc123456") {
                                    setState(() {
                                      _email = "";
                                      _password = "";
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        children: [
                                          Text(
                                            "Please wait",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Welcome Zain",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));
                                    new Future.delayed(
                                        const Duration(seconds: 2), () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdatingAppointment2()));
                                    });
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) => AlertDialogBoxSigninSuccess(
                                    //           title: "Success",
                                    //           description: "Welcome Murtuza",
                                    //         ));
                                  } else if (_email == "sohaib123@gmail.com" &&
                                      _password == "abc123456") {
                                    setState(() {
                                      _email = "";
                                      _password = "";
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        children: [
                                          Text(
                                            "Please wait",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Welcome Sohaib",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));
                                    new Future.delayed(
                                        const Duration(seconds: 2), () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdatingAppointment3()));
                                    });
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) => AlertDialogBoxSigninSuccess(
                                    //           title: "Success",
                                    //           description: "Welcome Murtuza",
                                    //         ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        children: [
                                          Text(
                                            "Please wait",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          Colors.cyanAccent.shade400,
                                    ));

                                    new Future.delayed(
                                        const Duration(seconds: 2), () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Wrong email or password",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        duration: Duration(seconds: 3),
                                        backgroundColor:
                                            Colors.cyanAccent.shade400,
                                      ));
                                    });
                                  }
                                },
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
          ],
        ),
      ),
    );
  }

  _buildTextFieldEmail(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent, border: Border.all(color: Colors.black)),
      child: Material(
        color: Colors.transparent,
        child: TextField(
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
              border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              _email = value.trim();
            });
          },
        ),
      ),
    );
  }

  _buildTextFieldPassword(TextEditingController controller, IconData icon,
      passwordViewIcon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent, border: Border.all(color: Colors.black)),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          obscureText: isHidden,
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
              suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(passwordViewIcon, color: Colors.black)),
              // prefix: Icon(icon),
              border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              _password = value.trim();
            });
          },
        ),
      ),
    );
  }

  void _togglePasswordView() {
    if (passwordViewIcon == Icons.visibility) {
      passwordViewIcon = Icons.visibility_off;
    } else {
      passwordViewIcon = Icons.visibility;
    }
    setState(() {
      isHidden = !isHidden;
    });
  }
}
