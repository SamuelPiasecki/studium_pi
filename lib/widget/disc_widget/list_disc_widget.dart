import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/provider/disc_provider.dart';
import 'package:studium_pi/widget/disc_widget/disc_widget.dart';

class DiscListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DiscProvider>(context);
    final disciplinas = provider.disciplinas;
    return disciplinas.isEmpty
        ? Center(
            child: Text(
              'Sem disciplinas. ',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            itemBuilder: (context, index) {
              final disc = disciplinas[index];
              return DiscWidget(disc: disc);
            },
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 8),
            itemCount: disciplinas.length);
  }
}
