import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/utilities/constants.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String _email;
  late String _password;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF162799),
                Color(0xFF394ABD),
                Color(0xFF6776D8),
                Color(0xFF73AEF6),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cadastro',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Rubik',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50.0),
                //Digitar o email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: sBoxDecorationStyle,
                      height: 60.0,
                      child: TextField(
                        onChanged: (value) {
                          _email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Digite seu Email',
                          hintStyle: TextStyle(color: Colors.blue[100]),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                //Digitar novamente o email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: sBoxDecorationStyle,
                      height: 60.0,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Confirme seu Email',
                          hintStyle: TextStyle(color: Colors.blue[100]),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    //Digitar senha
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: sBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            onChanged: (value) {
                              _password = value;
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Digite sua Senha',
                              hintStyle: sHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    //Digitar novamente senha
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: sBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Confirme sua Senha',
                              hintStyle: sHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Botão do Cadastro
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: ElevatedButton(
                        onPressed: _createUser,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10.0),
                          elevation: 5.0,
                          primary: Colors.white,
                          onPrimary: Colors.indigo[300],
                        ),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
