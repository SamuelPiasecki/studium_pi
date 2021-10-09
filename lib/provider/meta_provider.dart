import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:studium_pi/api/firebase_api.dart';
import 'package:studium_pi/model/meta.dart';

class MetaProvider extends ChangeNotifier {
  //Arrumar quase tudo isso aqui
  List<Meta> _metas = [];

  List<Meta> get metas => _metas.where((meta) => meta.isDone == false).toList();

  List<Meta> get metasCompletas =>
      _metas.where((meta) => meta.isDone == true).toList();

  void setMetas(List<Meta> metas) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _metas = metas;

        notifyListeners();
      });

  void addMeta(Meta meta) => FirebaseApi.createMeta(meta);

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
