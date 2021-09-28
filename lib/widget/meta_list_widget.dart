import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/meta.dart';
import 'package:studium_pi/provider/meta_provider.dart';
import 'package:studium_pi/widget/meta_widget.dart';

class MetaListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MetaProvider>(context);
    final metas = provider.metas;

    return metas.isEmpty
        ? Center(
            child: Text(
              'Sem metas. ',
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