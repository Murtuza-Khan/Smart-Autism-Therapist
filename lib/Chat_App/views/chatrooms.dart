import 'dart:ui';

import 'package:admin/Chat_App/helper/constants.dart';
import 'package:admin/Chat_App/helper/helperfunctions.dart';
import 'package:admin/Chat_App/new_chat_main.dart';
import 'package:admin/Chat_App/services/database.dart';
import 'package:admin/Chat_App/views/chat.dart';
import 'package:admin/Chat_App/views/search.dart';
import 'package:admin/Dashbord/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  Widget chatRoomsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName:
                        (snapshot.data!.docs[index].data() as Map)['chatRoomId']
                            .toString()
                            .replaceAll("_", "")
                            .replaceAll(Constants.myName, ""),
                    chatRoomId: (snapshot.data!.docs[index].data()
                        as Map)["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = (await HelperFunctions.getUserNameSharedPreference())!;
    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        _usersStream = snapshots;
        print(
            "we got the data + ${_usersStream.toString()} this is name  ${Constants.myName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212332),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/dvpAppBar.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Text(
          "Chat",
          style: TextStyle(
            fontFamily: 'abril',
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyNewChatFinalApp()));
          },
          child: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     AuthService().signOut();
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => Authenticate()));
          //   },
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     child: Icon(Icons.exit_to_app),
          //   ),
          // )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/dvp.png"), fit: BoxFit.fill),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 400.0,
                    right: 400.0,
                    top: 30.0,
                    bottom: 30.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 30.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: Container(
                        child: chatRoomsList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF181A25),
        elevation: 30.0,
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () { 
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final String? userName;
  final String? chatRoomId;

  ChatRoomsTile({this.userName, @required this.chatRoomId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chat(
                      chatRoomId: chatRoomId,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF181A25),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.white54,
              offset: Offset(0.0, 0.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xFFF7F0A5),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(userName!.substring(0, 1),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'OverpassRegular',
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(userName!,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
