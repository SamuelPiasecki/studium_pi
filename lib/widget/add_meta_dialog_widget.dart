import 'package:flutter/material.dart';
import 'package:studium_pi/widget/meta_form_widget.dart';

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
        content: Column(
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
              onSavedMeta: () {},
            ),
          ],
        ),
      );
}
