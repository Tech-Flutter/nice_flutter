import 'package:flutter/material.dart';
import 'package:nice/check_in.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedPage = 0;

  final _pageOptions = [
    CheckIn(),
    CheckIn(),
    CheckIn(),
    CheckIn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
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
                        const Text(
                          "sales executive",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      "Today's Orders",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF3B5EAB)),
                                    ),
                                  ),
                                  Text(
                                    "17",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF4F4F4F)),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    "Pending Orders",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF3B5EAB)),
                                  ),
                                ),
                                Text(
                                  "08",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF4F4F4F)),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range), label: 'New Orders'),
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
}
