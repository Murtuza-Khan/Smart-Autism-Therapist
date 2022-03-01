import 'package:flutter/material.dart';

class FinalAnimationContainer extends StatefulWidget {
  // final bool aniGo;
  // FinalAnimationContainer({required this.aniGo});

  @override
  State<FinalAnimationContainer> createState() =>
      _FinalAnimationContainerState();
}

class _FinalAnimationContainerState extends State<FinalAnimationContainer>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _controller2;
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;

  selectAlignment() => selected ? Alignment.bottomRight : Alignment.bottomLeft;

  selectAlignment2() =>
      selected2 ? Alignment.topCenter : Alignment.bottomCenter;

  selectAlignment3() =>
      selected3 ? Alignment.bottomLeft : Alignment.bottomRight;

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

    _controller2 = AnimationController(
      value: 0,
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
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
        _controller2!.forward();
        animationChange();
        animationChange2();
        animationChange3();
        toggleFAB();
      },
      child: Container(
        height: 700.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/landing_page/yellow_background.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 85.0, top: 30.0, bottom: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1C1F26).withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1C1F26).withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 12.0, bottom: 12.0),
                  child: Container(
                    // height: 800.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage("assets/landing_page/thirdcc.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: FadeTransition(
                      opacity: _controller!,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          // image: DecorationImage(
                          //     image: AssetImage("assets/landing_page/final_animation.png"),
                          //     fit: BoxFit.contain),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 150.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // SizedBox(width: 290.0),
                                    Container(
                                      width: 800.0,
                                      child: AnimatedAlign(
                                        alignment: selectAlignment(),
                                        duration: const Duration(seconds: 3),
                                        curve: Curves.fastOutSlowIn,
                                        child: Text(
                                          "USE MOBILE APP TO\nCONTROL APPOINTMENT",
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
                                    SizedBox(width: 325.0),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
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
                                                "As a doctor of Smart Autism Therapist you will have the privilege to control your appointments by using both mobile app and web app and you will also be able to communicate with your clients.",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 250.0),
                                // AnimatedBuilder(
                                //   animation: _controller2!.view,
                                //   builder: (context, child) {
                                //     return Transform.rotate(
                                //         angle: _controller2!.value * 2 * pi,
                                //         child: child);
                                //   },
                                Container(
                                  width: 1000.0,
                                  height: 700.0,
                                  child: AnimatedAlign(
                                    alignment: selectAlignment3(),
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.fastOutSlowIn,
                                    child: Container(
                                      height: 700.0,
                                      child: Image(
                                        image: AssetImage(
                                            "assets/landing_page/half_mobile.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 250.0),
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
