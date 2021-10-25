import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/api/fire_auth.dart';
import 'package:studium_pi/pages/home/home.dart';
import 'package:studium_pi/pages/login/forgotpassword.dart';
import 'package:studium_pi/pages/login/signup.dart';
import 'package:studium_pi/utilities/constants.dart';
import 'package:studium_pi/utilities/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }

    return firebaseApp;
  }

  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;
  bool _obscurePassword = true;

  Widget _buildEmailTF() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: sBoxDecorationStyle,
      child: TextFormField(
        controller: _emailTextController,
        focusNode: _focusEmail,
        style: TextStyle(color: Colors.white),
        validator: (value) => Validator.validateEmail(email: value!),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white,
          ),
          hintText: "Email",
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
    );
  }

  Widget _buildPasswordTF() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: sBoxDecorationStyle,
      child: TextFormField(
        controller: _passwordTextController,
        focusNode: _focusPassword,
        obscureText: _obscurePassword,
        style: TextStyle(color: Colors.white),
        validator: (value) => Validator.validatePassword(
          password: value!,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.white),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          hintText: "Senha",
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
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ForgotPassword(),
          ),
        ),
        child: Text(
          'Esqueceu sua senha?',
          style: sLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginAndSignInBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              _focusEmail.unfocus();
              _focusPassword.unfocus();

              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isProcessing = true;
                });

                User? user = await FireAuth.signInUsingEmailPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
                );

                setState(() {
                  _isProcessing = false;
                });

                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                }
              }
            },
            style: buttonStyle,
            child: Text(
              'Login',
              style: textStyleButton,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            style: buttonStyle,
            child: Text(
              'Sign Up',
              style: textStyleButton,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text('Studium',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/icon/icon_app.png',
                            fit: BoxFit.fill),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            _buildEmailTF(),
                            SizedBox(height: 15.0),
                            _buildPasswordTF(),
                            _buildForgotPasswordBtn(),
                            SizedBox(height: 24.0),
                            _isProcessing
                                ? CircularProgressIndicator()
                                : _buildLoginAndSignInBtn(),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
