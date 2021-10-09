import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String? email;

  passwordReset() async {
    try {
      _formKey.currentState!.save();
      final user = await auth.sendPasswordResetEmail(email: email!);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Crie uma nova senha'),
          centerTitle: true,
          backgroundColor: colorAppBar),
      backgroundColor: Colors.grey[800],
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  'Para criar uma nova senha, digite seu email no campo abaixo',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  onSaved: (newEmail) {
                    email = newEmail;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    errorStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Envie Email', style: textStyleButton),
                  style: buttonStyle,
                  onPressed: () {
                    passwordReset();
                    print(email);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Email enviado'),
                            content: Text(
                                'Um email foi enviado para você, clique no link oferecido para recuperar sua senha. '),
                          );
                        });
                  },
                ),
              ],
            ),
          )),
    );
  }
}
