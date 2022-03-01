import 'package:admin/Dashbord/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HeaderPic extends StatelessWidget {
  const HeaderPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 4,
          child: Stack(
            children: [
              Container(
                height: 500.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/header4.jpg"),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                height: 400.0,
                width: double.infinity,
                color: Colors.black38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Smart Autism Therapist",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'abril'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Shimmer.fromColors(
                          child: Text(
                              "Best and quality treatment for your child because we belive every child is special",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      color: Colors.white,
                                      fontFamily: 'Italianno'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          baseColor: Colors.white,
                          highlightColor: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
