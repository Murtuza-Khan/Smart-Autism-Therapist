import 'package:admin/Dashbord/constants.dart';
import 'package:admin/Primary_graph/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 500.0,
        decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 26, right: 40.0),
            child: LineChartWidget(),
          ),
        ),
      );
}
