import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/providers/data_provider.dart';


class BranchApilist {
  Future<http.Response> getUserstatus() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$API/get_hierarchy_branch_dropdown'),
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

class BranchDrop {
  String? retcode;
  String? message;
  List<Data>? data;

  BranchDrop({this.retcode, this.message, this.data});

  BranchDrop.fromJson(Map<String, dynamic> json) {
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
  String? branchCode;
  String? branchDesc;

  Data({this.branchCode, this.branchDesc});

  Data.fromJson(Map<String, dynamic> json) {
    branchCode = json['branch_code'];
    branchDesc = json['branch_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_code'] = this.branchCode;
    data['branch_desc'] = this.branchDesc;
    return data;
  }
}
