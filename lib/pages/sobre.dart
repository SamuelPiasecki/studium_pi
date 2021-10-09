import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Sobre'),
      centerTitle: true,
      backgroundColor: Colors.indigo[800],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.0),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.info_outline, size: 20),
                  ),
                  TextSpan(
                    text: " Sobre nós",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              '   O aplicativo Studium foi desenvolvido pelos estudantes Luis Eduardo Prado, Tales Miller e Samuel Piasecki do curso de Ciência da Computação da UNICENTRO. Ele foi criado como parte de um Projeto Integrador, envolvendo as disciplinas de Engenharia de Software, Banco de Dados, e IHC (Interação Humano-Computador).',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.account_box_outlined, size: 20),
                  ),
                  TextSpan(
                    text: " Contate-nos",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              '   Caso queira nos dar algum feedback pode entrar em contato com a nossa equipe pelos seguintes meios:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.mail_outline, size: 20),
                  ),
                  TextSpan(
                    text: " talesm56@gmail.com",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.mail_outline, size: 20),
                  ),
                  TextSpan(
                    text: " samupiasecki@gmail.com",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.mail_outline, size: 20),
                  ),
                  TextSpan(
                      text: " luisedp56@gmail.com",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ],
              ),
            ),
            /*
            TextButton(
              child: Text('Email Samuel'),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('Email Tales'),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('Email Arapoti'),
              onPressed: () {},
            ),*/
          ],
        ),
      ),
    );
  }
}
