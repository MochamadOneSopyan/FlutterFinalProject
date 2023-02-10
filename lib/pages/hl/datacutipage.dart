import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// class DataCutiPage extends StatefulWidget {
//   const DataCutiPage({Key? key}) : super(key: key);

//   @override
//   State<DataCutiPage> createState() => _DataCutiPageState();
// }

// class _DataCutiPageState extends State<DataCutiPage> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection("users");
//     return Scaffold(
//       // backgroundColor: Color(0xFF363567),
//       backgroundColor: Color.fromARGB(255, 76, 175, 167),
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         title: Text('History List Leave'),
//         centerTitle: true,
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
//       body: StreamBuilder(
//           stream: users.snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView(
//                   children: snapshot.data!.docs.map((document) {
//                 if (document['role']! == 'Karyawan') {
//                 } else {
//                   return Container();
//                 }
//                 return Padding(
// padding: const EdgeInsets.all(10),
// child: Container(
//   decoration: BoxDecoration(
//       gradient: LinearGradient(
//           colors: [
//             Color.fromARGB(255, 16, 86, 133),
//             Color.fromARGB(137, 90, 157, 245)
//           ],
//           begin: FractionalOffset.topLeft,
//           end: FractionalOffset.bottomRight),
//       border: Border.all(
//           color: Color.fromARGB(255, 16, 86, 133), width: 4),
//       borderRadius: BorderRadius.circular(15)),
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height / 4,
//   padding: EdgeInsets.all(8),

//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text('Name',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 50),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['name'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Email',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 53),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['email'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Start Date',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 21),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['tanggalawal'].toString(),
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('End Date',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 29),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['tanggalakhir'].toString(),
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Description',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 12),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['keterangan'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Status',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 47),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['status'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                       ],
//                     ),
//                     // trailing: ,
//                   ),
//                 );
//               }).toList());
//             } else {
//               return Text('Loading..');
//             }
//           }),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataCutiPage extends StatefulWidget {
  const DataCutiPage({Key? key}) : super(key: key);

  @override
  State<DataCutiPage> createState() => _DataCutiPageState();
}

class _DataCutiPageState extends State<DataCutiPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 175, 167),
      appBar: AppBar(
        title: const Text('Leave Data'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 16, 86, 133),
                  Color.fromARGB(137, 90, 157, 245)
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  if (data['role'] == "Karyawan") {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 5, top: 25, left: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 16, 86, 133),
                                  Color.fromARGB(137, 90, 157, 245)
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight),
                            border: Border.all(
                                color: Colors.deepPurpleAccent, width: 2),
                            borderRadius: BorderRadius.circular(15)
                            // topRight: Radius.circular(50),
                            // bottomLeft: Radius.circular(50))
                            ),
                        // width: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width / 1.0,
                        height: MediaQuery.of(context).size.height / 3.5,
                        // padding: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 13,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 80),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['name'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Email',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 83),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['email'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Start Date',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 48),
                                Text(' :',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['tanggalawal'].split(" ")[0],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('End Date',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 56),
                                Text(' :',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['tanggalakhir'].split(" ")[0],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Available Leave',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 6),
                                Text('  :',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text('${data['jumlahCuti'].toString()} days',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Description',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 37),
                                Text('  :',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['keterangan'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Status',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 76),
                                Text(' :',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
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
                    return Container();
                  }
                },
              );
            } else {
              return Text('Loading..');
            }
          }),
    );
  }
}
