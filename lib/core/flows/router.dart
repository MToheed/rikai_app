import 'package:flutter/material.dart';
import 'package:rikai_app/ui/views/all_users_view.dart';
import 'package:rikai_app/ui/views/detail_view.dart';

class MyRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "all_user":
        return MaterialPageRoute(builder: (_) => const AllUserView());
      case "detail":
        String username = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => DetailView(username: username));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route found ${settings.name}"),
            ),
          ),
        );
    }
  }
}
