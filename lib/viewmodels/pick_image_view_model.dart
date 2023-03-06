import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class PickImageRouter {
  onImageSaved();
}

class PickImageViewModel extends BaseViewModel {
  final PickImageRouter _router;
  final RemoteDataManager _remoteDataManager = RemoteDataManager();

  XFile? _image;
  XFile? get image => _image;

  final int _plantId;
  final int _missionId;

  PickImageViewModel(this._router, this._plantId, this._missionId);

  void selectImage(XFile? image) {
    if (image != null) {
      _image = image;
      errorMessage = null;
    } else {
      errorMessage = "Erreur : Impossible de sélectionner cette image";
    }
    notifyListeners();
  }

  void saveImage() async {
    //TODO implémenter la fonction save image

    final image = _image;
    if (image != null) {
      final imageAsByte = await image.readAsBytes();
      final path = image.path;
      // _remoteDataManager.savePicture(imageAsByte,
      //     plantId: _plantId, missionId: _missionId);
      _remoteDataManager.savePictureLocal(path, _plantId, _missionId);
      _router.onImageSaved();
    } else {
      errorMessage = "Veuillez sélectionner une image";
      notifyListeners();
    }
  }
}
