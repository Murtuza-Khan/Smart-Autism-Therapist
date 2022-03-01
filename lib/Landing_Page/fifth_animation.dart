import 'package:flutter/material.dart';

class FifthAnimationContainer extends StatefulWidget {
  // final bool aniGo;
  // FifthAnimationContainer({required this.aniGo});

  @override
  State<FifthAnimationContainer> createState() =>
      _FifthAnimationContainerState();
}

class _FifthAnimationContainerState extends State<FifthAnimationContainer>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;

  selectAlignment() => selected ? Alignment.bottomCenter : Alignment.topCenter;

  selectAlignment2() =>
      selected2 ? Alignment.topCenter : Alignment.bottomCenter;

  selectAlignment3() =>
      selected3 ? Alignment.bottomLeft : Alignment.bottomRight;

  selectAlignment4() =>
      selected4 ? Alignment.bottomRight : Alignment.bottomLeft;

  animationChange() {
    setState(() {
      selected = true;
    });
  }

  animationChange2() {
    setState(() {
      selected2 = true;
    });
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
      _controller!.status == AnimationStatus.forward ||
      _controller!.status == AnimationStatus.completed;

  @override
  void initState() {
    _controller = AnimationController(
      value: 0,
      duration: Duration(milliseconds: 2000),
      vsync: this,
    )..addStatusListener((status) => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        animationChange();
        animationChange2();
        animationChange3();
        animationChange4();
        toggleFAB();
      },
      child: Container(
        height: 700.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/landing_page/yellow_background_fliped.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 85.0, top: 30.0, bottom: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1C1F26).withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 12.0, top: 12.0, bottom: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1C1F26).withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 12.0, top: 12.0, bottom: 12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage("assets/landing_page/thirdcc.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: FadeTransition(
                      opacity: _controller!,
                      child: Container(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(height: 150.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 250.0,
                                      width: 850.0,
                                      child: AnimatedAlign(
                                        alignment: selectAlignment(),
                                        duration: const Duration(seconds: 3),
                                        curve: Curves.fastOutSlowIn,
                                        child: Text(
                                          "FULL CONTROL ON BOTH\nMOBILE APP AND WEB APP",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'cat',
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          // textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 370.0),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 515.0),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          // color: Colors.black,
                                          width: 420.0,
                                          height: 250.0,
                                          child: AnimatedAlign(
                                            alignment: selectAlignment2(),
                                            duration:
                                                const Duration(seconds: 3),
                                            curve: Curves.fastOutSlowIn,
                                            child: Container(
                                              width: 500.0,
                                              child: Text(
                                                "In Smart Autism Therapist you can control your clients data from both mobile app as well as web app data which include client appointmnet details, client files that he or she will upload on cloud and you will also be able to view feedback on mobile as well as web app.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'roboto',
                                                  fontSize: 20.0,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 385.0),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 190.0),
                                    Container(
                                      width: 900,
                                      height: 350.0,
                                      child: AnimatedAlign(
                                        alignment: selectAlignment3(),
                                        duration: const Duration(seconds: 3),
                                        curve: Curves.fastOutSlowIn,
                                        child: Container(
                                          height: 700.0,
                                          child: Image(
                                            image:
                                                AssetImage("assets/laptop.png"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 450,
                                      height: 500.0,
                                      child: AnimatedAlign(
                                        alignment: selectAlignment4(),
                                        duration: const Duration(seconds: 3),
                                        curve: Curves.fastOutSlowIn,
                                        child: Container(
                                          height: 700.0,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/landing_page/single_mobile.png"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 220.0,
                                    ),
                                  ],
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
            ),
          ),
        ),
      ),
    );
  }

  Future toggleFAB() =>
      isForwardAnimation ? _controller!.forward() : _controller!.forward();
}
