
import 'model.dart';

class Hierarchy_Api {
  String? retCode;
  String? message;
  List<H_SaveAccount>? data;

  Hierarchy_Api({this.retCode, this.message, this.data});

  Hierarchy_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <H_SaveAccount>[];
      json['data'].forEach((v) {
        data!.add(new H_SaveAccount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retCode'] = this.retCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class H_SaveAccount {
  String? branchCode;
  String? branchDesc;
  String? centerCode;
  String? centerDesc;
  String? hierarchyId;
  String? instDesc;
  String? unitCode;
  String? unitDesc;

  H_SaveAccount(
      {this.branchCode,
        this.branchDesc,
        this.centerCode,
        this.centerDesc,
        this.hierarchyId,
        this.instDesc,
        this.unitCode,
        this.unitDesc});

  H_SaveAccount.fromJson(Map<String, dynamic> json) {
    branchCode = json['branch_code'];
    branchDesc = json['branch_desc'];
    centerCode = json['center_code'];
    centerDesc = json['center_desc'];
    hierarchyId = json['hierarchy_id'];
    instDesc = json['inst_desc'];
    unitCode = json['unit_code'];
    unitDesc = json['unit_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_code'] = this.branchCode;
    data['branch_desc'] = this.branchDesc;
    data['center_code'] = this.centerCode;
    data['center_desc'] = this.centerDesc;
    data['hierarchy_id'] = this.hierarchyId;
    data['inst_desc'] = this.instDesc;
    data['unit_code'] = this.unitCode;
    data['unit_desc'] = this.unitDesc;
    return data;
  }
}