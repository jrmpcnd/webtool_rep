import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/core/providers/data_provider.dart';


class CenterApiList {
  Future<http.Response> getUserstatus() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$API/get_hierarchy_center_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {

        print(jsonDecode(response.body)['data']);
        return response;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}



class get_center_drop {
  String? retcode;
  String? message;
  List<Data>? data;

  get_center_drop({this.retcode, this.message, this.data});

  get_center_drop.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retcode'] = this.retcode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Data {
  String? centerCode;
  String? centerDesc;

  Data({this.centerCode, this.centerDesc});

  Data.fromJson(Map<String, dynamic> json) {
    centerCode = json['center_code'];
    centerDesc = json['center_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['center_code'] = this.centerCode;
    data['center_desc'] = this.centerDesc;
    return data;
  }
}