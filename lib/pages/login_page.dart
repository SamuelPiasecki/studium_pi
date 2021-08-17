import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/signin.dart';
import 'package:studium_pi/utilities/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Rubik',
            fontSize: 15.0,
          ),
        ),
        SizedBox(height: 5.0),
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
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Senha',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Rubik',
            fontSize: 15.0,
          ),
        ),
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
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Esqueceu sua senha?',
          style: sLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 100.0, //double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          elevation: 5.0,
          primary: Colors.white,
          onPrimary: Colors.indigo[300],
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSignInTxt() {
    return Column(
      children: [
        Text(
          '- OU -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.0),
        Text('Cadastre-se com', style: sLabelStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF6),
                  Color(0xFF6776D8),
                  Color(0xFF394ABD),
                  Color(0xFF162799),
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
                    'Studium',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  _buildEmailTF(),
                  SizedBox(height: 10.0),
                  _buildPasswordTF(),
                  _buildForgotPasswordBtn(),
                  _buildLoginBtn(),
                  _buildSignInTxt(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Botão do Facebook
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage('assets/logos/facebook.jpg'),
                              ),
                            ),
                          ),
                        ),
                        //Botão do Google
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/logos/google-logo.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInPage()))
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Não possui uma conta? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                            text: 'Cadastre-se',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                            )),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
