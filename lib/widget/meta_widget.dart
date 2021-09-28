import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:studium_pi/model/meta.dart';

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
              onTap: () {},
              caption: 'Editar',
              icon: Icons.edit,
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red[700],
              caption: 'Deletar',
              onTap: () {},
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
              onChanged: (_) {},
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
}
