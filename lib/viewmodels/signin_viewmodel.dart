import 'package:arosaje/viewmodels/connection_base_view_model.dart';

class SignInViewModel extends ConnectionBaseViewModel {
  //attributes

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

  void signIn() async {
    final email = this.getEmail;
    final pass = getPassword;
    if (email != null && pass != null) {
      //TODO implementer le code de login
      if (manageEmailErrorMessage(email) && managePasswordErrorMessage(pass)) {
        isLoading = true;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 2));

        isLoading = false;
        errorMessage = getPassword == "ok"
            ? "Welcome $email"
            : "Impossible de retrouver votre compte";

        notifyListeners();
      }
    }
  }
}
