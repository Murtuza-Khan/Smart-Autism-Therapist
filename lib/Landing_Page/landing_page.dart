import 'dart:async';
import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Home_page.dart';
import 'package:admin/Landing_Page/Community/Community.dart';
import 'package:admin/Landing_Page/Report_Landing_page/report_landing_page.dart';
import 'package:admin/Landing_Page/bottom_design.dart';
import 'package:admin/Landing_Page/Faqs_Landing_page/faqs_landing_page.dart';
import 'package:admin/Landing_Page/fifth_animation.dart';
import 'package:admin/Landing_Page/final_animation.dart';
import 'package:admin/Landing_Page/footer.dart';
import 'package:admin/Landing_Page/forth_animation.dart';
import 'package:admin/Landing_Page/seventh_animation.dart';
import 'package:admin/Landing_Page/sixth_animation.dart';
import 'package:admin/Landing_Page/third_animation_container.dart';
import 'package:admin/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  double imageWidth = 20.0;
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  AnimationController? _controller;
  AnimationController? _controller2;
  AnimationController? _controller3;
  bool onHover = false;
  double asf = 0.1;

  changeAlignment() {
    setState(() {
      selected = !selected;
    });
  }

  selectAlignment() => selected ? Alignment.bottomLeft : Alignment.bottomRight;

  selectAlignment2() =>
      selected2 ? Alignment.centerLeft : Alignment.centerRight;

  selectAlignment3() =>
      selected3 ? Alignment.centerRight : Alignment.centerLeft;

  selectAlignment4() =>
      selected4 ? Alignment.centerLeft : Alignment.centerRight;

  animationChange() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        selected = true;
      });
    });
  }

  animationChange2() {
    setState(() {
      selected2 = true;
    });
    // Future.delayed(Duration(seconds: 3), () {});
  }

  animationChange3() {
    setState(() {
      selected3 = true;
    });
  }

  animationChange4() {
    setState(() {
      selected4 = true;
    });
  }

  bool get isForwardAnimation =>
      _controller2!.status == AnimationStatus.forward ||
      _controller2!.status == AnimationStatus.completed;

  bool get isForwardAnimation2 =>
      _controller3!.status == AnimationStatus.forward ||
      _controller3!.status == AnimationStatus.completed;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    Timer(Duration(milliseconds: 2000), () => _controller!.forward());

    // _controller2 = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 6000),
    // );
    // Timer(Duration(milliseconds: 6000), () => _controller2!.forward());

    _controller2 = AnimationController(
      value: 0,
      duration: Duration(milliseconds: 2000),
      vsync: this,
    )..addStatusListener((status) => setState(() {}));

    _controller3 = AnimationController(
      value: 0,
      duration: Duration(milliseconds: 2000),
      vsync: this,
    )..addStatusListener((status) => setState(() {}));

    animationChange();
    // animationChange2();
    // animationChange3();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller2!.dispose();
    _controller3!.dispose();
    super.dispose();
  }

  Color topUserColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            expandedHeight: 50.0,
            flexibleSpace: Container(
              color: bgColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            topUserColor = Color(0xFFF85F6A);
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            topUserColor = Colors.white;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: topUserColor,
                            size: 20.0,
                          ),
                        ),
                      ),
                      // SizedBox(width: 25.0),
                      // Icon(
                      //   Icons.help_outline_sharp,
                      //   color: Colors.white,
                      //   size: 25.0,
                      // ),
                      SizedBox(width: 25.0),
                      Text(
                        "SAT",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'abril',
                          fontStyle: FontStyle.italic,
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(width: 25.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 75.0,
            flexibleSpace: Container(
              // height: 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 50.0),
                      Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/sma_logo_final_new.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        "SAT",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'abril',
                          fontSize: 35.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            width: 30.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SAT",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'abril',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 1.0,
                                        width: 28,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "OFFICIAL LICENSED PRODUCT",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 4.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 100.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FAQLandingPage()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "FAQ's",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 20.0),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         "Modes",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //       Icon(
                      //         Icons.keyboard_arrow_down,
                      //         color: Colors.black,
                      //         size: 30.0,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(width: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunityScreen()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Community",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Covid News",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportLandingPage()));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Report",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        "Total privacy and full control",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ccc.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: 500.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: Stack(
                    children: [
                      FadeTransition(
                        opacity: _controller!,
                        child: Container(
                          width: 2000.0,
                          height: 500.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 300.0),
                                  Container(
                                    height: 120.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/sma_logo_final_new.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.0),
                                  Column(
                                    children: [
                                      Text(
                                        "Smart",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'abril',
                                          fontSize: 60.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      // SizedBox(height: 5.0),
                                      Text(
                                        "Autism Therapist",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'abril',
                                          fontSize: 22.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 15.0),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Container(
                                        width: 80.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.white),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "SAT",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'abril',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.white),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            "OFFICIAL LICENSED PRODUCT",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 300.0),
                                      Text(
                                        "SAT WEB APP",
                                        style: TextStyle(
                                          fontFamily: 'russo',
                                          color: Colors.white,
                                          fontSize: 50.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 300.0),
                                      Text(
                                        "Get total control of the data that the patient has uploaded for\nyou on the cloud.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 300.0),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.transparent,
                                          side: BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Text(
                                                  'Launch Web App',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                                SizedBox(width: 5.0),
                                                Icon(
                                                  FontAwesomeIcons.arrowRight,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                          ],
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 900.0,
                            height: 500.0,
                            child: AnimatedAlign(
                              alignment: selectAlignment(),
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
                              child: FadeTransition(
                                opacity: _controller!,
                                child: Container(
                                  height: 500.0,
                                  width: 760.0,
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/landing_page/first_pic.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: imageWidth),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 600.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/landing_page/yellow_background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.googlePlay,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "To download mobile App of Smart Autism Therapist ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 10.0),
                            GestureDetector(
                              onTap: () {
                                //asjdhakjlhdasldh
                                //asjdhakjlhdasldh
                                //asjdhakjlhdasldh
                                //asjdhakjlhdasldh
                                //asjdhakjlhdasldh
                                //asjdhakjlhdasldh
                                //asjdhakjlhdasldh
                              },
                              child: Text(
                                "Click Here",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.pink,
                                      offset: Offset(0, -5),
                                    ),
                                  ],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.61,
                          height: 500.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/landing_page/firstBackground.png"),
                                fit: BoxFit.fill),
                            color: Color(0xFF121824),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: 150.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 150.0),
                                  Container(
                                    height: 370.0,
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/web1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(10.0, 15.0),
                                          blurRadius: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 60.0),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 70.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // Container(
                                          //   height: 100.0,
                                          //   width: 100.0,
                                          //   decoration: BoxDecoration(
                                          //     color: Colors.transparent,
                                          //     borderRadius: BorderRadius.all(
                                          //         Radius.circular(90.0)),
                                          //     border: Border.all(
                                          //         color: Colors.white,
                                          //         width: 2.0),
                                          //   ),
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.all(12.0),
                                          //     child: Image(
                                          //       image: AssetImage(
                                          //           "assets/images/sma_logo_final_new.png"),
                                          //       fit: BoxFit.contain,
                                          //     ),
                                          //   ),
                                          // ),
                                          SizedBox(width: 60.0),
                                          Text(
                                            "Smart",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'abril',
                                              fontSize: 45.0,
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            "Autism Therapist",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'abril',
                                              fontSize: 45.0,
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          SizedBox(width: 60.0),
                                          Container(
                                            width: 500.0,
                                            height: 200.0,
                                            child: Text(
                                              "Smart Autism Therapist is a new way to connect doctor and patient from home where you will have complete control on the data that your patient have uploaded on the cloud and no one else will be able to see that data, data of both doctor and patient will be private including files, chat, appointment details etc.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'roboto',
                                                fontSize: 20.0,
                                                // fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 700.0,
                          height: 500.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/b2.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MouseRegion(
                onEnter: (_) {
                  animationChange2();
                  animationChange3();
                  toggleFAB();
                },
                child: Container(
                  height: 500.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/landing_page/thirdcc.png"),
                        fit: BoxFit.cover),
                  ),
                  child: FadeTransition(
                    opacity: _controller2!,
                    child: Container(
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // SizedBox(width: 200.0),
                                  Container(
                                    width: 900.0,
                                    // height: 500.0,
                                    child: AnimatedAlign(
                                      alignment: selectAlignment3(),
                                      duration: const Duration(seconds: 3),
                                      curve: Curves.fastOutSlowIn,
                                      child: Text(
                                        "USE WEB APP TO COMMUNICATE\nFROM HOME",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'cat',
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  // SizedBox(width: 200.0),
                                  Container(
                                    width: 735.0,
                                    child: AnimatedAlign(
                                      alignment: selectAlignment3(),
                                      duration: const Duration(seconds: 3),
                                      curve: Curves.fastOutSlowIn,
                                      child: Container(
                                        width: 450.0,
                                        child: Text(
                                          "You can use Smart Autism Therapist web app to communicate with your client form home and you can also use Smart Autism Therapist mobile app to stay connected with your client from home or anywhere ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'roboto',
                                            fontSize: 20.0,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 800.0,
                                height: 500.0,
                                child: AnimatedAlign(
                                  alignment: selectAlignment2(),
                                  duration: const Duration(seconds: 3),
                                  curve: Curves.fastOutSlowIn,
                                  child: Container(
                                    height: 600.0,
                                    width: 500.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/laptop.png"),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 200.0,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ThirdAnimationContainer(),
              ForthAnimationContainer(),
              FinalAnimationContainer(),
              FifthAnimationContainer(),
              SixthAnimationContainer(),
              SeventhAnimationContainer(),
              BottomDesign(),
              FooterScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Future toggleFAB() =>
      isForwardAnimation ? _controller2!.forward() : _controller2!.forward();

  Future toggleFAB2() =>
      isForwardAnimation2 ? _controller3!.forward() : _controller3!.forward();
}
