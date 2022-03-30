import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
                image: AssetImage("assets/welcome.png"), fit: BoxFit.fill)),
        Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Get Start",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    )
        /*DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/welcome.png'), fit: BoxFit.fill),
        ),
      ),*/
        );
  }
}
