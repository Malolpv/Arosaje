import 'package:arosaje/models/user.dart';
import 'package:arosaje/navigation/navigation_path.dart';
import 'package:arosaje/screens/home_screen.dart';
import 'package:arosaje/screens/sign_in.dart';
import 'package:arosaje/services/remote_data_manager.dart';
import 'package:arosaje/viewmodels/home_view_model.dart';
import 'package:arosaje/viewmodels/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath> {
  User? _currentUser;
  final RemoteDataManager remoteDataManager = RemoteDataManager();
  @override
  Widget build(BuildContext context) {
    final pages = <Page<dynamic>>[];

    final user = _currentUser;
    if (user != null) {
      //TODO passer Le user au view model
      final homeScreen = HomeScreen(HomeViewModel());
      pages.add(MaterialPage(child: homeScreen));
    } else {
      final startPage = SignInPage(SignInViewModel());
      pages.add(MaterialPage(child: startPage));
    }

    return Navigator(
      pages: pages,
    );
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
}
