import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/adaptive_page.dart';
import 'package:provider/provider.dart';

import 'providers/preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => HogwartsData()),
        ChangeNotifierProvider(create: (BuildContext context) => Preferences()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'),
          Locale('ca'),
          Locale('en'),
        ],
        locale: Locale('en'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
          ),
        ),
        home: const AdaptivePage(),
      ),
    );
  }
}
