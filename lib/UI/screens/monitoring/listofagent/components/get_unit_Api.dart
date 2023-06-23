import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/core/providers/data_provider.dart';


class UnitApiList {
  Future<http.Response> getUserstatus() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$API/get_hierarchy_unit_dropdown/'),
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



class get_unit_drop {
  String? retcode;
  String? message;
  List<Data>? data;

  get_unit_drop({this.retcode, this.message, this.data});

  get_unit_drop.fromJson(Map<String, dynamic> json) {
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
  String? unitCode;
  String? unitDesc;

  Data({this.unitCode, this.unitDesc});

  Data.fromJson(Map<String, dynamic> json) {
    unitCode = json['unit_code'];
    unitDesc = json['unit_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_code'] = this.unitCode;
    data['unit_desc'] = this.unitDesc;
    return data;
  }
}