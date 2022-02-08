import 'package:flutter/material.dart';
import 'package:kendua/admin/admin_users_property/usersedit.dart';

class UsersDetails extends StatefulWidget {
  const UsersDetails({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersEdit()));
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
