import 'package:flutter/material.dart';
import 'package:testmobile/component/roundbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testmobile/screens/addcustomerscreen.dart';
import 'package:testmobile/screens/homescreen.dart';
import 'package:testmobile/screens/editcustomerscreen.dart';

final _firestore = FirebaseFirestore.instance;

class CustomerScreen extends StatefulWidget {
  static const String id = 'customer_screen';

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddCustomerScreen());
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Customer'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5.0,
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
          ),
          MessagesStream()
        ],
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('testmobile').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data?.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages!) {
            var data = message.data() as Map;
            final messageText = data['customer'];
            final messageSender = data['user'];

            final currentUser = loggedInUser.email;

            if (currentUser == messageSender) {
              final messageBubble = MessageBubble(
                sender: messageSender,
                text: messageText,
                isMe: currentUser == messageSender,
              );
              messageBubbles.add(messageBubble);
            }
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              children: messageBubbles,
            ),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        return const Text(
          "No Customer",
          textAlign: TextAlign.center,
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.sender,
    required this.text,
    required this.isMe,
  });

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            borderRadius: const BorderRadius.all(Radius.zero),
            elevation: 5.0,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => EditCustomerScreen(
                                oldname: text,
                              ));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      _firestore.collection('testmobile').doc(text).delete();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
