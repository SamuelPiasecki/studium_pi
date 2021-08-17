import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/home/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:studium_pi/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: auth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                Object? user = snapshot.data;

                if (user == null) {
                  return LoginPage();
                } else {
                  return Home();
                }
              }
              return Scaffold(
                body: Center(
                  child: Text('Checking authentication'),
                ),
              );
            },
          );
        }

        return Scaffold(
          body: Center(
            child: Text('Connecting to the app...'),
          ),
        );
      },
    );
  }
}
