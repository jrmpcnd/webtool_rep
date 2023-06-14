import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/core/providers/data_provider.dart';


class InstiApilist {
  Future<http.Response> getUserstatus() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$API/get_hierarchy_insti_dropdown'),
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

class get_insti__Drop {
  String? retcode;
  String? message;
  List<Data>? data;

  get_insti__Drop({this.retcode, this.message, this.data});

  get_insti__Drop.fromJson(Map<String, dynamic> json) {
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
  String? instiCode;
  String? instiDesc;

  Data({this.instiCode, this.instiDesc});

  Data.fromJson(Map<String, dynamic> json) {
    instiCode = json['insti_code'];
    instiDesc = json['insti_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insti_code'] = this.instiCode;
    data['insti_desc'] = this.instiDesc;
    return data;
  }
}
