import 'package:flutter/material.dart';
import 'package:internshala/provider/contraints.dart';
import 'package:internshala/screens/city.dart';
import 'package:internshala/screens/filter.dart';
import 'package:internshala/screens/profile.dart';
import 'package:internshala/screens/search.dart';
import 'package:internshala/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConstraintsProvider(),
      child: MaterialApp(
        title: 'Internshala',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash': (context) => Splash(),
          '/search': (context) => Search(),
          '/filter': (context) => Filter(),
          '/profile': (context) => Profile(),
          '/city': (context) => City(),
        },
      ),
    );
  }
}
