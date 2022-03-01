import 'package:flutter/material.dart';

import '../../../constants.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.amountOfFiles,
  }) : super(key: key);

  final String title, amountOfFiles;
  final IconData icon;
  final Color iconColor;
  // final int numOfFiles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: defaultPadding),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 25,
              width: 25,
              child: Icon(
                icon,
                color: iconColor,size: 25,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 9.0),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 9.0),
                    // Text(
                    //   "$numOfFiles Files",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .caption!
                    //       .copyWith(color: Colors.white70),
                    // ),
                  ],
                ),
              ),
            ),
            Text(amountOfFiles)
          ],
        ),
      ),
    );
  }
}
