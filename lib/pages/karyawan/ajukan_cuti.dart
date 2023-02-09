import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AjukanCuti extends StatefulWidget {
  const AjukanCuti({super.key});

  @override
  State<AjukanCuti> createState() => _AjukanCutiState();
}

class _AjukanCutiState extends State<AjukanCuti> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan Cuti'),
      ),
      // body: Form(
      //     key: _formKey,
      //     child: SingleChildScrollView(
      //       child: Container(
      //         padding: EdgeInsets.all(20.0),
      //         child: Column(
      //           children: [
      //             TextFormField(
      //               autofocus: true,
      //               decoration: new InputDecoration(
      //                 hintText: "Username",
      //                 labelText: "Nama Lengkap",
      //                 icon: Icon(Icons.people),
      //                 border: OutlineInputBorder(
      //                     borderRadius: new BorderRadius.circular(5.0)),
      //               ),
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Nama tidak boleh kosong';
      //                 }
      //                 return null;
      //               },
      //             ),
      //             SizedBox(
      //               height: 10.0,
      //             ),
      //             TextFormField(
      //               autofocus: true,
      //               decoration: new InputDecoration(
      //                 hintText: "07 Agustus 2023",
      //                 labelText: "Tangal mulai cuti",
      //                 icon: Icon(Icons.date_range_sharp),
      //                 border: OutlineInputBorder(
      //                     borderRadius: new BorderRadius.circular(5.0)),
      //               ),
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Tanggal tidak boleh kosong';
      //                 }
      //                 return null;
      //               },
      //             ),
      //             SizedBox(
      //               height: 10.0,
      //             ),
      //             TextFormField(
      //               autofocus: true,
      //               decoration: new InputDecoration(
      //                 hintText: "10 Agustus 2023",
      //                 labelText: "Tanggal selesai cuti",
      //                 icon: Icon(Icons.date_range_sharp),
      //                 border: OutlineInputBorder(
      //                     borderRadius: new BorderRadius.circular(5.0)),
      //               ),
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Tanggal tidak boleh kosong';
      //                 }
      //                 return null;
      //               },
      //             ),
      //             SizedBox(
      //               height: 10.0,
      //             ),
      //             TextFormField(
      //               autofocus: true,
      //               decoration: new InputDecoration(
      //                 hintText: "Alasan",
      //                 labelText: "Keterangan",
      //                 icon: Icon(Icons.warning_amber_rounded),
      //                 border: OutlineInputBorder(
      //                     borderRadius: new BorderRadius.circular(5.0)),
      //               ),
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Isi alasan';
      //                 }
      //                 return null;
      //               },
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 16.0),
      //               child: ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                     shadowColor: Colors.lightBlue,
      //                     elevation: 3,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(50),
      //                     ),
      //                     minimumSize: Size(200, 40)),
      //                 onPressed: () {
      //                   if (_formKey.currentState!.validate()) {
      //                     ScaffoldMessenger.of(context).showSnackBar(
      //                       const SnackBar(
      //                           content: Text('Data sedang di proses...')),
      //                     );
      //                   }
      //                 },
      //                 child: Text(
      //                   'Ajukan Cuti',
      //                 ),
      //               ),
      //             )
      //             // ElevatedButton(
      //             //   child: Text(
      //             //     'Ajukan Cuti',
      //             //     style: TextStyle(color: Colors.white),
      //             //   ),
      //             // )
      //           ],
      //         ),
      //       ),
      //     ),
      //     ),
    );
  }
}
