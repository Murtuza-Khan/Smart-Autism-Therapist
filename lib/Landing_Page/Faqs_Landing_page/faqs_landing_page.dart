import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Landing_Page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FAQLandingPage extends StatelessWidget {
  FAQLandingPage({Key? key}) : super(key: key);

  final LinearGradient _gradient = LinearGradient(
    colors: [
      const Color(0xff26E5FF),
      const Color(0xffFFDF00),
    ],
  );

  @override
  Widget build(BuildContext context) {
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
          "FAQ's",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'abril',
          ),
        ),
        centerTitle: true,
        backgroundColor: bgColor.withOpacity(0.0),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage()));
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
                  left: 300.0,
                  right: 300.0,
                  top: 30.0,
                  bottom: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.0),
                    Text(
                      "How can we help you?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'abril',
                        fontSize: 35.0,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20.0),
                        Container(
                          height: 200.0,
                          width: 350.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) { 
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "How can I start chat with my patient?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                        backgroundColor: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "Go to chat section then click the search button in the bottom right corner then type patient name correctly then click on the search button then click on the message button along side email to start chat with your patient.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          height: 200.0,
                          width: 350.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "How to start video call with patient?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "First think about channel name or id which can be anuthing you desire then send that channel id or name to your patient via chat then go to video call section and enter the same id or name then click the button below to start video call with your patient.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          height: 200.0,
                          width: 360.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "How to download files of your patient?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "Go to the file download section then you will be able to see the list of files that your patient uploaded on the cloud then click on the file to see the details where you can see the upload time and date along with other details then simply click the download button then the download will start shortly.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 60.0),
                        Container(
                          height: 200.0,
                          width: 345.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "How to delete files of your patient?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "Go to the file download section then you will be able to see the list of files that your patient uploaded then click on the file to see the details where you can see all the details of file then click the delete button then a dialog will appear then click on yes to delete the file.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 55.0),
                        Container(
                          height: 200.0,
                          width: 350.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "Is chat of doctor and patient secure?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "Yes the chat between doctor and patient is sceure as no one else can see the chat between doctor and patient to maintain the privary of the patient and doctor.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          height: 200.0,
                          width: 400.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "How to make the appointment completed?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "After completing the appointment with your patient the doctor must go to the doctors section and make the appointment completed to free the appointment slot for the next week other wise no one will be able to book the next appointment for the next week on the same time.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30.0),
                        Container(
                          height: 200.0,
                          width: 350.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "How to report user in case of abuse?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "To report a user you can simply go to the report section where you can type the description about the abuse and you have to type that user email then attach the screenshot(e.g., chat with user) for investigation and then the authorities will take action against it.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          height: 200.0,
                          width: 360.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "Is having Google account mandatory?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "Yes having Google account account is mandatory because you can only login into Smart Autism Therapist using Google account if you do not have a Google account you would not be able to login into SAT and we will use only the data that you have made available for public.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          height: 200.0,
                          width: 362.0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8.0),
                                  ShaderMask(
                                    shaderCallback: (Rect rect) {
                                      return _gradient.createShader(rect);
                                    },
                                    child: Text(
                                      "Can I use webapp to chat with patient?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.black54,
                                        fontFamily: 'abril',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  "Yes you can use the webapp to chat with the patient simply goto the chat section then click the search button in the bottom right corner then type patient name correctly then click on the search button then click on the message button along side email to start chat with your patient.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
