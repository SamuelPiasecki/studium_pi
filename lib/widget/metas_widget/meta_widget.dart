import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/meta.dart';
import 'package:studium_pi/pages/edit_meta_page.dart';
import 'package:studium_pi/provider/meta_provider.dart';
import 'package:studium_pi/utilities/utils.dart';

class MetaWidget extends StatelessWidget {
  final Meta meta;

  const MetaWidget({
    required this.meta,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(meta.id),
          actions: [
            IconSlideAction(
              color: Colors.blue[600],
              onTap: () => editMeta(context, meta),
              caption: 'Editar',
              icon: Icons.edit,
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red[700],
              caption: 'Deletar',
              onTap: () => deleteMeta(context, meta),
              icon: Icons.delete,
            ),
          ],
          child: buildMeta(context),
        ),
      );

  Widget buildMeta(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: meta.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<MetaProvider>(context, listen: false);
                final isDone = provider.toggleMetaStatus(meta);

                Utils.showSnackBar(
                    context,
                    isDone
                        ? 'Meta concluída'
                        : 'Meta concluída como imcompleta');
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meta.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (meta.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        meta.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  void deleteMeta(BuildContext context, Meta meta) {
    final provider = Provider.of<MetaProvider>(context, listen: false);
    provider.removeMeta(meta);

    Utils.showSnackBar(context, 'Deletou essa tarefa');
  }

  void editMeta(BuildContext context, Meta meta) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditMetaPage(meta: meta),
        ),
      );
}
