import 'package:admin/Dashbord/constants.dart';
import 'package:admin/doctors_details/models/destination_model.dart';
import 'package:admin/doctors_details/screens/Doc1_Destination/destination_screen.dart';
import 'package:admin/doctors_details/screens/Doc2_Destination/destination_screen_2.dart';
import 'package:admin/doctors_details/screens/Doc3_Destination/destination_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Top Doctors",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () => print("See All"),
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 320.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length - 2,
              itemBuilder: (BuildContext context, int index) {
                Destination destination = destinations[index];
                Destination2 destination2 = destinations2[index];
                Destination3 destination3 = destinations3[index];
                return GestureDetector(
                  onTap: () {
                    if (destination == destinations[0]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DestinationScreen(
                            destination: destination,
                          ),
                        ),
                      );
                    } else if (destination == destinations[1]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DestinationScreen2(
                            destination2: destination2,
                          ),
                        ),
                      );
                    } else if (destination == destinations[2]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DestinationScreen3(
                            destination3: destination3,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 5.0,
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF98EAFF),
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 5.0, right: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        '${destination.activities!.length} activities',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      destination.description!,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white38,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: destination.imageUrl!,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: 200.0,
                                    width: 200.0,
                                    image: AssetImage(destination.imageUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination.city!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 10.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          destination.country!,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
