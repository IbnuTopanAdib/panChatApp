import 'package:firebase_core/firebase_core.dart';
import 'package:panchatapp/firebase_options.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
