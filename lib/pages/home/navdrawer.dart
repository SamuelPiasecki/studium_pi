import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/disciplina.dart';
import 'package:studium_pi/pages/home/config.dart';
import 'package:studium_pi/pages/sobre.dart';
import 'package:studium_pi/pages/login/login_page.dart';
import 'package:studium_pi/pages/meta_page.dart';
import 'package:studium_pi/pages/nota.dart';
import 'package:studium_pi/pages/professor.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.grey[700],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 75.0,
            child: DrawerHeader(
                child: Text('Studium',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                ),
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(0.0)),
          ),
          ListTile(
              title: Text('Disciplinas',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Disciplina()))
                  }),
          ListTile(
              title: Text('Professores',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Professor()))
                  }),
          ListTile(
              title: Text('Metas',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MetaPage()))
                  }),
          ListTile(
              title: Text('Notas',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Nota()))
                  }),
          Divider(color: Colors.white),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Configurações',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Config()))
                  }),
          ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('Sobre',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sobre()))
                  }),
          ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () async => {
                    await FirebaseAuth.instance.signOut(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()))
                  }),
        ],
      ),
    ));
  }
}
