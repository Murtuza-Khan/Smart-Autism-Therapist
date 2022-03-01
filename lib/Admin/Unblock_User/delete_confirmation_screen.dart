import 'package:admin/Admin/Unblock_User/unblock_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final userRef = FirebaseFirestore.instance.collection('usersReport');

dynamic data = firebase_storage.Reference;

class DeleteConfirmationScreen extends StatefulWidget {
  final String? title, description, buttonText;
  final Image? image;
  final String docID;
  final String? photoUrl;
  DeleteConfirmationScreen(
      {this.title,
      this.description,
      this.buttonText,
      this.image,
      required this.photoUrl,
      required this.docID});

  @override
  State<DeleteConfirmationScreen> createState() =>
      _DeleteConfirmationScreenState();
}

class _DeleteConfirmationScreenState extends State<DeleteConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 500.0,
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title!,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                widget.description!,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () async {
                    await firebase_storage.FirebaseStorage.instance
                        .ref(widget.photoUrl!)
                        .delete()
                        .then((value) {
                      userRef.doc(widget.docID).delete().then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "User unblocked successfully",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.cyanAccent.shade400,
                          ));
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UnblockUserScreen(),
                                ),
                              );
                            },
                          );
                        },
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16.0,
          right: 16.0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 55,
            child: ClipRRect(
              child: Image.asset('assets/info.jpg'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ],
    );
  }
}
