import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_assignment/Screens/Home/homeScreen.dart';
import 'package:news_assignment/Theme/theme.dart';

import 'Screens/Authentication/signUpScreen.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return SignUpScreen();
        },
      ),
      // home: HomePage(),
      initialRoute: '/',

      theme: ThemeData(
        scaffoldBackgroundColor: SystemTheme.background,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      onGenerateRoute: RoutesGenerator.generateRoute,
    );
  }
}
