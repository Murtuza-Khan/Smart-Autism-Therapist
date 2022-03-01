import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage, id;
  final Color? color;
  final Icon? icon;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
    this.icon,
    this.id,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Doctors",
    numOfFiles: 1328,
    icon: Icon(
      Icons.medical_services,
      color: Color(0xFFFFD700),
    ),
    totalStorage: "1.9GB",
    color: Color(0xFFFFD700),
    percentage: 35,
    id: 1,
  ),
  CloudStorageInfo(
    title: "Chat",
    numOfFiles: 1328,
    icon: Icon(
      Icons.chat,
      color: Color(0xFFFFD700),
    ),
    totalStorage: "2.9GB",
    color: Color(0xFFFFD700),
    percentage: 35,
    id: 2,
  ),
  CloudStorageInfo(
    title: "Download Files",
    numOfFiles: 1328,
    icon: Icon(
      Icons.cloud,
      color: Color(0xFFFFD700),
    ),
    totalStorage: "1GB",
    color: Color(0xFFFFD700),
    percentage: 10,
    id: 3,
  ),
  CloudStorageInfo(
    title: "View Feedback",
    numOfFiles: 5328,
    icon: Icon(
      Icons.feedback,
      color: Color(0xFFFFD700),
    ),
    totalStorage: "7.3GB",
    color: Color(0xFFFFD700),
    percentage: 78,
    id: 4,
  ),
];
