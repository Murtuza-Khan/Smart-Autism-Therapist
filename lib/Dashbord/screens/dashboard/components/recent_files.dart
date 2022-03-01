import 'package:admin/Dashbord/models/RecentFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: [
          Container(
            height: 530.0,
            padding: EdgeInsets.all(defaultPadding),
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
              image: DecorationImage(
                  image: AssetImage("assets/graph.jpg"), fit: BoxFit.fill),
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       "Graph",
            //       style: Theme.of(context).textTheme.subtitle1,
            //     ),
            //     SizedBox(
            //       width: double.infinity,
            //       child: DataTable2(
            //         columnSpacing: defaultPadding,
            //         minWidth: 600,
            //         columns: [
            //           DataColumn(
            //             label: Text("File Name"),
            //           ),
            //           DataColumn(
            //             label: Text("Date"),
            //           ),
            //           DataColumn(
            //             label: Text("Size"),
            //           ),
            //         ],
            //         rows: List.generate(
            //           demoRecentFiles.length,
            //           (index) => recentFileDataRow(demoRecentFiles[index]),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          // Container(
          //   height: 530.0,
          //   padding: EdgeInsets.all(defaultPadding),
          //   decoration: BoxDecoration(
          //     color: secondaryColor.withOpacity(0.1),
          //     borderRadius: const BorderRadius.all(Radius.circular(10)),
          //     border: Border.all(color: Colors.black),
          //   ),
          // ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
