import 'package:admin/Dashbord/main_dashbord.dart';
import 'package:admin/Landing_Page/landing_page.dart';
import 'package:admin/Login/helper/constants.dart';
import 'package:admin/Login/providers/app.dart';
import 'package:admin/Login/providers/auth.dart';
import 'package:admin/Login/screens/Loding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: AuthProvider.init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Autism Therapist',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppScreensController(),
      )));
}

class AppScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LandingPage();
      case Status.Authenticated:
        return DashbordScreen();
      default:
        return LandingPage();
    }
  }
}
