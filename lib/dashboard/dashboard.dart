import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem(child: Text("About Us")),
              PopupMenuItem(child: Text("Contact with Us")),
              PopupMenuItem(child: Text("Exit")),
            ];
          })
        ],
      ),
      drawer: Drawer(

      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(8,4,8,4),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      height: 120,
                        width: MediaQuery.of(context).size.width*.30,
                        child: Image.asset(
                          "images/person.jpg",
                        fit: BoxFit.fill,
                        ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      height: 120,
                        width: MediaQuery.of(context).size.width*.60,
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width*.60,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "User Name",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blue
                                  ),
                                ),
                                Text(
                                  "designation",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17,
                                      color: Colors.black
                                  ),
                                ),
                                Text("0124552365241",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17,
                                      color: Colors.grey
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            height: 120,
                            width: MediaQuery.of(context).size.width*.60,
                            child:  PopupMenuButton(itemBuilder: (BuildContext context) {
                              return[
                                PopupMenuItem(child: Text("Call")),
                                PopupMenuItem(child: Text("Msg")),
                              ];
                            },

                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
