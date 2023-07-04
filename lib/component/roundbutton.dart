import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  RoundedButton(
      {super.key, @required this.buttonColor, required this.buttonTitle, required this.onPress});
  var buttonColor;
  late String buttonTitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 45.0,
        child: TextButton(
          onPressed: onPress,
          style: ButtonStyle(
            shadowColor: const MaterialStatePropertyAll(
              Colors.grey,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: buttonColor
          ),
          child: Text(
            buttonTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

