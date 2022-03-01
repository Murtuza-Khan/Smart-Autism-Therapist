import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import 'chart.dart';

import '../utils/constants.dart';

import '../models/country_summary.dart';
import '../models/time_series_cases.dart';

class CountryStatistics extends StatelessWidget {
  final List<CountrySummaryModel> summaryList;

  CountryStatistics({required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // if (summaryList.isNotEmpty) ...[
        //   // buildCard2(
        //   //   "CONFIRMED",
        //   //   kConfirmedColor,
        //   //   "ACTIVE",
        //   //   kActiveColor,
        //   // ),
        // ] else ...[
        //   buildCardNoData1(
        //     "CONFIRMED",
        //     kConfirmedColor,
        //     "ACTIVE",
        //     kActiveColor,
        //   ),
        // ],
        // if (summaryList.isNotEmpty) ...[
        //   buildCard(
        //     "RECOVERED",
        //     kRecoveredColor,
        //     "DEATH",
        //     kDeathColor,
        //   ),
        // ] else ...[
        //   buildCardNoData1(
        //     "RECOVERED",
        //     kRecoveredColor,
        //     "DEATH",
        //     kDeathColor,
        //   ),
        // ],
        if (summaryList.isNotEmpty) ...[
          buildCardChart(summaryList),
        ] else ...[
          Container(width: 2, height: 2, color: Colors.transparent),
        ],
      ],
    );
  }

  // showDialog(
  //         context: context,
  //         builder: (context) => AlertDialogBoxSigninError(
  //               title: "Failed",
  //               description: "$e",
  //             ));

  Widget buildCard(
      String leftTitle, Color leftColor, String rightTitle, Color rightColor) {
    dynamic _formattedNumberRecovered = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summaryList[summaryList.length - 1].recovered);

    dynamic _formattedNumberDeath = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summaryList[summaryList.length - 1].death);

    var formatter = NumberFormat('#,##,000');

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.cyanAccent, width: 4)),
        height: 130,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                if (summaryList[summaryList.length - 1].recovered <=
                    1000000) ...[
                  Text(
                    summaryList[summaryList.length - 1].recovered.toString(),
                    style: TextStyle(
                      color: leftColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ] else ...[
                  Text(
                    _formattedNumberRecovered,
                    style: TextStyle(
                      color: leftColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                if (summaryList[summaryList.length - 1].death <= 1000000) ...[
                  Text(
                    formatter.format(summaryList[summaryList.length - 1].death),
                    style: TextStyle(
                      color: rightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ] else ...[
                  Text(
                    _formattedNumberDeath,
                    style: TextStyle(
                      color: rightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard2(
      String leftTitle, Color leftColor, String rightTitle, Color rightColor) {
    var _formattedNumberConfirmed = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summaryList[summaryList.length - 1].confirmed);

    var _formattedNumberActive = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summaryList[summaryList.length - 1].active);

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.cyanAccent, width: 4)),
        height: 130,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _formattedNumberConfirmed,
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _formattedNumberActive,
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardChart(List<CountrySummaryModel> summaryList) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 520.0,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Chart(
          _createData(summaryList),
          animate: false,
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(
      List<CountrySummaryModel> summaryList) {
    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.death));
    }

    return [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),
    ];
  }

  Widget buildCardNoData1(
      String leftTitle, Color leftColor, String rightTitle, Color rightColor) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.cyanAccent, width: 4)),
        height: 130,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
