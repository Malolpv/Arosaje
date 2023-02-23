import 'package:arosaje/models/user.dart';
import 'package:arosaje/navigation/navigation_path.dart';
import 'package:arosaje/screens/home_screen.dart';
import 'package:arosaje/screens/plant_details.dart';
import 'package:arosaje/screens/sign_in.dart';
import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/home_view_model.dart';
import 'package:arosaje/viewmodels/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath>
    implements HomeRouter {
  User? _currentUser;

  bool _displayPlantDetails = false;
  final RemoteDataManager remoteDataManager = RemoteDataManager();
  @override
  Widget build(BuildContext context) {
    final pages = <Page<dynamic>>[];

    final user = _currentUser;

    if (user == null) {
      final startPage = SignInPage(SignInViewModel());
      pages.add(MaterialPage(child: startPage));
    } else {
      //TODO passer Le user au view model
      final homeScreen = HomeScreen(HomeViewModel(user, this));
      pages.add(MaterialPage(child: homeScreen));

      if (_displayPlantDetails == true) {
        pages.add(MaterialPage(child: PlantDetails()));
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
    // si le check n'est pas valide renvoyer false et le retour est annulé
    if (_displayPlantDetails) {
      _displayPlantDetails = false;
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
  displayPlantDetails() {
    _displayPlantDetails = true;
    notifyListeners();
  }
}
