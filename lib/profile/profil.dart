import 'package:flutter/material.dart';
import 'package:kendua/profile/edit.dart';

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
            Stack(
             children: [
               Container(
                 height: MediaQuery.of(context).size.height * .25,
                 width: MediaQuery.of(context).size.width,
                 child: Image.network(
                  "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
                   fit: BoxFit.cover,
                 ),
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
             ],
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
                          hintText: "number",
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
            RaisedButton(
              color: Colors.green,
                onPressed:(){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Edit()));
                },
                child: Text("Edit",

                  style: TextStyle(color: Color(0xffffffff)),
                ),

            )
          ],
        ),
      );
    }));
  }
}
