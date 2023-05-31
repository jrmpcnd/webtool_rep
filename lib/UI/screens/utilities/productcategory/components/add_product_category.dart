
import 'dart:convert';

import 'package:http/http.dart' as http;


import '../../../../../core/getter_setter.dart';

class AddProductFunction{
  Future<http.Response> addFunction() async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_productcategory/';

    http.Response response = await http.post(Uri.parse(url), headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, dynamic>{
        "set_created_by": 0,
        "set_created_date": "string",
        "set_description": "string",
        "set_product_category_id": int.parse(SaveData.getCategoryId()),
        "set_product_category_name": SaveData.getCategoryName(),
        "set_product_type_name": SaveData.getProductType(),
        "set_status": SaveData.getStatus().toLowerCase().contains('active') ? 1 : 0,
      },
      )
    );
    return response;
  }
}