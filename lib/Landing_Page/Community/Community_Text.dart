import 'package:flutter/material.dart';

class CommunityTextScreen extends StatelessWidget {
  CommunityTextScreen({Key? key}) : super(key: key);

  final LinearGradient _gradient = LinearGradient(
    colors: [
      const Color(0xff26E5FF),
      const Color(0xffFFDF00)
      // const Color(0xff090706),
      // const Color(0xffE61326),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/main_background.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return _gradient.createShader(rect);
                        },
                        child: Text(
                          "Our Commitment to Positive Future",
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(7.0, 7.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(7.0, 7.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(100, 0, 0, 255),
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 90.0,
                            fontFamily: "righteous",
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        "At Smart Autism Therapist, we believe that through treatment patient symptoms of Autism can be minimize, resulting in bright and positive future.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontFamily: "righteous",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 90.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return _gradient.createShader(rect);
                        },
                        child: Text(
                          "Positive Play Charter",
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(7.0, 7.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(7.0, 7.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(100, 0, 0, 255),
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 55.0,
                            fontFamily: "righteous",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        "Like with most communities, we have positive play guidelines to help make sure our games and services are an enjoyable experience for all players. Whether you are new to gaming or have been an active player for years, we need your help to make this a community we all want to be part of.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontFamily: "righteous",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 90.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return _gradient.createShader(rect);
                        },
                        child: Text(
                          "Reporting Issues",
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(7.0, 7.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(7.0, 7.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(100, 0, 0, 255),
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 55.0,
                            fontFamily: "righteous",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        "When you sign up for your EA Account, you agree to play nice. We ask players to keep the game fun by using good judgement and sharing cool stuff that is appropriate for everyone. If you see disruptive behavior or content, let us know by reporting it to EA Help.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontFamily: "righteous",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}