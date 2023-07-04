import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homescreen.dart';

class Newgtttt extends StatelessWidget {
  const Newgtttt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EditCustomerScreen extends StatelessWidget {
  EditCustomerScreen({super.key, required this.oldname});
  late String oldname;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    late String newCustomer;
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: const Text(
                'Edit Customer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
            ),
            TextField(
              onChanged: (value) {
                newCustomer = value;
              },
              textInputAction: TextInputAction.done,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: TextButton(
                onPressed: () {
                  _firestore.collection('testmobile').doc(oldname).delete();
                  FirebaseFirestore.instance
                      .collection('testmobile')
                      .doc(newCustomer)
                      .set({
                    'customer': newCustomer,
                    'user': loggedInUser.email,
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
