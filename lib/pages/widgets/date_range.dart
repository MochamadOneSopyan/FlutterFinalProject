import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengajuan_cuti/pages/widgets/info_cuti.dart';
import 'package:intl/intl.dart';

// class DateRange extends StatefulWidget {
//   const DateRange({super.key});

//   @override
//   State<DateRange> createState() => _DateRangeState();
// }

// const List<String> list = <String>['Melahirkan', 'Tahunan'];

// class _DateRangeState extends State<DateRange> {
//   String dropdownvalue = list.first;
//   DateTimeRange dateRange = DateTimeRange(
//     start: DateTime.now(),
//     end: DateTime.now(),
//   );

//   List dropDownListData = [
//     {"title": "Cuti Tahunan", "value": "1"},
//     {"title": "Cuti Melahirkan", "value": "2"},
//   ];

//   String defaultValue = "";
//   String secondDropDown = "";

//   @override
//   Widget build(BuildContext context) {
//     DateTime tanggalawal = dateRange.start;
//     DateTime tanggalakhir = dateRange.end;
//     final startDate = dateRange.start;
//     final endDate = dateRange.end;
//     final difference = dateRange.duration;
//     TextEditingController dateform =
//         TextEditingController(text: DateFormat('dd-MM-yyyy').format(startDate));
//     TextEditingController dateto =
//         TextEditingController(text: DateFormat('dd-MM-yyyy').format(endDate));

//     User? user = FirebaseAuth.instance.currentUser;

//     final TextEditingController keterangan = TextEditingController();

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 244, 254, 253),
//       appBar: AppBar(
//         title: Text('Pengajuan Cuti'),
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
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Pilih Tanggal Cuti',
//                 style: TextStyle(fontSize: 32),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       // child: Text(DateFormat('yyy/MM/dd').format(tanggalawal)),
//                       child: Text(DateFormat('dd/MM/yyyy').format(tanggalawal)),
//                       onPressed: pickDateRange,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 'Tanggal Cuti Yang Dipilih: ${difference.inDays} hari',
//                 style: TextStyle(fontSize: 20),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 'Jumlah Cuti 12 hari',
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: dateform,
//                 decoration: InputDecoration(
//                   enabled: false,
//                   border: OutlineInputBorder(),
//                   // hintText: DateFormat('yyyy/MM/dd').format(tanggalawal),
//                   hintText: DateFormat('dd/MM/yyyy').format(tanggalawal),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: dateto,
//                 decoration: InputDecoration(
//                   enabled: false,
//                   border: OutlineInputBorder(),
//                   // hintText: DateFormat('yyyy/MM/dd').format(tanggalakhir),
//                   hintText: DateFormat('dd/MM/yyyy').format(tanggalakhir),
//                 ),
//               ),
//               SizedBox(
//                 height: 3,
//               ),
//               // InputDecorator(
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(15.0)),
//               //     contentPadding: const EdgeInsets.all(10),
//               //   ),
//               //   child: DropdownButtonHideUnderline(
//               //     child: DropdownButton<String>(
//               //         isDense: true,
//               //         value: secondDropDown,
//               //         isExpanded: true,
//               //         menuMaxHeight: 350,
//               //         items: [
//               //           const DropdownMenuItem(
//               //               child: Text(
//               //                 "Status Cuti",
//               //               ),
//               //               value: ""),
//               //           ...dropDownListData
//               //               .map<DropdownMenuItem<String>>((data) {
//               //             return DropdownMenuItem(
//               //                 child: Text(data['title']), value: data['value']);
//               //           }).toList(),
//               //         ],
//               //         onChanged: (value) {
//               //           print("selected Value $value");
//               //           setState(() {
//               //             secondDropDown = value!;
//               //           });
//               //         }),
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: keterangan,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Keterangan',
//                   // labelText: 'Alasan',
//                 ),
//                 maxLines: 3,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     CollectionReference addData =
//                         FirebaseFirestore.instance.collection('users');
//                     await addData.doc(user!.uid).update({
//                       "tanggalawal": tanggalawal.toString(),
//                       "tanggalakhir": tanggalakhir.toString(),
//                       "keterangan": keterangan.text,
//                     });
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return InfoCuti();
//                         // InfoCuti();
//                       },
//                     ));
//                   },
//                   child: const Text("Submit")),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future pickDateRange() async {
//     DateTimeRange? newDateRange = await showDateRangePicker(
//       context: context,
//       initialDateRange: dateRange,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (newDateRange == null) {
//       return;
//     } else {
//       if (newDateRange.duration.inDays >= 12) {
//         return showDialog<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Warning!'),
//               content: const Text(
//                   'Maaf batas cuti hanya dapat di lakukan maksimal 12 hari'),
//               actions: <Widget>[
//                 TextButton(
//                   style: TextButton.styleFrom(
//                     textStyle: Theme.of(context).textTheme.labelLarge,
//                   ),
//                   child: const Text('Ok'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         setState(
//           () => dateRange = newDateRange,
//         );
//       }
//     }
//   }
// }

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

FirebaseFirestore users = FirebaseFirestore.instance;

class _DateRangeState extends State<DateRange> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  Stream streamUser() async* {
    yield* users
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    DateTime tanggalawal = dateRange.start;
    DateTime tanggalakhir = dateRange.end;
    final startDate = dateRange.start;
    final endDate = dateRange.end;
    final difference = dateRange.duration;
    TextEditingController dateform =
        TextEditingController(text: DateFormat('dd-MM-yyyy').format(startDate));
    TextEditingController dateto =
        TextEditingController(text: DateFormat('dd-MM-yyyy').format(endDate));
    final TextEditingController keterangan = TextEditingController();

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 29, 70, 141),
      appBar: AppBar(
        title: Text('Pengajuan Cuti'),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 74, 133),
                  Color.fromARGB(255, 120, 162, 226)
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        // physics: BouncingScrollPhysics(),
        child: StreamBuilder(
            stream: streamUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                var usersData = snapshot.data!.data();
                return Container(
                  // padding: EdgeInsets.all(20),
                  padding: EdgeInsets.only(
                      bottom: 120, top: 50, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Select Leave Date',
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text(
                                  DateFormat('dd/MM/yyyy').format(tanggalawal)),
                              onPressed: pickDateRange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Selected leave date : ${difference.inDays + 1} days',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Total leave of ${usersData["jumlahCuti"].toString()} days',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: dateform,
                        decoration: InputDecoration(
                            enabled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText:
                                DateFormat('dd/MM/yyyy').format(tanggalawal),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: dateto,
                        decoration: InputDecoration(
                            enabled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText:
                                DateFormat('dd/MM/yyyy').format(tanggalakhir),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: keterangan,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Description',
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            CollectionReference addData =
                                FirebaseFirestore.instance.collection('users');
                            await addData.doc(user!.uid).update({
                              "tanggalawal": tanggalawal.toString(),
                              "tanggalakhir": tanggalakhir.toString(),
                              "keterangan": keterangan.text,
                              "jumlahCuti": usersData["jumlahCuti"],
                              "status": "Pending"
                            });
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return InfoCuti();
                                // InfoCuti();
                              },
                            ));
                          },
                          child: const Text("Submit")),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) {
      return;
    } else {
      if (newDateRange.duration.inDays >= 12) {
        return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const Text(
                  'Sorry, the leave limit can only be done for a maximum of 12 days'),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        setState(
          () => dateRange = newDateRange,
        );
      }
    }
  }
}
