import 'package:arosaje/models/profile.dart';
import 'package:arosaje/models/user.dart';
import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/connection_base_view_model.dart';

abstract class SignInRouter {
  onLogin(Profile profile);
  displaySignUp();
}

class SignInViewModel extends ConnectionBaseViewModel {
  //attributes
  final RemoteDataManager _remoteDataManager = RemoteDataManager();
  final SignInRouter _router;

  //Constructors
  SignInViewModel(this._router);

  //utils

  //methods

  void emailSaved(String? newEmail) {
    email = newEmail;
    emailErrorMessage = null;
  }

  void passwordSaved(String? newPassword) {
    password = newPassword;
    passwordErrorMessage = null;
  }

//inutile
  bool manageEmailErrorMessage(String email) {
    bool valid = true;
    if (email.isEmpty || !email.contains("@") || !email.contains(".")) {
      valid = false;
      emailErrorMessage = "Email invalide";
      notifyListeners();
    }
    return valid;
  }

//inutile
  bool managePasswordErrorMessage(String password) {
    bool valid = true;
    if (password.isEmpty) {
      passwordErrorMessage = "Mot de passe inalide invalide";
      valid = false;
      notifyListeners();
    }
    return valid;
  }

  void onSignUpClicked() {
    _router.displaySignUp();
  }

  void signIn() async {
    final email = getEmail;
    final pass = getPassword;
    if (email != null && pass != null) {
      //TODO implementer le code de login
      if (manageEmailErrorMessage(email) && managePasswordErrorMessage(pass)) {
        isLoading = true;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 2));
        User? user = await _remoteDataManager.checkUserCredentials(email, pass);
        if (user != null) {
          Profile? profile =
              await _remoteDataManager.loadProfileByUserUid(user.uid);
          if (profile != null) {
            _router.onLogin(profile);
          } else {
            errorMessage = "Impossible de retrouver votre compte";
          }
        } else {
          errorMessage = "Impossible de retrouver votre compte";
        }
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
