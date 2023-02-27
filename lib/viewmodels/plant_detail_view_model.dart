import 'package:arosaje/models/plant.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';
import 'package:arosaje/models/picture.dart';

class PlantDetailViewModel extends BaseViewModel {
  //attributes
  final Plant _plant;
  Plant get plant => _plant;

  //Constructors
  PlantDetailViewModel(this._plant);

  //utils
  int _picturesNumber = 0;
  int get picturesNumber => _picturesNumber;

  //errors

  //methods

  Future<List<Picture>> fetchPictures() {
    //TODO retrieve pictures by plant ID
    _picturesNumber = 1;
    notifyListeners();
    return Future.value(<Picture>[Picture()]);
  }
}
