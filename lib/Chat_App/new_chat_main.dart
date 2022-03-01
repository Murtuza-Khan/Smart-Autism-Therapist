import 'package:admin/Chat_App/helper/authenticate.dart';
import 'package:admin/Chat_App/helper/helperfunctions.dart';
import 'package:admin/Chat_App/views/chatrooms.dart';
import 'package:flutter/material.dart';

class MyNewChatFinalApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyNewChatFinalAppState createState() => _MyNewChatFinalAppState();
}

class _MyNewChatFinalAppState extends State<MyNewChatFinalApp> {
  late bool? userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Autism Therapist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00FFCD),
        scaffoldBackgroundColor: Color(0xFF212332),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF00FFCD)),
      ),
      home: userIsLoggedIn != null
          ? userIsLoggedIn!
              ? ChatRoom()
              : Authenticate()
          : Container(
              child: Center(
                child: Authenticate(),
              ),
            ),
    );
  }
}
