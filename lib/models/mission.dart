import 'dart:ui';

import 'package:arosaje/models/profile.dart';

class Mission {
  //TODO implémenter correctement les attributs

  final int _id;
  final DateTime _start, _end;

  final List<Picture> _pictures;

  Mission(this._id, this._start, this._end, this._pictures);
}
