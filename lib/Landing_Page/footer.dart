import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterScreen extends StatefulWidget {
  FooterScreen({Key? key}) : super(key: key);

  @override
  State<FooterScreen> createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  Color firstIcon = Colors.white;
  Color secondIcon = Colors.white;
  Color thirdIcon = Colors.white;
  Color forthIcon = Colors.white;

  double firstIconSize = 25.0;
  double secondIconSize = 25.0;
  double thirdIconSize = 25.0;
  double forthIconSize = 25.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 400.0,
              decoration: BoxDecoration(
                color: Color(0xFF252525),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/sma_logo_final_new.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // SizedBox(width: 30.0),
                      // Text(
                      //   "SIGN-IN",
                      //   style: TextStyle(
                      //     fontSize: 20.0,
                      //     color: Colors.white,
                      //     // fontFamily: 'righteous',
                      //     // fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      SizedBox(width: 30.0),
                      Text(
                        "REPORT",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          // fontFamily: 'righteous',
                          // fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Text(
                        "HELP CENTER",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          // fontFamily: 'righteous',
                          // fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Text(
                        "ABOUT US",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          // fontFamily: 'righteous',
                          // fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Text(
                        "COVID-19 NEWS",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          // fontFamily: 'righteous',
                          // fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 133.0),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 477.0),
                      Text(
                        "Legal",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Text(
                        "Online Services Updated",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Text(
                        "User Agreement",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 477.0),
                      Text(
                        "Privacy & Cookie Policy (Your Privacy Rights)",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 477.0),
                      Icon(
                        Icons.copyright,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        "2022 Smart Autism Therapist.",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              color: Color(0xFF252525),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 170.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    firstIcon = Color(0xFFF85F6A);
                                    firstIconSize = 30.0;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    firstIcon = Colors.white;
                                    firstIconSize = 25.0;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    FontAwesomeIcons.linkedin,
                                    color: firstIcon,
                                    size: firstIconSize,
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    secondIcon = Color(0xFFF85F6A);
                                    secondIconSize = 30.0;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    secondIcon = Colors.white;
                                    secondIconSize = 25.0;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: secondIcon,
                                    size: secondIconSize,
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    thirdIcon = Color(0xFFF85F6A);
                                    thirdIconSize = 30.0;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    thirdIcon = Colors.white;
                                    thirdIconSize = 25.0;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    FontAwesomeIcons.instagram,
                                    color: thirdIcon,
                                    size: thirdIconSize,
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    forthIcon = Color(0xFFF85F6A);
                                    forthIconSize = 30.0;
                                  });
                                },
                                onExit: (_) { 
                                  setState(() {
                                    forthIcon = Colors.white;
                                    forthIconSize = 25.0;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    FontAwesomeIcons.facebook,
                                    color: forthIcon,
                                    size: forthIconSize,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                    SizedBox(width: 350.0),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0),
                        Container(
                          width: 188.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF252525),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              "SAT",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'abril',
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 188.0,
                          height: 85.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "OFFICIAL LICENSED PRODUCT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 50.0),
                      ],
                    ),
                    SizedBox(width: 350.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
