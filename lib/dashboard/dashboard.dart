import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:kendua/profile/profil.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseReference _databaseReference;


  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    final que = _databaseReference.child("Users");
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
      body: FirebaseAnimatedList(
        query: que,
        itemBuilder: (context,snapshot,animated,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                  title: Text(snapshot.child("name").value.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  subtitle: Text(snapshot.child("email").value.toString()+"\n"+snapshot.child("phone").value.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                leading: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(child: Text("Call")),
                      PopupMenuItem(child: Text("Msg")),
                    ];
                  },
                ),
              ),
            ),
          );
        },
      ),
      /*body: ListView.builder(
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
          }),*/
    );
  }
//(child: Text(auth.currentUser!.email.toString())),
}
