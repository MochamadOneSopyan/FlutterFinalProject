import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pengajuan_cuti/pages/karyawan/kalender_user.dart';
import 'package:flutter_pengajuan_cuti/pages/log/login_page.dart';
import 'package:flutter_pengajuan_cuti/pages/widgets/date_range.dart';
import 'package:flutter_pengajuan_cuti/pages/widgets/info_cuti.dart';

class Karyawan extends StatefulWidget {
  const Karyawan({super.key});

  @override
  State<Karyawan> createState() => _KaryawanState();
}

class _KaryawanState extends State<Karyawan> {
  final users = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 175, 167),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("Karyawan"),
        // backgroundColor: Colors.blueGrey,
        title: Text('Employees'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 74, 133),
                  Color.fromARGB(255, 120, 162, 226),
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(users.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                DocumentSnapshot data = snapshot.data!;
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 70, 120, 145),
                          color: Color.fromARGB(255, 38, 117, 156),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hi User",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.check_box,
                                      size: 24, color: Colors.lightBlue),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, top: 20, bottom: 5),
                                child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 93, 39, 165),
                                    radius: 30),
                              ),
                              Text(
                                // 'Yans Piyan',
                                data['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // Text("yanspiyan272@gmail.com"),
                              Text(
                                users.email!,
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                // "2204016",
                                ('Sisa Cuti : ' +
                                    data['jumlahCuti'].toString()),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 100,
                                width: 130,
                                child: GestureDetector(
                                  onTap: () {
                                    // print("sisa cuti");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return DateRange();
                                      }),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.call_made,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          // "Sisa Cuti : 7",
                                          "Pengajuan\n      Cuti",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 41, 236, 142),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 6,
                            // ),
                            Flexible(
                              child: Container(
                                height: 100,
                                width: 130,
                                child: GestureDetector(
                                  onTap: () {
                                    // print("kalender");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return Calendar();
                                      }),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.calendar_month_sharp,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: Text(
                                          "Kalender",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 34, 200, 226),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 6,
                            // ),
                            Flexible(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    // print("cuti");
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return InfoCuti();
                                    }));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          // Icons.add_circle_outline,
                                          Icons.info,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Spacer(),
                                      // SizedBox(height: 10,),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: Text(
                                          "Info Cuti",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 146, 210, 28),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
