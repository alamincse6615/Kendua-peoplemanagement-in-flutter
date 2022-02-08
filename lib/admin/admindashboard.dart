import 'package:flutter/material.dart';
import 'package:kendua/admin/admin_news_property/newslist.dart';
import 'package:kendua/admin/admin_users_property/userslist.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<String> topic = [
    "Users",
    "News",
  ];

  List<Color> color = [
    Colors.blue,
    Colors.lightBlueAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Dashboard"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Center(
            child: GridView.builder(
                itemCount: topic.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color[index],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        topic[index],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      if(index==1)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsList()
                          )
                      );

                     /* else if(index==2)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsList()
                            )
                        );*/

                      else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UsersList()
                            )
                        );
                    },
                  );
                }),
          ),
        ));
  }
}
