import 'dart:async';
import 'dart:convert';
import 'package:pgone_apps/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "https://hrm.polowijogosari.co.id/symfony/web/index.php";

  Future<UserModel> login(
      {required String username,
      required String password,
      required AccessToken accessToken}) async {
    try {
      var url = '$baseUrl/api/v1/login';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + accessToken.accessToken
      };
      var body = jsonEncode({
        'username': username,
        'password': password,
      });

      var response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: body,
      )
          .timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException("request timeout");
      });

      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        UserModel user = UserModel.fromJson(data['user']);
        user.login = data["login"];
        user.accessToken = accessToken;

        return user;
      } else {
        throw Exception('Gagal Login');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<AccessToken> getToken() async {
    try {
      var url = Uri.parse("$baseUrl/oauth/issueToken");
      final grantType = "client_credentials";
      final clientId = "pgone_restful_api";
      final clientSecret = "389528eb3ab500a3a5b01a62dadd6be4b5520047";

      final response = await http.post(url, body: {
        'grant_type': grantType,
        'client_id': clientId,
        'client_secret': clientSecret
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return AccessToken.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
