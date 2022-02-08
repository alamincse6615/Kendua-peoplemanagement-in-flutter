import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("news feed"),),

      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,int index){
            return ListTile(
                leading: Icon(Icons.list),
                trailing: Text("GFG",
                  style: TextStyle(
                      color: Colors.green,fontSize: 15),),
                title:Text("List item $index")
            );
          }
      ),
    );
  }
}
