import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ListCuti extends StatefulWidget {
  const ListCuti({Key? key}) : super(key: key);

  @override
  State<ListCuti> createState() => _ListCutiState();
}

class _ListCutiState extends State<ListCuti> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 175, 167),
      appBar: AppBar(
        title: Text('List Leave'),
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
                    if (data['status'] == 'Rejected' ||
                        data['status'] == 'Approved') {
                      return Container();
                    }

                    return Padding(
                      padding: const EdgeInsets.all(10),
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
                                color: Colors.deepPurpleAccent, width: 3),
                            borderRadius: BorderRadius.circular(15)
                            // topRight: Radius.circular(50),
                            // bottomLeft: Radius.circular(50))
                            ),
                        // width: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width / 1.0,
                        height: MediaQuery.of(context).size.height / 3.5,
                        // padding: EdgeInsets.all(10),
                        padding: EdgeInsets.only(top: 15, left: 13),

                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 50),
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
                                SizedBox(width: 53),
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
                                SizedBox(width: 21),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['tanggalawal'].toString(),
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
                                SizedBox(width: 29),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['tanggalakhir'].toString(),
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
                                SizedBox(width: 12),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['keterangan'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      users
                                          .doc(data.id)
                                          .update({"status": "Approved"});
                                    },
                                    child: Text(
                                      'Approve',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: new ElevatedButton(
                                    onPressed: () {
                                      users
                                          .doc(data.id)
                                          .update({"status": "Rejected"});
                                    },
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                    ),
                                  ),
                                )
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
