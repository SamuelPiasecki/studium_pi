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

  List<Meta> get metasCompletas =>
      _metas.where((meta) => meta.isDone == true).toList();

  void addMeta(Meta meta) {
    _metas.add(meta);

    notifyListeners();
  }

  void removeMeta(Meta meta) {
    _metas.remove(meta);

    notifyListeners();
  }

  void updateMeta(Meta meta, String title, String description) {
    meta.title = title;
    meta.description = description;

    notifyListeners();
  }

  bool toggleMetaStatus(Meta meta) {
    meta.isDone = !meta.isDone;
    notifyListeners();

    return meta.isDone;
  }
}
