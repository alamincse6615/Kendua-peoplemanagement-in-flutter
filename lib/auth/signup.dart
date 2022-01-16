import 'package:flutter/material.dart';
import 'package:kendua/auth/signin.dart';
import 'package:kendua/dashboard/dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up to continue'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(

              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/logo.png"),
            ),
            Container(

              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Name",
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Phone Number",
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                  //changed
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Re-type your password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                      },
                      child: Text("Sign Up")
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have An Account ? "),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                            },
                            child: Text("Sign In",style: TextStyle(color: Colors.red),)),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
