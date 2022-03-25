import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice/dashboard.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({Key? key}) : super(key: key);
  final style = const TextStyle(fontSize: 14, color: Color(0xFF4F4F4F));

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
              child: Image.asset('assets/checkin.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    "Please start your check-in before",
                    style: GoogleFonts.poppins(textStyle: style),
                  ),
                  Text(
                    "placed the order",
                    style: GoogleFonts.poppins(textStyle: style),
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
                      MaterialPageRoute(builder: (context) => Dashboard())),
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
