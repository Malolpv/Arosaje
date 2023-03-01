import 'package:arosaje/models/plant.dart';
import 'package:arosaje/services/remote_data_manager.dart';
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

  final RemoteDataManager _remoteDataManager = RemoteDataManager();

  //errors

  //methods

  Future<List<Picture>> fetchPictures() {
    //TODO retrieve pictures by plant ID
    _picturesNumber = 1;
    notifyListeners();
    return Future.value(plant.pictures);
  }
}
