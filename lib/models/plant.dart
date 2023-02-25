import 'package:arosaje/models/mission.dart';
import 'package:arosaje/models/picture.dart';

class Plant {
  //attributes
  int _id;
  String _name;
  DateTime _creationDate;
  List<Picture> _pictures;
  Picture _mainPicture;

  // getters && setters
  int get id => _id;
  String get name => _name;
  DateTime get creationDate => _creationDate;
  List<Picture> get pictures => _pictures;
  Picture get mainPicture => _mainPicture;

  set name(String value) {
    _name = value;
  }

  set creationDate(DateTime value) {
    _creationDate = value;
  }

  set mainPicture(Picture value) {
    _mainPicture = value;
  }

  //Constructors
  Plant(this._id, this._name, this._creationDate, this._mainPicture,
      this._pictures);

  //methods
}
