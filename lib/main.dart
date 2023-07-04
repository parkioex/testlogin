import 'package:testmobile/screens/customerscreen.dart';
import 'package:testmobile/screens/homescreen.dart';
import 'package:testmobile/screens/profilescreen.dart';

import 'screens/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TestMobile());
}

class TestMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        CustomerScreen.id: (context) => CustomerScreen(),
      },
    );
  }
}
