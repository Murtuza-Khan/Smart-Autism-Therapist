import 'package:admin/Dashbord/constants.dart';
import 'package:admin/live_news/screens/country.dart';
import 'package:flutter/material.dart';

class CovidChart extends StatelessWidget {
  const CovidChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 530.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Country(),
          ),
          // Container(
          //   height: 500.0,
          //   padding: EdgeInsets.all(defaultPadding),
          //   decoration: BoxDecoration(
          //     color: secondaryColor.withOpacity(0.2),
          //     borderRadius: const BorderRadius.all(Radius.circular(10)),
          //     border: Border.all(color: Colors.black),
          //   ),
          // ),
        ],
      ),
    );
  }
}
