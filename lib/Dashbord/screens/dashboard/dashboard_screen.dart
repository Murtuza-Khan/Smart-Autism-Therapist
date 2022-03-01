import 'package:admin/Dashbord/responsive.dart';
import 'package:admin/Dashbord/screens/dashboard/components/covid_chart.dart';
import 'package:admin/Dashbord/screens/dashboard/components/header.dart';
import 'package:admin/Dashbord/screens/dashboard/components/header_pic.dart';
import 'package:admin/Dashbord/screens/dashboard/components/my_files.dart';
import 'package:admin/Primary_graph/page/line_chart_page.dart';
import 'package:admin/live_news/screens/global.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatefulWidget { 
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            if (!Responsive.isMobile(context)) HeaderPic(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // SizedBox(height: defaultPadding),
                      MyFiles(),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Ausitm prevalance has increased ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            ),
                          ),
                          Text(
                            "178%",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 19.0,
                            ),
                          ),
                          Text(
                            " since 2000",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      LineChartPage(),

                      SizedBox(height: defaultPadding),
                      Row(
                        children: [
                          Text(
                            "Pakistan Covid-19 Status",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'abril',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      CovidChart(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StarageDetails(),
                      SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) Global(),
                      // if (!Responsive.isMobile(context)) StarageDetails(),
                      // SizedBox(height: defaultPadding),
                      // if (!Responsive.isMobile(context)) TestingScreen(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context)) ...[
                  SizedBox(width: defaultPadding),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 38.0),
                        // On Mobile means if the screen is less than 850 we dont want to show it
                        if (!Responsive.isMobile(context)) StarageDetails(),

                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Text(
                              "Other Data",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'abril',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: defaultPadding),

                        if (!Responsive.isMobile(context))
                          Container(
                            height: 530.0,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Global(),
                          ),
                      ],
                    ),
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
