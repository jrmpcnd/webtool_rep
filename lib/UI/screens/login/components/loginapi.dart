import 'dart:convert';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNjc5MDEzMzY3LCJpZGVudGl0eSI6IiQyYSQxNCRMbmdBVXR3Y0paRzlCV0Q4NDJHLzBPalNjNkZGUEVHeVcuYU1DbWF0bWNGbU5ibmdxZHhBaSJ9.b4yZWgw8RC528rDERL9Z-uSNG8mcUpVJ5lcsixh6PlU";

class Login {
  Future<http.Response> login(user_login, go_password) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/Login/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'user_login': user_login,
          'go_password': go_password
        }));
    return response;
  }
}

class Reset {
  Future<http.Response> reset(reset_user, new_pass, retype_pass) async {
    String url =
        'https://sit-api-janus.fortress-asya.com:1234/initial_changepass/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          "get_user_login": reset_user,
          // "set_current_go_password": old_pass,
          "set_go_password": new_pass,
          "set_retype_go_password": retype_pass
        }));
    return response;
  }
}

class Change {
  Future<http.Response> change(
      reset_user, old_pass, new_pass, retype_pass) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/change_pass/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          "get_user_login": reset_user,
          "set_current_go_password": old_pass,
          "set_go_password": new_pass,
          "set_retype_go_password": retype_pass
        }));
    return response;
  }
}

class Confirmation {
  Future<http.Response> confirm(user_email, user_login) async {
    String url =
        'https://sit-api-janus.fortress-asya.com:1234/smtp_initialchangepass/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          "user_email": user_email,
          "user_login": user_login
        }));
    return response;
  }
}

// class Search {
//   Future<http.Response> search(username) async {
//     String url = 'http://172.16.22.60:3000/search';
//     final http.Response response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{'username': username}),
//     );
//     return response;
//   }
// }

