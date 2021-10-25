import 'package:flutter/material.dart';
import 'package:studium_pi/model/prof.dart';
import 'package:studium_pi/widget/prof_widget/show_prof_dialog.dart';

class ProfWidget extends StatelessWidget {
  final Prof prof;
  const ProfWidget({required this.prof, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => ShowProfDialogWidget(prof: prof),
          barrierDismissible: true,
        ),
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.account_circle, size: 30),
                SizedBox(width: 20),
                Text(
                  prof.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
