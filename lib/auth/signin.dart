import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kendua/admin/admindashboard.dart';
import 'package:kendua/auth/signup.dart';
import 'package:kendua/dashboard/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _key = GlobalKey<FormState>();
  final ctrlemail = TextEditingController();
  final ctrlpass = TextEditingController();
  bool passwordOff = true;
  Icon passwordIcon = Icon(Icons.visibility_off);

  String adminEmail = "admin@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In to continue'),
        ),
        body: FutureBuilder(
          future: firebaseinit(),
            builder:
            (context, info) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("images/logo.png"),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .40,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: ctrlemail,
                            validator: (val) {
                              if (val == "") {
                                return "Email Can't be empty";
                              } else if (val!.length < 13) {
                                return "invalid email";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: passwordOff,
                            controller: ctrlpass,
                            validator: (val) {
                              if (val == "") {
                                return "password Can't be empty";
                              } else if (val!.length < 6) {
                                return "Password must be 6 character";
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (passwordOff) {
                                      passwordOff = false;
                                      passwordIcon = Icon(Icons.visibility);
                                    } else if (!passwordOff) {
                                      passwordOff = true;
                                      passwordIcon = Icon(Icons.visibility_off);
                                    }
                                  });
                                },
                                child: passwordIcon,
                              ),
                              hintText: "Enter your password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              signinfun(ctrlemail.text, ctrlpass.text);
                            },
                            child: Text("Sign In")),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Create An Account ? "),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    "Sign Up",
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
          );
        }));
  }

  signinfun(String email, password)async {
    var isValid = _key.currentState!.validate();
    if (isValid) {
       FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential  userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);


      if(userCredential.user != null){

        if(adminEmail==auth.currentUser!.email){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminDashboard()));
        }else{
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }

      }
    } else {
      return;
    }
    _key.currentState!.save();
  }

  Future<FirebaseApp> firebaseinit() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
