import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/getter_setter.dart';

class AddDCMFunction{
  Future<http.Response> addFunction() async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_atmloc/';

    http.Response response = await http.post(Uri.parse(url), headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body: jsonEncode(<String, dynamic>{
          "set_atm_address": SaveData.getstreet(),
          "set_atm_city": SaveData.getdcmprovince(),
          "set_atm_description": SaveData.getdcmd(),
          "set_atm_latitude": SaveData.getlatitude(),
          "set_atm_longitude": SaveData.getlongitude(),
          "set_created_by": 0,
          "set_created_date": "",
          "set_insti_desc": "",
        },
        )
    );
    return response;
  }
}