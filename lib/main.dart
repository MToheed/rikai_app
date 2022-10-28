import 'package:flutter/material.dart';
import 'package:rikai_app/core/flows/router.dart';
import 'package:sizer/sizer.dart';
import 'core/flows/locator.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Rikai App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: MyRouter().generateRoute,
          initialRoute: "all_user",
        );
      },
    );
  }
}
