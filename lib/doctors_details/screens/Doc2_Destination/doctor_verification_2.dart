import 'package:admin/Dashbord/constants.dart';
import 'package:admin/doctors_details/screens/Doc2_Destination/updating_appointment2.dart';
import 'package:flutter/material.dart';

class DoctorVerification2 extends StatefulWidget {
  // const DoctorVerification({ Key? key }) : super(key: key);

  @override
  State<DoctorVerification2> createState() => _DoctorVerification2State();
}

class _DoctorVerification2State extends State<DoctorVerification2> {
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
        title: Text("Verification"),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
        resizeToAvoidBottomInset: false,
        body: Container(
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
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                _buildTextFieldEmail(emailController, Icons.email, "Email"),
                SizedBox(height: 20),
                _buildTextFieldPassword(passwordController, Icons.lock,
                    passwordViewIcon, "Password"),
                SizedBox(height: 20),
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
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      if (_email == "zain123@gmail.com" &&
                          _password == "abc123456") {
                            setState(() {
                              _email = "";
                              _password = "";
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            children: [
                              Text(
                                "Please wait",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              CircularProgressIndicator(color: Colors.black,),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.cyanAccent.shade400,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Welcome Zain",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.cyanAccent.shade400,
                        ));
                        new Future.delayed(const Duration(seconds: 2), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdatingAppointment2()));
                        });
                        // showDialog(
                        //     context: context,
                        //     builder: (context) => AlertDialogBoxSigninSuccess(
                        //           title: "Success",
                        //           description: "Welcome Murtuza",
                        //         ));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            children: [
                              Text(
                                "Please wait",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              CircularProgressIndicator(color: Colors.black,),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.cyanAccent.shade400,
                        ));

                        new Future.delayed(const Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Wrong email or password",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.cyanAccent.shade400,
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
