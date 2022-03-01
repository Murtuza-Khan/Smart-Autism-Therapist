import 'package:flutter/material.dart';

class SeventhAnimationContainer extends StatefulWidget {
  // final bool aniGo;
  // SeventhAnimationContainer({required this.aniGo});

  @override
  State<SeventhAnimationContainer> createState() =>
      _SeventhAnimationContainerState();
}

class _SeventhAnimationContainerState extends State<SeventhAnimationContainer>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;

  selectAlignment() => selected ? Alignment.bottomCenter : Alignment.topCenter;

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
        toggleFAB();
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/dvp.png"), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
          child: Container(
            height: 550.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.black, width: 2.0),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(-6.0, 6.0),
                  blurRadius: 5.0,
                ),
              ],
              image: DecorationImage(
                  image:
                      AssetImage("assets/landing_page/yellow_background.png"),
                  fit: BoxFit.cover),
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
                            // SizedBox(width: 200.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  // color: Colors.black,
                                  height: 250.0,
                                  width: 600.0,
                                  child: AnimatedAlign(
                                    alignment: selectAlignment(),
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.fastOutSlowIn,
                                    child: Text(
                                      "SMART AUTISM THERAPIST\nA COMPLETE PACKAGE",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'cat',
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      // textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 230.0),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // color: Colors.black,
                                  width: 450.0,
                                  height: 270.0,
                                  child: AnimatedAlign(
                                    alignment: selectAlignment2(),
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.fastOutSlowIn,
                                    child: Container(
                                      width: 500.0,
                                      child: Text(
                                        "Smart Autism Therapist is a complete package for the treatment of Autism because it provide all the tools to connect a doctor to his patient and it is free to use, patient can give feedback about the treatment of doctor and patient can also connect to the doctor via video call to attend his/her session. In Smart Autism Therapist doctors can also report a patient in case of abuse and that patient will be blocked from using the app.",
                                        style: TextStyle(
                                          color: Colors.black,
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
                            SizedBox(width: 337.0),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 200.0),
                        Container(
                          width: 1000,
                          height: 550.0,
                          child: AnimatedAlign(
                            alignment: selectAlignment3(),
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                              height: 550.0,
                              child: Image(
                                image: AssetImage(
                                    "assets/landing_page/half_three_mobiles.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
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
    );
  }

  Future toggleFAB() =>
      isForwardAnimation ? _controller!.forward() : _controller!.forward();
}
