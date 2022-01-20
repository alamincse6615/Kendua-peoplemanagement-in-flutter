import 'package:flutter/material.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({Key? key}) : super(key: key);

  @override
  _MyProfilState createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(builder: (context, info) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width,
              child: CircleAvatar(
                radius: 200,
                backgroundImage: NetworkImage(
                    "https://cdn.dribbble.com/users/1934630/screenshots/4944473/media/7a29c5e71e9299af1e0f38ab0583b3de.jpg?compress=1&resize=400x300"),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width,
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "About",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
//Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           prefix: GestureDetector(
//                             onTap: () {
//                             },
//                           ),
//                         ),
//                       ),
//                     )
}
