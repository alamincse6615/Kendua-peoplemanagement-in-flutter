import 'package:flutter/material.dart';
import 'package:kendua/admin/admin_users_property/usersdetails.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users List"),
        ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,int index){
            return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"
                  ),
                ),
                title:Column(
                  children: [
                    Text("Example Name"),
                    Text("example@gmail.com"),
                  ],
                ),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersDetails()));
              },
            );
          }
      ),
    );
  }
}
