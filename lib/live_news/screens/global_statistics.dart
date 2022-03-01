import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constants.dart';

import '../models/global_summary.dart';

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;

  GlobalStatistics({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildCard(
          "CONFIRMED",
          kConfirmedColor,
        ),
        SizedBox(height: 13.0),
        buildCard("ACTIVE", kActiveColor),
        // buildCard("RECOVERED", kRecoveredColor),
        SizedBox(height: 13.0),
        buildCard("DEATH", kDeathColor),
        SizedBox(height: 13.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "Statistics updated " + timeago.format(summary.date),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, Color color) {
    var _formattedNumberConfirmed = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.totalConfirmed);

    var _formattedNumberActive = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(
        summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths);

    var _formattedNumberRecovered = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.totalRecovered);

    var _formattedNumberDeath = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.totalDeaths);

    var _formattedNumberNewConfirmed = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.newConfirmed);

    var _formattedNumberNewActive = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.newConfirmed - summary.newRecovered - summary.newDeaths);

    var _formattedNumberNewRecovered = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.newRecovered);

    var _formattedNumberNewDeaths = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(summary.newDeaths);

    var formatter = NumberFormat('#,##,000');

    var newActive =
        summary.newConfirmed - summary.newRecovered - summary.newDeaths;
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
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    if (title == "CONFIRMED") ...[
                      Text(
                        _formattedNumberConfirmed,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ] else if (title == "ACTIVE") ...[
                      Text(
                        _formattedNumberActive,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ] else if (title == "RECOVERED") ...[
                      if (summary.newRecovered == 0) ...[
                        Text(
                          "Not Confirmed",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ] else ...[
                        if (summary.newRecovered <= 1000000) ...[
                          Text(
                            summary.newRecovered.toString(),
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ] else ...[
                          Text(
                            _formattedNumberRecovered,
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ]
                    ] else ...[
                      Text(
                        _formattedNumberDeath,
                        style: TextStyle(
                          color: color,
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
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    if (title == "CONFIRMED") ...[
                      if (summary.newConfirmed <= 1000000) ...[
                        Text(
                          formatter.format(summary.newConfirmed),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ] else ...[
                        Text(
                          _formattedNumberNewConfirmed,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ] else if (title == "ACTIVE") ...[
                      if (newActive <= 1000000) ...[
                        Text(
                          formatter.format(newActive),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ] else ...[
                        Text(
                          _formattedNumberNewActive,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ] else if (title == "RECOVERED") ...[
                      if (summary.newRecovered == 0) ...[
                        Text(
                          "Not Confirmed",
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ] else if (summary.newRecovered <= 1000000) ...[
                        Text(
                          formatter.format(summary.newRecovered),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ] else ...[
                        Text(
                          _formattedNumberNewRecovered,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ] else ...[
                      if (summary.newDeaths <= 1000000) ...[
                        Text(
                          formatter.format(summary.newDeaths),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ] else if (summary.newDeaths == 0) ...[
                        Text(
                          summary.newDeaths.toString(),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ] else ...[
                        Text(
                          _formattedNumberNewDeaths,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
