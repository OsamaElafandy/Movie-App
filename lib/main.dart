import 'package:arch/core/services/service_locator.dart';
import 'package:arch/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      initialRoute: MainMoviesScreen.routerName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MainMoviesScreen.routerName:
            return MaterialPageRoute(
              builder: (_) => const MainMoviesScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const MainMoviesScreen(),
            );
        }
      },
      home: const MainMoviesScreen(),
    );
  }
}
