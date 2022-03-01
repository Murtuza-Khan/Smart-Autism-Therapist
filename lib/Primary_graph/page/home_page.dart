import 'package:flutter/material.dart';

import '../main_graph.dart';
import 'line_chart_page.dart';

class GraphHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(PrimaryChart.title), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              LineChartPage(),
            ],
          ),
        ),
      );
}
