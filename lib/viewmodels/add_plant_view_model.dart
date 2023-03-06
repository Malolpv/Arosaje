import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddPlantRouter {
  void savePlant();
}

class AddPlantViewModel extends BaseViewModel {
  XFile? _image;
  String? _name;
  final int _profileId;

  XFile? get image => _image;

  final AddPlantRouter _router;

  AddPlantViewModel(this._profileId, this._router);

  final RemoteDataManager _remoteDataManager = RemoteDataManager();
  void plantSaved(String? newValue) {
    _name = newValue;
  }

  void save() {
    final image = _image;
    final name = _name;
    if (image != null && name != null) {
      _remoteDataManager.savePlant(name, image.path, _profileId);
      _router.savePlant();
    } else {
      errorMessage = "Veuillez remplir tout les champs";
    }
    notifyListeners();
  }

  void selectImage(XFile? imageFile) {
    if (imageFile != null) {
      _image = imageFile;
      errorMessage = null;
    } else {
      errorMessage = "Erreur : Impossible de sélectionner cette image";
    }
    notifyListeners();
  }
}
