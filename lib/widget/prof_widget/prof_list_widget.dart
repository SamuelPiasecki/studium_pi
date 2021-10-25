import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/provider/prof_provider.dart';
import 'package:studium_pi/widget/prof_widget/prof_widget.dart';

class ProfListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfProvider>(context);
    final profs = provider.profs;

    return profs.isEmpty
        ? Center(
            child: Text(
              'Sem professores. ',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: profs.length,
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 8),
            itemBuilder: (context, index) {
              final prof = profs[index];
              return ProfWidget(prof: prof);
            },
          );
  }
}
