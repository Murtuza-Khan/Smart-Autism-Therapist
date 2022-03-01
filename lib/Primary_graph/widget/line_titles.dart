import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (context ,value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '2000';
              case 1:
                return '2004';
              case 2:
                return '2007';
              case 3:
                return '2009';
              case 4:
                return '2011';
              case 5:
                return '2014';
              case 6:
                return '2016';
              case 7:
                return '2017';
              case 8:
                return '2018';
              case 9:
                return '2019';
              case 10:
                return '2020';
              case 11:
                return '2021';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context ,value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1 in 150';
              case 2:
                return '1 in 88';
              case 3:
                return '1 in 69';
              case 4:
                return '1 in 62';
              case 5:
                return '1 in 59';
              case 6:
                return '1 in 54';
            }
            return '';
          },
          reservedSize: 60,
          margin: 12,
        ),
      );
}
