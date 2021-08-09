import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/home/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:studium_pi/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.indigo[800],
        fontFamily: 'Rubik',
      ),
      home: LoginPage(),
    );
  }
}
