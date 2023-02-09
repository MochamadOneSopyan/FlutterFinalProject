import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengajuan_cuti/pages/hl/datacutipage.dart';
import 'package:flutter_pengajuan_cuti/pages/hl/list_cuti.dart';

import 'package:flutter_pengajuan_cuti/pages/hrd/kalendar_admin.dart';
import 'package:flutter_pengajuan_cuti/pages/hrd/profil.dart';
import 'package:flutter_pengajuan_cuti/pages/karyawan/kalender_user.dart';
import 'package:flutter_pengajuan_cuti/pages/log/login_page.dart';

class HRD extends StatefulWidget {
  const HRD({super.key});

  @override
  State<HRD> createState() => _HRDState();
}

class _HRDState extends State<HRD> {
  final users = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 175, 167),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("Human Resource Development"),
        title: Text('Human Resource Development'),
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
                          color: Color.fromARGB(255, 79, 128, 201),
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
                                    "Hi Admin",
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
                                // "Yans Piyan",
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
                                "",
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
                                        return ListCuti();
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
                                            const EdgeInsets.only(top: 12.0),
                                        child: Text(
                                          // "Sisa Cuti : 7",
                                          'Daftar Cuti',
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
                                          "Calendar",
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

                            Flexible(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    // print("cuti");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return DataCutiPage();
                                      }),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Spacer(),
                                      // SizedBox(height: 10,),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "      Data\nEmployees",
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



// class HrdPage extends StatefulWidget {
//   const HrdPage({super.key});

//   @override
//   State<HrdPage> createState() => _HrdPageState();
// }

// class _HrdPageState extends State<HrdPage> {
 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
     
      
//     );
//   }
// }
