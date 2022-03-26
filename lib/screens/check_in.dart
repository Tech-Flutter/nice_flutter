import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:nice/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  onPressed: () => checkIn(context),
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

void checkIn(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = prefs.get("userId");
  var apiAccessToken = prefs.get("apiAccessToken");
  print(user_id);

  try {
    Response response = await post(
        Uri.parse('http://test.niceengineers.in/api/checkin_user'),
        headers: {
          'Authorization': "$apiAccessToken",
        },
        body: {
          'user_id': user_id.toString(),
          'latitude': "26.0000",
          'longitude': "72.6400",
          'address': "jaipur",
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);

      var status = data["status"];
      print(status);
      if (status) {
        var data = jsonDecode(response.body);
        print(data);
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Dashboard(),
          ),
        );
      } else {
        var message = data["message"];

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
