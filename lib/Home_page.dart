import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return DashbordScreen();
            } else if (snapshot.hasError) {
              return Center(child: Text("Something Went Wrong!"));
            } else {
              return LoginScreen();
            }
          },
        ),
      );
}
