import 'package:arosaje/viewmodels/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

class PickImageViewModel extends BaseViewModel {
  XFile? _image;
  XFile? get image => _image;

  void selectImage(XFile? image) {
    if (image != null) {
      _image = image;
      errorMessage = null;
    } else {
      errorMessage = "Erreur : Impossible de sélectionner cette image";
    }
    notifyListeners();
  }

  String getPath() {
    final image = _image;
    String path = "";
    if (image != null) {
      path = image.path;
    }
    return path;
  }

  void saveImage() async {
    //TODO implémenter la fonction save image
    throw UnimplementedError("A implémenter");
  }
}
