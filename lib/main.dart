import 'package:flutter/material.dart';
import 'package:quotes/screens/categoryofquotes/happyquotes.dart';
import 'package:quotes/screens/categoryofquotes/lifequotes.dart';
import 'package:quotes/screens/categoryofquotes/lovequotes.dart';
import 'package:quotes/screens/categoryofquotes/successquotes.dart';
import 'package:quotes/screens/homepage.dart';
import 'package:quotes/screens/quotesbyauthor/author1.dart';
import 'package:quotes/screens/quotesbyauthor/author2.dart';
import 'package:quotes/screens/quotesbyauthor/author3.dart';
import 'package:quotes/screens/quotesbyauthor/author4.dart';
import 'components/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'homepage': (context) => const HomePage(),
        'happy': (context) => const HappyQuotes(),
        'life': (context) => const AboutLifeQuotes(),
        'love': (context) => const AboutLoveQuotes(),
        'success': (context) => const AboutSuccessQuotes(),
        'author1': (context) => const Author1(),
        'author2': (context) => const Author2(),
        'author3': (context) => const Author3(),
        'author4': (context) => const Author4(),
        'zoom': (context) => const ZoomPage(),
        'star': (context) => const Star(),
      },
    ),
  );
}
