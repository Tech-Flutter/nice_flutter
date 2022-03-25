import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage('assets/welcome.png'), fit: BoxFit.fill),
      ),
    );
  }
}
