import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtool_rep/UI/utils/models/addinsti_model.dart';

class AddinstiAPI {
  Future<http.Response> addinstiapi(
    String set_insti_code,
    String set_inst_desc,
  ) async {
    String url =
        'https://sit-api-janus.fortress-asya.com:1234/create_insti/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddinstiModel(
        setInstCode: set_insti_code,
        setInstDesc: set_inst_desc,
      )),
    );
    return response;
  }
}
