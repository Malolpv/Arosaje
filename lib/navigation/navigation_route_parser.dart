import 'package:arosaje/navigation/navigation_path.dart';
import 'package:flutter/material.dart';

class NavigationRouteParser extends RouteInformationParser<NavigationPath> {
  @override
  Future<NavigationPath> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? "/");
    final int? userId;
    if (uri.pathSegments.length >= 2) {
      userId = int.tryParse(uri.pathSegments[1]);
    } else {
      userId = null;
    }
    return Future.value(const NavigationPath(userId: null));
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationPath configuration) {
    String location = "/";
    final userId = configuration.userId;
    if (userId != null) {
      location = "${location}user/$userId";
    }
    return RouteInformation(location: location);
  }
}
