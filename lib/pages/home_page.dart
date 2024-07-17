import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:panchatapp/services/alert_services.dart';
import 'package:panchatapp/services/auth_services.dart';
import 'package:panchatapp/services/navigation_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetIt _getIt = GetIt.instance;
  late AuthServices _authServices;
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;

  @override
  void initState() {
    super.initState();
    _authServices = _getIt.get<AuthServices>();
    _navigationServices = _getIt.get<NavigationServices>();
    _alertServices = _getIt.get<AlertServices>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        actions: [
          IconButton(
              onPressed: () async {
                bool result = await _authServices.logout();
                if (result == true) {
                  _alertServices.showToast(text: "Logout!", icon: Icons.check);
                  _navigationServices.pushReplacementNamed("/login");
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
