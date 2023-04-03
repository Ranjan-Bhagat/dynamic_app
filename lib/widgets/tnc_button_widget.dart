import 'package:dynamic_app/screens/tnc_screen.dart';
import 'package:flutter/material.dart';

class TNCButton extends StatelessWidget {

  const TNCButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TNCScreen())),
      child: const Text(
        "Terms and Conditions",
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
