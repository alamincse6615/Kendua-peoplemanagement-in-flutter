import 'package:flutter/material.dart';
import 'package:kendua/admin/news.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
      ),
      body: ListView.builder(
          itemBuilder:
         (context, index){
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

                           ),
                         ],
                       )),
                 ],
               ),
             ),
           );
         }
      ),
      backgroundColor: Colors.green,
    );
  }
}
