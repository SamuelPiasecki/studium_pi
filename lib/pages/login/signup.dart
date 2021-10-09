import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/api/fire_auth.dart';
import 'package:studium_pi/pages/home/home.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/utilities/validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: colorAppBar,
      ),
      backgroundColor: Colors.grey[800],
      body: Stack(children: [
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Digitar o seu nome
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: sBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          controller: _nameTextController,
                          style: TextStyle(color: Colors.white),
                          validator: (value) =>
                              Validator.validateName(name: value!),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.account_box,
                              color: Colors.white,
                            ),
                            hintText: 'Digite seu Nome',
                            hintStyle: sHintTextStyle,
                            errorStyle: TextStyle(fontSize: 16),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  //Digitar o email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: sBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          controller: _emailTextController,
                          validator: (value) =>
                              Validator.validateEmail(email: value!),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Digite seu Email',
                            hintStyle: sHintTextStyle,
                            errorStyle: TextStyle(fontSize: 16),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
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
                            child: TextFormField(
                              controller: _passwordTextController,
                              obscureText: _obscurePassword,
                              style: TextStyle(color: Colors.white),
                              validator: (value) =>
                                  Validator.validatePassword(password: value!),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.white),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                hintText: 'Digite sua Senha',
                                hintStyle: sHintTextStyle,
                                errorStyle: TextStyle(fontSize: 16),
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
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
                            child: TextFormField(
                              obscureText: _obscureConfirm,
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Esse campo é necessário. ';
                                }
                                if (value != _passwordTextController.text) {
                                  return 'As senhas não correspondem. ';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirm
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureConfirm = !_obscureConfirm;
                                    });
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: 'Confirme sua Senha',
                                hintStyle: sHintTextStyle,
                                errorStyle: TextStyle(fontSize: 16),
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
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
                          onPressed: () async {
                            setState(() {
                              _isProcessing = true;
                            });

                            if (_registerFormKey.currentState!.validate()) {
                              User? user =
                                  await FireAuth.registerUsingEmailPassword(
                                name: _nameTextController.text,
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );

                              setState(() {
                                _isProcessing = false;
                              });

                              if (user != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                  ModalRoute.withName('/'),
                                );
                              }
                            }
                          },
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
        ),
      ]),
    );
  }
}
