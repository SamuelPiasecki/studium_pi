import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/provider/meta_provider.dart';
import 'package:studium_pi/widget/metas_widget/meta_widget.dart';

class CompletasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MetaProvider>(context);
    final metas = provider.metasCompletas;

    return metas.isEmpty
        ? Center(
            child: Text(
              'Sem metas completas. ',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: metas.length,
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 8),
            itemBuilder: (context, index) {
              final meta = metas[index];
              return MetaWidget(meta: meta);
            },
          );
  }
}
