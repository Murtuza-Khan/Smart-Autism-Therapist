import 'package:admin/Login/login_screen.dart';
import 'package:flutter/material.dart';

class BottomDesign extends StatefulWidget {
  const BottomDesign({Key? key}) : super(key: key);

  @override
  State<BottomDesign> createState() => _BottomDesignState();
}

class _BottomDesignState extends State<BottomDesign> {
  double buttonWidth = 150.0;

  double buttonHeight = 60.0;

  Color buttonColor = Colors.white;

  double textSize = 15.0;

  double constPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/landing_page/bottom_design_final.png"),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN IN NOW TO COMMUNICATE FROM HOME",
                style: TextStyle( 
                  color: Colors.white,
                  fontFamily: 'cat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 640.0,
                  ),
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        buttonHeight = 65.0;
                        buttonWidth = 155.0;
                        textSize = 20.0;
                        constPadding = 0.0;
                        buttonColor = Color(0xFFF85F6A);
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        buttonHeight = 60.0;
                        buttonWidth = 150.0;
                        textSize = 15.0;
                        constPadding = 5.0;
                        buttonColor = Colors.white;
                      });
                    },
                    child: Container(
                      width: 155.0,
                      height: 65.0,
                      child: Padding(
                        padding: EdgeInsets.all(constPadding),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: buttonColor, width: 2.0),
                            ),
                            child: Center(
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                  color: buttonColor,
                                  fontFamily: 'cat',
                                  fontSize: textSize,
                                  // fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
