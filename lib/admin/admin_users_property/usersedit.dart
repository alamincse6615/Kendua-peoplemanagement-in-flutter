import 'package:flutter/material.dart';
import 'package:kendua/admin/admindashboard.dart';

class UsersEdit extends StatefulWidget {
  const UsersEdit({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomAppBar(

        child: Container(
          height: 40,
          color: Colors.white,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
            },
              child: Center(child: Text("Save"),
              )
          ),
        ),
      ),
    );
  }
}
