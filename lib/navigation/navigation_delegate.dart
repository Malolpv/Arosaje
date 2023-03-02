import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/profile.dart';
import 'package:arosaje/models/user.dart';
import 'package:arosaje/navigation/navigation_path.dart';
import 'package:arosaje/screens/home_screen.dart';
import 'package:arosaje/screens/pick_image.dart';
import 'package:arosaje/screens/plant_details.dart';
import 'package:arosaje/screens/sign_in.dart';
import 'package:arosaje/screens/sign_up.dart';
import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/home_view_model.dart';
import 'package:arosaje/viewmodels/pick_image_view_model.dart';
import 'package:arosaje/viewmodels/plant_detail_view_model.dart';
import 'package:arosaje/viewmodels/signin_viewmodel.dart';
import 'package:arosaje/viewmodels/signup_view_model.dart';
import 'package:flutter/material.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath>
    implements HomeRouter, SignInRouter, SignUpRoute, PlantDetailsRouter {
  User? _currentUser;
  Profile? _currentProfile;

  //flag to control wich screen we want to display
  bool _displayPlantDetails = false;
  bool _displaySignUp = false;
  bool _displayPickImage = false;

  final RemoteDataManager remoteDataManager = RemoteDataManager();

  Plant? _currentPlant;

  @override
  Widget build(BuildContext context) {
    final pages = <Page<dynamic>>[];

    final profile = _currentProfile;
    if (profile == null) {
      //do we want to login or register ?
      final startPage = _displaySignUp == false
          ? SignInPage(SignInViewModel(this))
          : SignUpPage(SignUpViewModel(this));

      pages.add(MaterialPage(child: startPage));
    } else {
      final homeScreen = HomeScreen(HomeViewModel(profile, this));
      pages.add(MaterialPage(child: homeScreen));

      if (_displayPlantDetails == true) {
        final plant = _currentPlant;
        if (plant != null) {
          pages.add(MaterialPage(
              child: PlantDetails(PlantDetailViewModel(plant, this))));
        }
      }
      if (_displayPickImage == true) {
        pages.add(MaterialPage(child: PickImage(PickImageViewModel())));
      }
    }

    return Navigator(
      pages: pages,
      onPopPage: (route, result) {
        if (route.didPop(result) == false) {
          return false;
        }
        return onBackButtonTouched(result);
      },
    );
  }

  bool onBackButtonTouched(dynamic result) {
    //Si il y a quelque chose a check avant d'afficher la page précédente implémenter ici,
    //si le check n'est pas valide renvoyer false et le retour est annulé

    if (_displaySignUp) {
      _displaySignUp = false;
    } else if (_displayPlantDetails) {
      if (_displayPickImage) {
        _displayPickImage = false;
      } else {
        _displayPlantDetails = false;
        _currentPlant = null;
      }
    }
    notifyListeners();
    return true;
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(NavigationPath configuration) async {
    final userId = configuration.userId;
    if (userId != null && _currentUser != null) {
      final currentUser = await remoteDataManager.loadCurrentUser(userId);
      if (currentUser != null) {
        _currentUser = currentUser;
      }
    }
  }

  @override
  NavigationPath? get currentConfiguration =>
      NavigationPath(userId: _currentUser?.id);

  @override
  displayPlantDetails(final Plant currentPlant) {
    _displayPlantDetails = true;
    _currentPlant = currentPlant;
    notifyListeners();
  }

  @override
  onLogin(Profile profile) {
    _currentProfile = profile;
    notifyListeners();
  }

  @override
  onLogout() {
    _currentProfile = null;
    notifyListeners();
  }

  @override
  displaySignIn() {
    _displaySignUp = false;
    notifyListeners();
  }

  @override
  displaySignUp() {
    _displaySignUp = true;
    notifyListeners();
  }

  @override
  onSignUp() {
    // TODO: implement onSignUp
    throw UnimplementedError();
  }

  @override
  displayPickImage() {
    _displayPickImage = true;
    notifyListeners();
  }
}
