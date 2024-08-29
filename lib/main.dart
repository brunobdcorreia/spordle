import 'package:flutter/material.dart';
import 'package:spordle/pages/boot_page.dart';
import 'package:spordle/pages/game_page.dart';
import 'package:spordle/pages/guess_page.dart';
import 'package:spordle/pages/select_songs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
          '/': (context) => const BootPage(),
          '/select': (context) => const SelectSongsPage(),
          '/game': (context) => const GamePage(),
          '/guess': (context) => const GuessPage(),
      }
    );
  }
}
