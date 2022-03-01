import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 30.0,
        height: 30.0,
          color: Colors.white,
          child: CircularProgressIndicator(
            color: Colors.black,
          )),
    );
  }
}
