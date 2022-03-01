import 'package:admin/Admin/Patient_Details/Patient_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final userRef = FirebaseFirestore.instance.collection('Patient_Data');

class PatientDeleting extends StatefulWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final Image? image;

  final String? docID;
  PatientDeleting({
    this.title,
    this.description,
    this.buttonText,
    this.image,
    @required this.docID,
  });

  @override
  State<PatientDeleting> createState() => _PatientDeletingState();
}

class _PatientDeletingState extends State<PatientDeleting> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
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
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No", style: TextStyle(fontSize: 18.0)),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        print(widget.docID);
                        new Future.delayed(const Duration(seconds: 1), () {
                          userRef.doc(widget.docID).delete().then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Data deleted successfully",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.cyanAccent.shade400,
                            ));
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientScreen()));
                            });
                          });
                        });
                      },
                      child: Text("Yes", style: TextStyle(fontSize: 18.0)),
                    ),
                  ),
                ],
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
