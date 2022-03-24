import 'package:flutter/material.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/welcome.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: const [
                  Text(
                    "Please start your check-in before",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)),
                  ),
                  Text(
                    "placed the order",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 45, 30, 30),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  child: const Text("Check-in"),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const CheckIn())),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF3CACE1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
