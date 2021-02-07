import 'dart:async';

import 'package:bluestacks_assignment/locator.dart';
import 'package:bluestacks_assignment/ui/shared/local_storage.dart';
import 'package:bluestacks_assignment/ui/views/home_view.dart';
import 'package:bluestacks_assignment/ui/views/login_view.dart';
import 'package:bluestacks_assignment/ui/widgets/no_internet_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/shared/custom_keys.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await AppPrefs.getInstance();
  Widget _defaultHome = new LoginView();
  bool _result = prefs.getBool(CustomKeys.IS_LOGIN) ?? false;
  if (_result) {
    _defaultHome = new HomeView();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(_defaultHome));

    /*new MaterialApp(

      title: 'App',
      home: _defaultHome,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginView(),
        '/home': (context) => HomeView(),
      },
    ));*/
  });
}

final GlobalKey<NavigatorState> nav = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  Widget defaultHome;

  MyApp(this.defaultHome);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  StreamSubscription connectivitySubscription;

  ConnectivityResult _previousResult;

  @override
  void initState() {
    super.initState();

    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        nav.currentState.push(
            MaterialPageRoute(builder: (BuildContext _) => NoInternetWidget()));
      } else if (_previousResult == ConnectivityResult.none) {
        nav.currentState.pushAndRemoveUntil(
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => widget.defaultHome,
            ),
            (route) => false);
      }

      _previousResult = connectivityResult;
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: nav,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: widget.defaultHome,
      routes: {
        '/login': (context) => LoginView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}
