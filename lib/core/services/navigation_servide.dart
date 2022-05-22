import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? push(Route t) {
    return navigatorKey.currentState!.push(t);
  }
}
