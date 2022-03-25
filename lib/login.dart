import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:nice/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  final myController_pass = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
              children: [
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Login Id",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFF4F4F4F))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    obscureText: true,
                    controller: myController_pass,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
                    ),
                  ),
                ),
                const Align(
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
                onPressed:
                    () => /*Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const CheckIn())*/
                        login(myController.text, myController_pass.text),
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

void login(String email, password) async {
  try {
    Response response = await post(
        Uri.parse('http://test.niceengineers.in/api/login_user'),
        body: {
          'email': email,
          'password': password,
        });

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<LoginModel>((json) => LoginModel.fromJson(json))
          .toList();
      /*
      var data = jsonDecode(response.body.toString());
      print(data);*/
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
