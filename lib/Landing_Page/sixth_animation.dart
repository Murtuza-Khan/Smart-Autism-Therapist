import 'package:flutter/material.dart';

class SixthAnimationContainer extends StatefulWidget {
  // final bool aniGo;
  // SixthAnimationContainer({required this.aniGo});

  @override
  State<SixthAnimationContainer> createState() =>
      _SixthAnimationContainerState();
}

class _SixthAnimationContainerState extends State<SixthAnimationContainer>
    with TickerProviderStateMixin {
  AnimationController? _controller;
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
        height: 550.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/landing_page/thirdcc.png"),
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
                    SizedBox(height: 150.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(width: 200.0),
                        Container(
                          width: 800.0,
                          child: AnimatedAlign(
                            alignment: selectAlignment(),
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn,
                            child: Text(
                              "SMART MECHANISM OF SMART\nAUTISM THERAPIST",
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
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 230.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.black,
                              width: 450.0,
                              height: 250.0,
                              child: AnimatedAlign(
                                alignment: selectAlignment2(),
                                duration: const Duration(seconds: 3),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  width: 500.0,
                                  child: Text(
                                    "There is a smart mechanism in Smart Autism Therapist which evaluates patient on the basis of questioner, Questioner containes list of question with some answers the user must attempt all the questions and at the end a score will be generated on the basis of given answers and score will be sent to the doctor and then doctor will start the treatment accordingly.",
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
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 250.0),
                    Container(
                      width: 1000,
                      height: 550.0,
                      child: AnimatedAlign(
                        alignment: selectAlignment3(),
                        duration: const Duration(seconds: 3),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          height: 500.0,
                          child: Image(
                            image: AssetImage(
                                "assets/landing_page/tablet_two_mobiles.png"),
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
    );
  }

  Future toggleFAB() =>
      isForwardAnimation ? _controller!.forward() : _controller!.forward();
}
