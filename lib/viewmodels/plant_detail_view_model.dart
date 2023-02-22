import 'package:arosaje/models/plant.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';

class PlantDetailViewModel extends BaseViewModel {
  //attributes
  Plant? _plant;
  Plant? get plant => _plant;

  //Constructors
  PlantDetailViewModel(this._plant);

  //utils

  //errors

  //methods

  void fetchPictures() {
    //TODO retrieve pictures by plant ID
  }
}
