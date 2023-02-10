import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pengajuan_cuti/pages/hrd/hrd.dart';
import 'package:flutter_pengajuan_cuti/pages/karyawan/karyawan.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 76, 175, 167),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       colors: [Colors.blue, Colors.grey],
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight),
              // ),
              // color: Colors.blueGrey[700],
              color: Color.fromARGB(255, 76, 175, 167),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.70,
              height: MediaQuery.of(context).size.height * 1,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Welcome back",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/signup.svg",
                            width: 150,
                            // height:
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            " you've been missed!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 221, 243, 254),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 18, 131, 146),
                              ),

                              // iconColor: Colors.red,
                              hintText: 'Email',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Email cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email");
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isObscure3,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure3
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure3 = !_isObscure3;
                                    });
                                  }),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromARGB(255, 18, 131, 146)),
                              hintText: 'Password',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              }
                              if (!regex.hasMatch(value)) {
                                return ("please enter valid password min. 6 character");
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          MaterialButton(
                            minWidth: 430.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            elevation: 5.0,
                            height: 40,
                            onPressed: () {
                              setState(() {
                                visible = true;
                              });
                              signIn(emailController.text,
                                  passwordController.text);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                            color: Color.fromARGB(255, 107, 169, 231),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            minWidth: 430.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            elevation: 5.0,
                            height: 40,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            color: Color.fromARGB(255, 17, 227, 161),
                            child: Text(
                              "Register Now",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     Text(
                          //       "Don't have an Account?",
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         color: Color.fromARGB(255, 221, 243, 254),
                          //         fontSize: 15,
                          //       ),
                          //     ),
                          //     Container(
                          //       child: GestureDetector(
                          //         onTap: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(builder: (context) {
                          //               return Register();
                          //             }),
                          //           );
                          //         },
                          //         child: Text(
                          //           " Register Now!",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             color: Color.fromARGB(255, 22, 65, 128),
                          //             fontSize: 15,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   width: MediaQuery.of(context).size.width,
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         SizedBox(
            //           height: 20,
            //         ),
            //         MaterialButton(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(20.0),
            //             ),
            //           ),
            //           elevation: 5.0,
            //           height: 40,
            //           onPressed: () {
            //             Navigator.pushReplacement(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => Register(),
            //               ),
            //             );
            //           },
            //           color: Colors.blue[900],
            //           child: Text(
            //             "Register Now",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 20,
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           height: 15,
            //         ),
            //         Text(
            //           "Made by",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 40,
            //           ),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Patient",
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30,
            //                 color: Colors.blue[900],
            //               ),
            //             ),
            //             Text(
            //               "Yoms", // name
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30,
            //                 color: Colors.yellowAccent[400],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            //
            // Container(
            //   color: Color.fromARGB(255, 76, 175, 167),
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   child: Column(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       // SizedBox(
            //       //   height: 20,
            //       // ),
            //       Text(
            //         "Don't have an Account?",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            // MaterialButton(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(20.0),
            //     ),
            //   ),
            //   elevation: 5.0,
            //   height: 40,
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Register(),
            //       ),
            //     );
            //   },
            //   color: Color.fromARGB(255, 22, 65, 128),
            //   child: Text(
            //     "Register Now",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            //       // SizedBox(
            //       //   height: 5,
            //       // ),
            //       // Row(
            //       //   mainAxisAlignment: MainAxisAlignment.center,
            //       //   children: [
            //       //     Text(
            //       //       "De",
            //       //       style: TextStyle(
            //       //         fontWeight: FontWeight.bold,
            //       //         fontSize: 30,
            //       //         color: Colors.blue[900],
            //       //       ),
            //       //     ),
            //       //     Text(
            //       //       "FUN",
            //       //       style: TextStyle(
            //       //         fontWeight: FontWeight.bold,
            //       //         fontSize: 30,
            //       //         color: Colors.yellowAccent[400],
            //       //       ),
            //       //     ),
            //       //   ],
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "HRD") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HRD(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Karyawan(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
