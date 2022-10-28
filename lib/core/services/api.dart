import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rikai_app/core/models/detail.dart';
import 'package:rikai_app/core/models/user.dart';

class Api {
  static const baseUrl = "https://api.github.com/users";

  Future<List<User>> allUserApi(int start) async {
    try {
      var url = Uri.parse("$baseUrl?since=$start&per_page=20");
      var response = await http.get(url);

      print("all user api response: ${response.body}");
      return userFromJson(response.body);
    } on SocketException {
      return Future.error("Check Your Internet Connection");
    } on http.ClientException {
      return Future.error("Check Your Internet Connection");
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Detail> detailApi(String username) async {
    try {
      var url = Uri.parse("$baseUrl/$username");
      var response = await http.get(url);

      print("detail api response: ${response.body}");
      return detailFromJson(response.body);
    } on SocketException {
      return Future.error("Check Your Internet Connection");
    } on http.ClientException {
      return Future.error("Check Your Internet Connection");
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
