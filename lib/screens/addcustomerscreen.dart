import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homescreen.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newCustomer = '';
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
                'Add Customer',
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
                  'Add',
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
