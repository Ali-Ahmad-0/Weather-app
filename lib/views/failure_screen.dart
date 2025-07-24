
import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
   const FailureScreen({
    super.key, required this.message,
  });
final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.red, Colors.blueGrey.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            message,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
