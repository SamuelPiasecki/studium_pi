import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studium_pi/pages/disciplina/view_disciplina.dart';
import 'package:studium_pi/pages/professores/professor_page.dart';
import 'package:studium_pi/pages/sobre.dart';
import 'package:studium_pi/pages/login/login_page.dart';
import 'package:studium_pi/pages/metas/meta_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.grey[700],
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 30),
          ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                minHeight: 50,
                maxWidth: 50,
                maxHeight: 50,
              ),
              child: Image.asset('assets/icon/icon_app.png', fit: BoxFit.cover),
            ),
            title: Text('Studium',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
              leading: Icon(Icons.class_, color: Colors.white),
              title: Text('Disciplinas',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewDisciplina()))
                  }),
          ListTile(
              leading: Icon(Icons.account_circle, color: Colors.white),
              title: Text('Professores',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfessorPage()))
                  }),
          ListTile(
              leading: Icon(Icons.fact_check_outlined, color: Colors.white),
              title: Text('Metas',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MetaPage()))
                  }),
          Divider(color: Colors.white),
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
