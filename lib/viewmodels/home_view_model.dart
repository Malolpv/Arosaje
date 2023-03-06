import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/profile.dart';
import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';

abstract class HomeRouter {
  displayPlantDetails(final Plant currentPlant);
  displayMission();
  onLogout();

  void displayAddPlant() {}
}

class HomeViewModel extends BaseViewModel {
  //TODO ADD SERVICE CALL TO RETRIEVE DATA

  //attributes
  final Profile _profile;
  List<Plant> _plantList = [];
  List<Plant> get plantList => _plantList;

  //utils
  final HomeRouter _router;
  final RemoteDataManager _remoteDataManager = RemoteDataManager();

  //constructors
  HomeViewModel(this._profile, this._router);

  //errors

  //methods

  void onPlantTaped(int index) {
    _router.displayPlantDetails(_plantList[index]);
  }

  void refreshPlantList() async {
    isLoading = true;
    notifyListeners();

    fetchPlantList();

    isLoading = false;
    notifyListeners();
  }

  Future<List<Plant>> fetchPlantList() async {
    _plantList = await _remoteDataManager.loadAllPlants(_profile.id);
    notifyListeners();
    return Future.value(_plantList);
  }

  void onLogout() {
    _router.onLogout();
  }

  void displayMissions() {
    _router.displayMission();
  }

  addPlant() {
    _router.displayAddPlant();
  }
}
