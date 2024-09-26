import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_assignment/Providers/apiHelper.dart';
import 'package:news_assignment/Providers/newState.dart';
import 'package:provider/provider.dart';

import 'Providers/obsecureTextState.dart';
import 'Providers/providerState.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebase initialize
  // THelperFunctions.hideBottomBlackStrip();
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProviderState()),
    ChangeNotifierProvider(create: (context) => ApiHelper()),
    ChangeNotifierProvider(create: (context) => ObsecureTextState()),
    ChangeNotifierProvider(create: (context) => NewState()),
  ], child: const MyApp()));
}
