import 'package:firebase_core/firebase_core.dart';
import 'package:panchatapp/firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:panchatapp/services/alert_services.dart';
import 'package:panchatapp/services/auth_services.dart';
import 'package:panchatapp/services/media_services.dart';
import 'package:panchatapp/services/navigation_services.dart';
import 'package:panchatapp/services/storage_services.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> registerServices() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<NavigationServices>(NavigationServices());
  getIt.registerSingleton<AlertServices>(AlertServices());
  getIt.registerSingleton<MediaServices>(MediaServices());
  getIt.registerSingleton<StorageServices>(StorageServices());
}
