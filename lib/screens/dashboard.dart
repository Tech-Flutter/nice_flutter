import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:nice/screens/check_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

int totalorder = 0,
    sucess = 0,
    progress = 0,
    pending = 0,
    cancelled = 0,
    today = 0;

String username = "";

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedPage = 0;
  final style = const TextStyle(
      color: Color(0xFF4F4F4F), fontSize: 16, fontWeight: FontWeight.bold);

  final style2 = const TextStyle(color: Color(0xFF4F4F4F), fontSize: 14);

  final _pageOptions = [
    const CheckIn(),
    const CheckIn(),
    const CheckIn(),
    const CheckIn(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: SvgPicture.asset(
                          "assets/logo.svg",
                          height: 40,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: const [
                            Icon(Icons.ac_unit),
                            Text(' Checkout'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1VvqwlDjUJ6i1fiQpWJgvnEPFjdksQEde-KEjCx66skt39oib1QtroMgS8W-_Ihu8P6Q&usqp=CAU"),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 5),
                            child: Text(
                              "Saurabh Saxena",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3B5EAB),
                              ),
                            ),
                          ),
                          Text(
                            "sales executive",
                            style: GoogleFonts.poppins(textStyle: style2),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        "Today's Orders",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF3B5EAB)),
                                      ),
                                    ),
                                    Text(
                                      "$today",
                                      style: GoogleFonts.poppins(
                                          textStyle: style2),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      "Pending Orders",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF3B5EAB)),
                                    ),
                                  ),
                                  Text(
                                    "$pending",
                                    style:
                                        GoogleFonts.poppins(textStyle: style2),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Monthly Review",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Center(
                                child: SvgPicture.asset(
                              "assets/logo.svg",
                              height: 25,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$totalorder",
                                    style:
                                        GoogleFonts.poppins(textStyle: style),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Orders Placed",
                                      style: GoogleFonts.poppins(
                                          textStyle: style2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Center(
                                child: SvgPicture.asset(
                              "assets/logo.svg",
                              height: 25,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$sucess",
                                    style:
                                        GoogleFonts.poppins(textStyle: style),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Orders successfully delivered",
                                      style: GoogleFonts.poppins(
                                          textStyle: style2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Center(
                                child: SvgPicture.asset(
                              "assets/logo.svg",
                              height: 25,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$progress",
                                    style:
                                        GoogleFonts.poppins(textStyle: style),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Orders in progress",
                                      style: GoogleFonts.poppins(
                                          textStyle: style2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Center(
                                child: SvgPicture.asset(
                              "assets/logo.svg",
                              height: 25,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$pending",
                                    style:
                                        GoogleFonts.poppins(textStyle: style),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Orders pending",
                                      style: GoogleFonts.poppins(
                                          textStyle: style2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Center(
                                child: SvgPicture.asset(
                              "assets/logo.svg",
                              height: 25,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$cancelled",
                                    style:
                                        GoogleFonts.poppins(textStyle: style),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Orders cancelled",
                                      style: GoogleFonts.poppins(
                                          textStyle: style2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: const Color(0xFF3B5EAB),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.pages), label: 'New Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: 'Logout'),
          ],
          elevation: 5.0,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }

  void initState() {
    super.initState();
    dashboard(context);
  }
}

void dashboard(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = prefs.get("userId");
  var apiAccessToken = prefs.get("apiAccessToken").toString();
  print(apiAccessToken);

  try {
    Response response = await post(
        Uri.parse('http://test.niceengineers.in/api/homestats'),
        headers: {
          'Authorization': "$apiAccessToken",
        },
        body: {
          'user_id': user_id.toString(),
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);

      var status = data["status"];
      print(status);
      if (status) {
        var data = jsonDecode(response.body);
        print(data);

        totalorder = data['data']['total_order'];
        sucess = data['data']['success'];
        progress = data['data']['progress'];
        pending = data['data']['pending'];
        cancelled = data['data']['cancelled'];
        today = data['data']['today_order'];
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
