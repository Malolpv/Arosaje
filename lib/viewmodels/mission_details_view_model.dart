import 'package:arosaje/models/mission.dart';
import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';

class MissionDetailsViewModel extends BaseViewModel {
  //attributes
  final Plant plant;
  final Mission mission;

  List<Picture> _pictures = [];
  List<Picture> get pictures => _pictures;
  //construtors
  MissionDetailsViewModel(
    this.mission,
    this.plant,
  );

  //utils
  final RemoteDataManager _remoteDataManager = RemoteDataManager();

  Future<List<Picture>> fetchPictures() async {
    isLoading = true;
    notifyListeners();

    _pictures = await _remoteDataManager.loadMissionPictures(mission.id);

    notifyListeners();
    return _pictures;
  }
}
