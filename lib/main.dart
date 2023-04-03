import 'package:dynamic_app/firebase_options.dart';
import 'package:dynamic_app/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home_screen.dart';
import 'services/remote_config_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await RemoteConfigService.initialize();

  runApp(const DynamicApp());
}

class DynamicApp extends StatelessWidget {
  const DynamicApp({super.key});

  static const appName = "Dynamic App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green
      ),
      scaffoldMessengerKey: Utils.scaffoldKey,
      home: const HomeScreen(title: appName),
      debugShowCheckedModeBanner: false,
    );
  }
}