import 'dart:async';
import 'dart:convert';
import 'package:pgone_apps/models/employee_model.dart';
import 'package:pgone_apps/models/user_model.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  String baseUrl = "https://hrm.polowijogosari.co.id/symfony/web/index.php";

  Future<EmployeeModel> getEmployeeDetails(
      {required String id, required AccessToken accessToken}) async {
    try {
      var url = '$baseUrl/api/v1/employee/$id';
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + accessToken.accessToken
      };
      var response = await http
          .get(
        Uri.parse(url),
        headers: headers,
      )
          .timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException("request timeout");
      });

      print(response);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        EmployeeModel user = EmployeeModel.fromJson(data['data']);
        return user;
      } else {
        print(response.statusCode);
        throw Exception('Gagal Login');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
