import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/meta.dart';
import 'package:studium_pi/provider/meta_provider.dart';
import 'package:studium_pi/widget/metas_widget/meta_form_widget.dart';

class EditMetaPage extends StatefulWidget {
  final Meta meta;

  const EditMetaPage({Key? key, required this.meta}) : super(key: key);

  @override
  _EditMetaPageState createState() => _EditMetaPageState();
}

class _EditMetaPageState extends State<EditMetaPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.meta.title;
    description = widget.meta.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Editar Meta'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<MetaProvider>(context, listen: false);
                provider.removeMeta(widget.meta);

                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: MetaFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedMeta: saveMeta,
            ),
          ),
        ),
      );

  void saveMeta() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<MetaProvider>(context, listen: false);

      provider.updateMeta(widget.meta, title, description);

      Navigator.of(context).pop();
    }
  }
}
