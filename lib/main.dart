import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_pengajuan_cuti/pages/hk/c_page.dart';
import 'package:flutter_pengajuan_cuti/pages/hk/home_kar.dart';
import 'package:flutter_pengajuan_cuti/pages/hl/homepage.dart';
import 'package:flutter_pengajuan_cuti/pages/karyawan/ajukan_cuti.dart';
import 'package:flutter_pengajuan_cuti/pages/karyawan/karyawan.dart';
import 'package:flutter_pengajuan_cuti/pages/log/login_page.dart';
import 'package:flutter_pengajuan_cuti/pages/log/register.dart';
import 'package:flutter_pengajuan_cuti/pages/widgets/info_cuti.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: LoginPage(),
    );
  }
}
