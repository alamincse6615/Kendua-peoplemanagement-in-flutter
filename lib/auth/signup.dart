import 'package:flutter/material.dart';
import 'package:kendua/auth/signin.dart';
import 'package:kendua/dashboard/dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _key = GlobalKey<FormState>();

  final ctrlname = TextEditingController();
  final ctrlemail = TextEditingController();
  final ctrlphonenumber = TextEditingController();
  final ctrlpassword = TextEditingController();
  final ctrlrepassword = TextEditingController();
  bool passwordoff = true;
  Icon passwordIcons = Icon(Icons.visibility_off);
  bool passwordreoff = true;
  Icon passwordRetypeIcon = Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff821515),
      appBar: AppBar(
        title: Text('Sign Up to continue'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/logo.png"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ctrlname,
                        validator: (val) {
                          if (val == "") {
                            return "Name Can't be empty";
                          } else if (val!.length < 4) {
                            return " Invalid name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ctrlemail,
                        validator: (val) {
                          if (val == "") {
                            return "Email Can't be empty";
                          } else if (val!.length < 13) {
                            return " Invalid email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                //changed
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctrlphonenumber,
                    validator: (val) {
                      if (val == "") {
                        return "Phone number Can't be empty";
                      } else if (val!.length < 11) {
                        return " Invalid number";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Phone Number",
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: passwordoff,
                    controller: ctrlpassword,
                    validator: (val) {
                      if (val == "") {
                        return "Password must be 6 character";
                      } else if (val!.length < 6) {
                        return " Invalid password";
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (passwordoff) {
                              passwordoff = false;
                              passwordIcons = Icon(Icons.visibility);
                            } else if (!passwordoff) {
                              passwordoff = true;
                              passwordIcons = Icon(Icons.visibility_off);
                            }
                          });
                        },
                        child: passwordIcons,
                      ),
                      hintText: "Enter your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: passwordreoff,
                    controller: ctrlrepassword,
                    validator: (val) {
                      if (val == "") {
                        return "Re-type password";
                      } else if (val!.length < 6) {
                        return "Re-type";
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (passwordreoff) {
                              passwordreoff = false;
                              passwordRetypeIcon = Icon(Icons.visibility);
                            } else if (!passwordreoff) {
                              passwordreoff = true;
                              passwordRetypeIcon =
                                  Icon(Icons.visibility_off);
                            }
                          });
                        },
                        child: passwordRetypeIcon,
                      ),
                      hintText: "Re-type your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      sinupfun(
                          ctrlname.text,
                          ctrlemail.text,
                          ctrlphonenumber.text,
                          ctrlpassword.text,
                          ctrlrepassword.text);
                    },
                    child: Text("Sign Up")),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have An Account ? "),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                )



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sinupfun(String name, email, phonenumber, password, retypepassword) {
    var isValid = _key.currentState!.validate();
    if (isValid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));

      print("database");
    } else {
      return;
    }
    _key.currentState!.save();
    //osman
  }
}
