import 'dart:ui';
import 'package:admin/Chat_App/helper/helperfunctions.dart';
import 'package:admin/Chat_App/services/auth.dart';
import 'package:admin/Chat_App/services/database.dart';
import 'package:admin/Chat_App/views/chatrooms.dart';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  GoogleSignInAccount? _userer;

  GoogleSignInAccount get userer => _userer!;

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      User? userr = auth.currentUser;
      // await authService
      //     .signUpWithEmailAndPassword(userr.email, 'smartautismtherapist12345')
      //     .then((result) async {});

      try {
        if (userr!.displayName != null) {
          Map<String, String> userDataMap = {
            "userName": userr.displayName!.trim(),
            "userEmail": userr.email!,
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userr.displayName!.trim());
          HelperFunctions.saveUserEmailSharedPreference(userr.email!);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        } else {
          Map<String, String> userDataMap = {
            "userName": userr.email!.substring(0, userr.email!.indexOf('@')),
            "userEmail": userr.email!,
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userr.email!.substring(0, userr.email!.indexOf('@')));
          HelperFunctions.saveUserEmailSharedPreference(userr.email!);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        }
      } catch (e) {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialogBoxSigninError(
        //     title: "Failed",
        //     description: "The email already exist",
        //   ),
        // );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF212332),
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
          "Chat",
          style: TextStyle(
            fontFamily: 'abril',
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashbordScreen()));
          },
          child: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFCDCE),
                Color(0xFFF7F0A5),
              ],
            ),
          ),
          child: isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/dvp.png"),
                            fit: BoxFit.fill),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 600.0,
                              right: 600.0,
                              top: 130.0,
                              bottom: 130.0),
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
                                  left: 100.0, right: 100.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Welcome,",
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Container(
                                        width: 300.0,
                                        child: Text(
                                          "Click the button below to start chat with your docotor",
                                          style: TextStyle(
                                            fontFamily: 'Italianno',
                                            fontSize: 30,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.0),
                                  Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        // TextFormField(
                                        //   style: simpleTextStyle(),
                                        //   controller: usernameEditingController,
                                        //   validator: (val) {
                                        //     return val.isEmpty || val.length < 3
                                        //         ? "Enter Username 3+ characters"
                                        //         : null;
                                        //   },
                                        //   decoration: textFieldInputDecoration("username"),
                                        // ),
                                        // SizedBox(height: 30.0),
                                        // TextFormField(
                                        //   controller: emailEditingController,
                                        //   style: simpleTextStyle(),
                                        //   validator: (val) {
                                        //     return RegExp(
                                        //                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        //             .hasMatch(val)
                                        //         ? null
                                        //         : "Enter correct email";
                                        //   },
                                        //   decoration: textFieldInputDecoration("email"),
                                        // ),
                                        // TextFormField(
                                        //   obscureText: true,
                                        //   style: simpleTextStyle(),
                                        //   decoration: textFieldInputDecoration("password"),
                                        //   controller: passwordEditingController,
                                        //   validator: (val) {
                                        //     return val.length < 6
                                        //         ? "Enter Password 6+ characters"
                                        //         : null;
                                        //   },
                                        // ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 16,
                                  // ),
                                  Center(
                                    child: Container(
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
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          minimumSize: Size.fromHeight(50),
                                          shape: StadiumBorder(),
                                        ),
                                        child: Text(
                                          "Start Chatting",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () async {
                                          singUp();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
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
    );
  }
}
