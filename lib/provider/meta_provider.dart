import 'package:flutter/cupertino.dart';
import 'package:studium_pi/model/meta.dart';

class MetaProvider extends ChangeNotifier {
  List<Meta> _metas = [
    Meta(
        createdTime: DateTime.now(),
        id: '1',
        title: 'Vencer na vida',
        description: ''' - pelo menos passar de ano
    - não morrer'''),
    Meta(
        createdTime: DateTime.now(),
        id: '2',
        title: 'Ler um livro',
        description: ''' - pelo menos um cap
    - pelo menos o título'''),
  ];

  List<Meta> get metas => _metas.where((meta) => meta.isDone == false).toList();
}
