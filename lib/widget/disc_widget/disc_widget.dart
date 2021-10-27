import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/disciplina.dart';
import 'package:studium_pi/pages/disciplina/disciplina_page.dart';
import 'package:studium_pi/provider/disc_provider.dart';

class DiscWidget extends StatelessWidget {
  final Disciplina disc;
  const DiscWidget({required this.disc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final week = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(disc.id),
        actions: [
          IconSlideAction(
            color: Colors.blue[600],
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisciplinaPage(disc: disc))),
            caption: 'Editar',
            icon: Icons.edit,
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red[700],
            caption: 'Deletar',
            onTap: () {
              final provider =
                  Provider.of<DiscProvider>(context, listen: false);
              provider.deleteDisc(disc);
            },
            icon: Icons.delete,
          ),
        ],
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                disc.nome,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < 7; i++)
                      if (disc.weekDays[i] == false)
                        Text(
                          week[i],
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      else
                        Text(
                          week[i],
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text('Início: ${DateFormat.Hm().format(disc.startTime)}',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Fim: ${DateFormat.Hm().format(disc.endTime)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
