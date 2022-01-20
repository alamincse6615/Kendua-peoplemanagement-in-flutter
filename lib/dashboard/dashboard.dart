import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kendua/profile/profil.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text("About Us")),
              PopupMenuItem(child: Text("Contact with Us")),
              PopupMenuItem(child: Text("Exit")),
            ];
          })
        ],
      ),
      drawer: Drawer(
          backgroundColor: Color(0xff782fff),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("osman"),
                accountEmail: Text("Gmail"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/236x/48/a0/72/48a072d70bfc0bb7ed4de85a3aaa2df2.jpg"),
                ),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text("My Profil"),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfil()));
                },
              ),
              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share_outlined),
              ),
              ListTile(
                title: Text("privacy policy"),
                leading: Icon(Icons.privacy_tip),
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout_outlined),
              ),
            ],
          )),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * .30,
                      child: Image.asset(
                        "images/person.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width * .60,
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * .60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "User Name",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    "designation",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "0124552365241",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              height: 120,
                              width: MediaQuery.of(context).size.width * .60,
                              child: PopupMenuButton(
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(child: Text("Call")),
                                    PopupMenuItem(child: Text("Msg")),
                                  ];
                                },
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
//(child: Text(auth.currentUser!.email.toString())),
}
