import 'package:flutter/material.dart';
import 'controller/language_change_controller.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          ChangeNotifierProvider(create: (_)=> LanguageChangeController()),
        ],

      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child){
          return MaterialApp(
            title: 'Flutter Demo',

            //Localization add:

            locale: Locale('en'),        //For English Language
            //locale: Locale('es'),      //For Espain Language

            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: [
              Locale('en'),
              Locale('es'),
            ],

            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      )
    );
  }
}