import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nice/check_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/logo.svg",
            height: 70,
          )),
          const Text(
            "nice",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            "engineers",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 60, 20),
            child: Column(
              children: const [
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Login Id",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFF4F4F4F))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xffDB5E77),
                        decoration: TextDecoration.underline,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                child: const Text("Login"),
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
    );
  }
}
