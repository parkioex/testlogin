import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testmobile/constants.dart';
import 'package:testmobile/component/roundbutton.dart';
import 'package:testmobile/screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 20.0, bottom: 8.0),
              child: SizedBox(
                height: 50.0,
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Email'),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
              child: SizedBox(
                height: 50.0,
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password'),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              onPress: () async {
                try {
                  await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(
                    context,
                    HomeScreen.id,
                  );
                } catch (e) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Email or Password Incorrect'),
                      content: const Text('คุณใส่ Email หรือ Password ผิด'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                  );
                }
              },
              buttonTitle: 'Login',
              buttonColor: const MaterialStatePropertyAll<Color>(
                Colors.lightBlueAccent,
              ),
            ),
            RoundedButton(
              onPress: () {},
              buttonTitle: 'Forgot Password',
              buttonColor: const MaterialStatePropertyAll<Color>(
                Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
