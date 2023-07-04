import 'package:flutter/material.dart';
import 'package:testmobile/component/roundbutton.dart';
import 'package:testmobile/screens/customerscreen.dart';
import 'package:testmobile/screens/profilescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
late User loggedInUser;

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout)
          )
        ],
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundedButton(
            onPress: () {
              Navigator.pushNamed(
                context,
                ProfileScreen.id,
              );
              setState(() {});
            },
            buttonTitle: 'Profile',
            buttonColor: const MaterialStatePropertyAll<Color>(
              Colors.lightBlueAccent,
            ),
          ),
          RoundedButton(
            onPress: () {
              Navigator.pushNamed(context, CustomerScreen.id);
              setState(() {});
            },
            buttonTitle: 'Customer',
            buttonColor: const MaterialStatePropertyAll<Color>(
              Colors.lightBlueAccent,
            ),
          )
        ],
      ),
    );
  }
}
