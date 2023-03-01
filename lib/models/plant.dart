import 'package:arosaje/models/comment.dart';
import 'package:arosaje/models/mission.dart';
import 'package:arosaje/models/picture.dart';

class Plant {
  //attributes
  final int id;
  final String name;
  final int profileId;
  final List<Mission> missions;
  final List<Comment> comments;
  final List<Picture> pictures;
  final String mainPicture;

  //Constructors
  Plant(this.id, this.name, this.profileId, this.mainPicture, this.comments,
      this.pictures, this.missions);

  //methods
}
