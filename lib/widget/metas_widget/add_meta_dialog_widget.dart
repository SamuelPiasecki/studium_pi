import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studium_pi/model/meta.dart';
import 'package:studium_pi/provider/meta_provider.dart';
import 'package:studium_pi/widget/metas_widget/meta_form_widget.dart';

class AddMetaDialogWidget extends StatefulWidget {
  @override
  _AddMetaDialogWidgetState createState() => _AddMetaDialogWidgetState();
}

class _AddMetaDialogWidgetState extends State<AddMetaDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adicionar Meta',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              MetaFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedMeta: addMeta,
              ),
            ],
          ),
        ),
      );

  void addMeta() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final meta = Meta(
        id: '',
        title: title,
        description: description,
      );

      final provider = Provider.of<MetaProvider>(context, listen: false);
      provider.addMeta(meta);

      Navigator.of(context).pop();
    }
  }
}
