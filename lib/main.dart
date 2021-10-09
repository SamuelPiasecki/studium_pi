import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/pages/login/forgotpassword.dart';
import 'package:studium_pi/pages/login/login_page.dart';
import 'package:studium_pi/provider/event_provider.dart';
import 'package:studium_pi/provider/meta_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<EventProvider>(
            create: (context) => EventProvider(),
          ),
          ChangeNotifierProvider<MetaProvider>(
            create: (context) => MetaProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Studium',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.grey[900],
              fontFamily: 'Rubik',
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Colors.indigo[800]),
            ),
            home: LoginPage(),
            routes: {
              'ForgotPassword.id': (context) => ForgotPassword(),
            }),
      );
}
