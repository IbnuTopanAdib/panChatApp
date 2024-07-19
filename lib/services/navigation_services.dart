import 'package:flutter/widgets.dart';
import 'package:panchatapp/pages/home_page.dart';
import 'package:panchatapp/pages/login.dart';
import 'package:panchatapp/pages/register_page.dart';

class NavigationServices {
  late GlobalKey<NavigatorState> _navigatorKey;

  final Map<String, Widget Function(BuildContext context)> _routes = {
    "/login": (context) => const LoginPage(),
    "/home": (context) => const HomePage(),
    "/regiter": (context) => const RegisterPage(),
  };

  GlobalKey<NavigatorState>? get navigatorKey {
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext context)> get routes {
    return _routes;
  }

  NavigationServices() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  void pushNamed(String routeName) {
    _navigatorKey.currentState?.pushNamed(routeName);
  }

  void pushReplacementNamed(String routeName) {
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void goBack() {
    _navigatorKey.currentState?.pop();
  }
}
