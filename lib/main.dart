import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:miniproject/screens/login_screen.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  final Color themeColor = Colors.tealAccent[400]!;
  final Color canvasColor = Colors.grey[900]!;
  final Color cardColor = Colors.grey[850]!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.white,
          cursorColor: Colors.white,
          selectionColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: themeColor)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(color: canvasColor),
        canvasColor: canvasColor,
        cardColor: cardColor,
        accentColor: themeColor,
      ),
      home: LoginScreen(),
      // home: Scaffold(body: Text("Hi THERE")),
    );
  }
}
