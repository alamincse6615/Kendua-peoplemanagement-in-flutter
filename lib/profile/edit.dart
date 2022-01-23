
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kendua/dashboard/dashboard.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  File? imagFromfile;
  String imagUrl = "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: FutureBuilder(builder: (context, info) {
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
                      imagUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.width,
                    child: imagFromfile==null?Container(
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 200,
                          backgroundImage: NetworkImage(
                             "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"
                          ),
                        ),
                        onTap: ()async{
                          PickedFile? pickedImge = await ImagePicker().getImage(source: ImageSource.gallery);
                          if(pickedImge !=null){
                          setState(() {
                          imagFromfile = File(pickedImge.path);
                          });
                          }
                          }   ),
                    ):InkWell(
                      child: CircleAvatar(
                        radius: 200,
                        backgroundImage: FileImage(
                            imagFromfile!
                        ),
                      ),
                      onTap: ()async{
                        PickedFile? pickedImge = await ImagePicker().getImage(source: ImageSource.gallery);
                        if(pickedImge !=null){
                          setState(() {
                            imagFromfile = File(pickedImge.path);
                          });
                        }
                      },
                    ),
                  )
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
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Dashboard()));
                },
                child: Text("Save",

                  style: TextStyle(color: Color(0xffffffff)),
                ),

              )
            ],
          ),
        );
      }),
    ));
  }
}
