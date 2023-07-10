import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/getter_setter.dart';

class AddParameterFunction{
  Future<http.Response> addFunction() async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_paramconfig/';

    http.Response response = await http.post(Uri.parse(url), headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body: jsonEncode(<String, dynamic>{
        "set_created_by": 0,
        "set_created_date": "",
        "set_param_desc": SaveData.getParamdsc(),
        "set_param_name": SaveData.getParamname(),
        "set_param_type": SaveData.getParamstatus().toLowerCase(),
        "set_param_value": SaveData.getParamvalue(),
        },
        )
    );
    return response;
  }
}