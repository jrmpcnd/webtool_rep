//Administration
class Role_Management {
  String? retCode;
  String? message;
  List<Data>? data;

  Role_Management({this.retCode, this.message, this.data});

  Role_Management.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
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
    data['retCode'] = this.retCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? role_id;
  String? role_name;
  String? role_desc;

  Data({this.role_name, this.role_id, this.role_desc});

  Data.fromJson(Map<String, dynamic> json) {
    role_id = json['role_id'];
    role_name = json['role_name'];
    role_desc = json['role_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.role_id;
    data['role_name'] = this.role_name;
    data['role_desc'] = this.role_desc;

    return data;
  }
}

class User_Management {
  String? retcode;
  String? message;
  List<Data2>? data;

  User_Management({this.retcode, this.message, this.data});

  User_Management.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
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

class Data2 {
  String? userId;
  String? userLogin;
  String? givenName;
  String? middleName;
  String? lastName;
  String? branchNames;
  String? roles;
  String? checkStatus;

  Data2(
      {this.userId,
        this.userLogin,
        this.givenName,
        this.middleName,
        this.lastName,
        this.branchNames,
        this.roles,
        this.checkStatus});

  Data2.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userLogin = json['user_login'];
    givenName = json['given_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    branchNames = json['branch_names'];
    roles = json['roles'];
    checkStatus = json['check_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_login'] = this.userLogin;
    data['given_name'] = this.givenName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['branch_names'] = this.branchNames;
    data['roles'] = this.roles;
    data['check_status'] = this.checkStatus;
    return data;
  }
}
//Monitoring

class Transaction_Confirmation {
  String? retcode;
  String? message;
  List<Data3>? data;

  Transaction_Confirmation({this.retcode, this.message, this.data});

  Transaction_Confirmation.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data3>[];
      json['data'].forEach((v) {
        data!.add(new Data3.fromJson(v));
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

class Data3 {
  String? suspiciousId;
  String? transDate;
  String? transDesc;
  String? clientMobileNo;
  String? cid;
  String? clientName;
  String? branchDesc;
  String? unitDesc;
  String? centerDesc;
  String? note;
  String? status;

  Data3(
      {this.suspiciousId,
        this.transDate,
        this.transDesc,
        this.clientMobileNo,
        this.cid,
        this.clientName,
        this.branchDesc,
        this.unitDesc,
        this.centerDesc,
        this.note,
        this.status});

  Data3.fromJson(Map<String, dynamic> json) {
    suspiciousId = json['suspicious_id'];
    transDate = json['trans_date'];
    transDesc = json['trans_desc'];
    clientMobileNo = json['client_mobile_no'];
    cid = json['cid'];
    clientName = json['client_name'];
    branchDesc = json['branch_desc'];
    unitDesc = json['unit_desc'];
    centerDesc = json['center_desc'];
    note = json['note'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suspicious_id'] = this.suspiciousId;
    data['trans_date'] = this.transDate;
    data['trans_desc'] = this.transDesc;
    data['client_mobile_no'] = this.clientMobileNo;
    data['cid'] = this.cid;
    data['client_name'] = this.clientName;
    data['branch_desc'] = this.branchDesc;
    data['unit_desc'] = this.unitDesc;
    data['center_desc'] = this.centerDesc;
    data['note'] = this.note;
    data['status'] = this.status;
    return data;
  }
}

class Sms_Logs {
  String? retcode;
  String? message;
  List<Data5>? data;

  Sms_Logs({this.retcode, this.message, this.data});

  Sms_Logs.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data5>[];
      json['data'].forEach((v) {
        data!.add(new Data5.fromJson(v));
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

class Data5 {
  String? msgId;
  String? msgSentDate;
  String? msisdn;
  String? cid;
  String? name;
  String? msgCommand;
  String? activity;
  String? msgStatus;

  Data5(
      {this.msgId,
        this.msgSentDate,
        this.msisdn,
        this.cid,
        this.name,
        this.msgCommand,
        this.activity,
        this.msgStatus});

  Data5.fromJson(Map<String, dynamic> json) {
    msgId = json['msg_id'];
    msgSentDate = json['msg_sent_date'];
    msisdn = json['msisdn'];
    cid = json['cid'];
    name = json['name'];
    msgCommand = json['msg_command'];
    activity = json['activity'];
    msgStatus = json['msg_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg_id'] = this.msgId;
    data['msg_sent_date'] = this.msgSentDate;
    data['msisdn'] = this.msisdn;
    data['cid'] = this.cid;
    data['name'] = this.name;
    data['msg_command'] = this.msgCommand;
    data['activity'] = this.activity;
    data['msg_status'] = this.msgStatus;
    return data;
  }
}