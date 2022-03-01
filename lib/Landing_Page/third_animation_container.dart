import 'package:flutter/material.dart';

class ThirdAnimationContainer extends StatefulWidget {
  // final bool aniGo;
  // ThirdAnimationContainer({required this.aniGo});

  @override
  State<ThirdAnimationContainer> createState() =>
      _ThirdAnimationContainerState();
}

class _ThirdAnimationContainerState extends State<ThirdAnimationContainer>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;

  selectAlignment() => selected ? Alignment.bottomLeft : Alignment.bottomRight;

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
              image: AssetImage("assets/landing_page/yellow_background.png"),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SizedBox(width: 200.0),
                        Container(
                          width: 800.0,
                          child: AnimatedAlign(
                            alignment: selectAlignment(),
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn,
                            child: Text(
                              "SECURE AND FREE TO USE",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'cat',
                                fontSize: 50.0,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              // color: Colors.black,
                              width: 420.0,
                              height: 250.0,
                              child: AnimatedAlign(
                                alignment: selectAlignment2(), 
                                duration: const Duration(seconds: 3),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  width: 500.0,
                                  child: Text(
                                    "Smart Autism Therapist is free to use and it is also secure because we use Google Sign-in in our web app as well as mobile app therefore user should not be worried about the security we will only use the data that the user have made available for public.",
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
                        SizedBox(width: 380.0),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          height: 550.0,
                          child: Image(
                            image: AssetImage(
                                "assets/landing_page/tablet_mobile_final.png"),
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
