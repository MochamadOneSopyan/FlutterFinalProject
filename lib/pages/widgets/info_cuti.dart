import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengajuan_cuti/pages/karyawan/karyawan.dart';

import 'package:intl/intl.dart';

// class InfoCuti extends StatefulWidget {
//   const InfoCuti({super.key});

//   @override
//   State<InfoCuti> createState() => _InfoCutiState();
// }

// class _InfoCutiState extends State<InfoCuti> {
//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection("users");
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 76, 175, 167),
//       appBar: AppBar(
//         title: Text('Leave Info'),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 14, 74, 133),
//                   Color.fromARGB(255, 120, 162, 226),
//                 ],
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight),
//           ),
//         ),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//           stream: users.doc(user!.uid).snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               DocumentSnapshot data = snapshot.data!;
//               return Padding(
//                 // padding: const EdgeInsets.all(10),
// padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
// child: Container(
//   decoration: BoxDecoration(
//       gradient: LinearGradient(
//           colors: [
//             Color.fromARGB(255, 16, 86, 133),
//             Color.fromARGB(137, 90, 157, 245)
//           ],
//           begin: FractionalOffset.topLeft,
//           end: FractionalOffset.bottomRight),
//       border:
//           Border.all(color: Colors.deepPurpleAccent, width: 3),
//       borderRadius: BorderRadius.circular(15)
//       // topRight: Radius.circular(50),
//       // bottomLeft: Radius.circular(50))
//       ),
//   // width: MediaQuery.of(context).size.width,
//   width: MediaQuery.of(context).size.width / 0.1,
//   height: MediaQuery.of(context).size.height / 4.5,
//   // padding: EdgeInsets.all(1),
//   padding: EdgeInsets.only(left: 15, top: 10),
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text('Name',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 50),
//                           Text(':',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 10),
//                           Text(data['name'],
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text('Email',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 53),
//                           Text(':',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 10),
//                           Text(data['email'],
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text('Start Date',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 21),
//                           Text(':',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 10),
//                           Text(data['tanggalawal'].toString(),
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text('End Date',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 29),
//                           Text(':',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 10),
//                           Text(data['tanggalakhir'].toString(),
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text('Description',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 12),
//                           Text(':',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 10),
//                           Text(data['keterangan'],
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text('Status',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 47),
//                           Text(':',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 10),
//                           Text(data['status'],
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16))
//                         ],
//                       ),
//                     ],
//                   ),
//                   // trailing: ,
//                 ),
//               );
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           }),
//     );
//   }
// }

class InfoCuti extends StatefulWidget {
  const InfoCuti({super.key});

  @override
  State<InfoCuti> createState() => _InfoCutiState();
}

class _InfoCutiState extends State<InfoCuti> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 175, 167),
      appBar: AppBar(
        title: Text('Leave Info'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Karyawan();
                  }),
                );
              },
              icon: Icon(Icons.home))
        ],
        automaticallyImplyLeading: false,
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
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: users.doc(user!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot data = snapshot.data!;

              String date = data['tanggalakhir'];
              String dateNow = DateTime.now().toString();
              // String dateNow = DateTime.now().split(" ")[0];

              print(date.split(" ")[0]);
              print(dateNow.split(" ")[0]);

              if (date.split(" ")[0] == dateNow.split(" ")[0]) {
                users.doc(user.uid).update({"status": "Pending"});
              }

              return Padding(
                padding: const EdgeInsets.only(right: 5, top: 20, left: 5),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 16, 86, 133),
                            Color.fromARGB(137, 90, 157, 245)
                          ],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight),
                      border:
                          Border.all(color: Colors.deepPurpleAccent, width: 2),
                      borderRadius: BorderRadius.circular(15)
                      // topRight: Radius.circular(50),
                      // bottomLeft: Radius.circular(50))
                      ),
                  // width: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width / 1.0,
                  height: MediaQuery.of(context).size.height / 3.5,
                  // padding: EdgeInsets.all(10),
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 13,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 80),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['name'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Email',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 83),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['email'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Start Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 48),
                          Text(' :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['tanggalawal'].split(" ")[0],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('End Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 56),
                          Text(' :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['tanggalakhir'].split(" ")[0],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Available Leave',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 6),
                          Text('  :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text('${data['jumlahCuti'].toString()} days',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Description',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 37),
                          Text('  :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['keterangan'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Status',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 76),
                          Text(' :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['status'],
                              style: TextStyle(
                                  color: data['status'] == 'Approved'
                                      ? Colors.green
                                      : data['status'] == 'Rejected'
                                          ? Colors.red
                                          : Colors.amber,
                                  fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  // trailing: ,
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
