import 'package:flutter/material.dart'
import 'package:url_launcher_functionalities/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(16, 13, 34, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(26, 19, 39, 1.0),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
