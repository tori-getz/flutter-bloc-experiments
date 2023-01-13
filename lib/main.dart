import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/route_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      routes: RouteManager.getRoutes(),
      initialRoute: RouteManager.getInitialRoute(),
      debugShowCheckedModeBanner: false,
    );
  }
}
