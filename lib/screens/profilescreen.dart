import 'package:flutter/material.dart';

import 'package:testmobile/component/roundbutton.dart';
import 'package:testmobile/screens/homescreen.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(loggedInUser.email.toString()),
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedButton(
            onPress: () {
              Navigator.pop(context);
              setState(() {});
            },
            buttonTitle: 'Home',
            buttonColor: const MaterialStatePropertyAll<Color>(
              Colors.lightBlueAccent,
            ),
          )
        ],
      ),
    );
  }
}
