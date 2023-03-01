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
  List<Picture> _pictures = [];
  List<Picture> get pictures => _pictures;

  final RemoteDataManager _remoteDataManager = RemoteDataManager();

  //errors

  //methods

  Future<List<Picture>> fetchPictures() async {
    //TODO retrieve pictures by plant ID
    _pictures = await _remoteDataManager.loadPlantPictures(_plant.id);
    notifyListeners();
    return pictures;
  }
}
