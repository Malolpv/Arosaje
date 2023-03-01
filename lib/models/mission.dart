import 'dart:ui';

import 'package:arosaje/models/profile.dart';

class Mission {
  //TODO implémenter correctement les attributs

  final int id;
  final int profileId;
  final int plantId;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  List<Picture> pictures = [];

  Mission(this.id, this.profileId, this.plantId, this.description,
      this.startDate, this.endDate,
      {this.pictures = const <Picture>[]});
}
