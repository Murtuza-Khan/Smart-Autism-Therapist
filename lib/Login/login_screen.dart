import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/Landing_Page/landing_page.dart';
import 'package:admin/Login/providers/app.dart';
import 'package:admin/Login/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = CarouselController();

  int activeIndex = 0;

  final List<String> sliderImages = [
    'assets/images/P1.png',
    'assets/images/P2.png',
    'assets/images/P3.png',
  ];

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   stops: [0.0, 1.0],
          //   colors: [
          //     bgColor,
          //     bgColor,
          //   ],
          // ),
          ),
      child: Scaffold(
        body: Row(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: bgColor,
                            child: CarouselSlider(
                              carouselController: controller,
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: MediaQuery.of(context).size.height,
                                autoPlay: true,
                                pageSnapping: false,
                                autoPlayInterval: Duration(seconds: 2),
                                enlargeCenterPage: false,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                onPageChanged: (index, reason) =>
                                    setState(() => activeIndex = index),
                              ),
                              items: sliderImages
                                  .map(
                                    (item) => Card(
                                      margin: EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 0.0,
                                      ),
                                      elevation: 12.0,
                                      // shadowColor: Color(0xFFFFD700),
                                      // shape: RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(30.0),
                                      // ),
                                      child: ClipRRect(
                                        // borderRadius: BorderRadius.all(
                                        //   Radius.circular(30.0),
                                        // ),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                              item,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(height: 50),
                                                        // Text(
                                                        //   "COVID-19",
                                                        //   style: TextStyle(
                                                        //     fontFamily: 'righteous',
                                                        //     fontSize: 35.0,
                                                        //     fontWeight:
                                                        //         FontWeight.bold,
                                                        //     backgroundColor:
                                                        //         Colors.black54,
                                                        //     color: Colors.white,
                                                        //   ),
                                                        //   textAlign: TextAlign.center,
                                                        // ),
                                                        SizedBox(height: 10),
                                                        // Container(
                                                        //   width: (MediaQuery.of(context).size.width / 4),
                                                        //   child: Text(
                                                        //     '${titles[activeIndex]}',
                                                        //     style: TextStyle(
                                                        //       fontFamily: 'righteous',
                                                        //       fontSize: 16.0,
                                                        //       backgroundColor:
                                                        //           Colors.black54,
                                                        //       color: Colors.white,
                                                        //     ),
                                                        //     textAlign: TextAlign.center,
                                                        //     // maxLines: 4,
                                                        //     // overflow: TextOverflow.ellipsis,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 800.0),
                                                buildIndicator(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                            },
                            icon: Icon(
                              FontAwesomeIcons.arrowLeft,
                              size: 25.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                // color: bgColor,
                image: DecorationImage(
                    image: AssetImage("assets/b3AC.png"), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 200.0, right: 150.0, top: 100.0, bottom: 70.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(-10.0, 6.0),
                            blurRadius: 10.0,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage("assets/b3.webp"),
                            fit: BoxFit.cover),
                        // gradient: LinearGradient(
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        //   stops: [0.0, 1.0],
                        //   colors: [
                        //     Color(0xFFFFCDCE),
                        //     Color(0xFFF7F0A5),
                        //   ],
                        // ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100.0),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 19,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 140.0,
                                    height: 140.0,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/sma_logo_final_new.png"),
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Smart Autism Therapist",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontFamily: 'abril'),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Sign in to continue",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontFamily: 'Italianno'),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 20.0),
                                  Container(
                                    height: 50.0,
                                    width:
                                        (MediaQuery.of(context).size.width) / 5,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white54,
                                            offset: Offset(0, 0),
                                            blurRadius: 10.0)
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.0, 1.0],
                                        colors: [
                                          Color(0xFFFFCDCE),
                                          Color(0xFFF7F0A5),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        minimumSize: Size.fromHeight(50),
                                      ),
                                      child: buildContent(),
                                      onPressed: () async {
                                        appProvider.changeLoading();
                                        Map result = await authProvider
                                            .signInWithGoogle();
                                        bool success = result['success'];
                                        String message = result['message'];
                                        print(message);

                                        if (!success) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(message)));
                                          appProvider.changeLoading();
                                        } else {
                                          appProvider.changeLoading();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DashbordScreen()));
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 100.0),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.googlePlay,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        "To download mobile version",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          print("KHOTI");
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Click Here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliderImages.length,
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(activeDotColor: Colors.white),
      );
  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(FontAwesomeIcons.google, size: 28, color: Colors.black),
        SizedBox(width: 16),
        Text(
          "Sign In",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ],
    );
  }
}
