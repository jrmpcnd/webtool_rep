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

class Agent_Dashboard {
  String? retcode;
  String? message;
  List<Data6>? data;

  Agent_Dashboard({this.retcode, this.message, this.data});

  Agent_Dashboard.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data6>[];
      json['data'].forEach((v) {
        data!.add(new Data6.fromJson(v));
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

class Data6 {
  String? id;
  String? branchDesc;
  String? cashIn;
  String? cashOut;
  String? agentAssistedPayment;
  String? billPayment;
  String? total;
  String? totalIncome;
  String? clientName;
  String? ci;
  String? co;
  String? aap;
  String? bp;
  String? sum;
  String? sumIncome;

  Data6(
      {this.id,
      this.branchDesc,
      this.cashIn,
      this.cashOut,
      this.agentAssistedPayment,
      this.billPayment,
      this.total,
      this.totalIncome,
      this.clientName,
      this.ci,
      this.co,
      this.aap,
      this.bp,
      this.sum,
      this.sumIncome});

  Data6.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchDesc = json['branch_desc'];
    cashIn = json['cash_in'];
    cashOut = json['cash_out'];
    agentAssistedPayment = json['agent_assisted_payment'];
    billPayment = json['bill_payment'];
    total = json['total'];
    totalIncome = json['total_income'];
    clientName = json['client_name'];
    ci = json['ci'];
    co = json['co'];
    aap = json['aap'];
    bp = json['bp'];
    sum = json['sum'];
    sumIncome = json['sum_income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_desc'] = this.branchDesc;
    data['cash_in'] = this.cashIn;
    data['cash_out'] = this.cashOut;
    data['agent_assisted_payment'] = this.agentAssistedPayment;
    data['bill_payment'] = this.billPayment;
    data['total'] = this.total;
    data['total_income'] = this.totalIncome;
    data['client_name'] = this.clientName;
    data['ci'] = this.ci;
    data['co'] = this.co;
    data['aap'] = this.aap;
    data['bp'] = this.bp;
    data['sum'] = this.sum;
    data['sum_income'] = this.sumIncome;
    return data;
  }
}

class Failed_Enrollment {
  String? retcode;
  String? message;
  List<Data7>? data;

  Failed_Enrollment({this.retcode, this.message, this.data});

  Failed_Enrollment.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data7>[];
      json['data'].forEach((v) {
        data!.add(new Data7.fromJson(v));
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

class Data7 {
  String? id;
  String? createdDate;
  String? accountNumber;
  String? dateOfBirth;
  String? mobileNumber;
  String? clientType;
  String? deviceId;
  String? deviceModel;
  String? errorMessage;

  Data7(
      {this.id,
      this.createdDate,
      this.accountNumber,
      this.dateOfBirth,
      this.mobileNumber,
      this.clientType,
      this.deviceId,
      this.deviceModel,
      this.errorMessage});

  Data7.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['created_date'];
    accountNumber = json['account_number'];
    dateOfBirth = json['date_of_birth'];
    mobileNumber = json['mobile_number'];
    clientType = json['client_type'];
    deviceId = json['device_id'];
    deviceModel = json['device_model'];
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_date'] = this.createdDate;
    data['account_number'] = this.accountNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['mobile_number'] = this.mobileNumber;
    data['client_type'] = this.clientType;
    data['device_id'] = this.deviceId;
    data['device_model'] = this.deviceModel;
    data['error_message'] = this.errorMessage;
    return data;
  }
}

class List_Agent {
  String? retcode;
  String? message;
  List<Data8>? data;

  List_Agent({this.retcode, this.message, this.data});

  List_Agent.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data8>[];
      json['data'].forEach((v) {
        data!.add(new Data8.fromJson(v));
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

class Data8 {
  String? cDateAndTime;
  String? iUserName;
  String? cCid;
  String? cFullname;
  String? cMobileNo;
  String? aInstDesc;
  String? cBranchDesc;
  String? cUnitDesc;
  String? cCenterDesc;

  Data8(
      {this.cDateAndTime,
      this.iUserName,
      this.cCid,
      this.cFullname,
      this.cMobileNo,
      this.aInstDesc,
      this.cBranchDesc,
      this.cUnitDesc,
      this.cCenterDesc});

  Data8.fromJson(Map<String, dynamic> json) {
    cDateAndTime = json['c.date_and_time'];
    iUserName = json['i.user_name'];
    cCid = json['c.cid'];
    cFullname = json['c.fullname'];
    cMobileNo = json['c.mobile_no'];
    aInstDesc = json['a.inst_desc'];
    cBranchDesc = json['c.branch_desc'];
    cUnitDesc = json['c.unit_desc'];
    cCenterDesc = json['c.center_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c.date_and_time'] = this.cDateAndTime;
    data['i.user_name'] = this.iUserName;
    data['c.cid'] = this.cCid;
    data['c.fullname'] = this.cFullname;
    data['c.mobile_no'] = this.cMobileNo;
    data['a.inst_desc'] = this.aInstDesc;
    data['c.branch_desc'] = this.cBranchDesc;
    data['c.unit_desc'] = this.cUnitDesc;
    data['c.center_desc'] = this.cCenterDesc;
    return data;
  }
}

class Broadcast_Message {
  String? retcode;
  String? message;
  List<Data9>? data;

  Broadcast_Message({this.retcode, this.message, this.data});

  Broadcast_Message.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data9>[];
      json['data'].forEach((v) {
        data!.add(new Data9.fromJson(v));
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

class Data9 {
  String? inboxId;
  String? inboxDate;
  String? subject;
  String? inboxDesc;
  String? periodStart;
  String? periodEnd;

  Data9(
      {this.inboxId,
      this.inboxDate,
      this.subject,
      this.inboxDesc,
      this.periodStart,
      this.periodEnd});

  Data9.fromJson(Map<String, dynamic> json) {
    inboxId = json['inbox_id'];
    inboxDate = json['inbox_date'];
    subject = json['subject'];
    inboxDesc = json['inbox_desc'];
    periodStart = json['period_start'];
    periodEnd = json['period_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inbox_id'] = this.inboxId;
    data['inbox_date'] = this.inboxDate;
    data['subject'] = this.subject;
    data['inbox_desc'] = this.inboxDesc;
    data['period_start'] = this.periodStart;
    data['period_end'] = this.periodEnd;
    return data;
  }
}

class Type_of_Concern {
  String? retcode;
  String? message;
  List<Data10>? data;

  Type_of_Concern({this.retcode, this.message, this.data});

  Type_of_Concern.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data10>[];
      json['data'].forEach((v) {
        data!.add(new Data10.fromJson(v));
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

class Data10 {
  String? concernCode;
  String? concernName;
  String? concernTime;
  String? concernLevel;

  Data10(
      {this.concernCode,
      this.concernName,
      this.concernTime,
      this.concernLevel});

  Data10.fromJson(Map<String, dynamic> json) {
    concernCode = json['concern_code'];
    concernName = json['concern_name'];
    concernTime = json['concern_time'];
    concernLevel = json['concern_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['concern_code'] = this.concernCode;
    data['concern_name'] = this.concernName;
    data['concern_time'] = this.concernTime;
    data['concern_level'] = this.concernLevel;
    return data;
  }
}

class CSR_Hotline {
  String? retcode;
  String? message;
  List<Data11>? data;

  CSR_Hotline({this.retcode, this.message, this.data});

  CSR_Hotline.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data11>[];
      json['data'].forEach((v) {
        data!.add(new Data11.fromJson(v));
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

class Data11 {
  String? id;
  String? contactNumber;
  String? networkProvider;
  String? instDesc;

  Data11({this.id, this.contactNumber, this.networkProvider, this.instDesc});

  Data11.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactNumber = json['contact_number'];
    networkProvider = json['network_provider'];
    instDesc = json['inst_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact_number'] = this.contactNumber;
    data['network_provider'] = this.networkProvider;
    data['inst_desc'] = this.instDesc;
    return data;
  }
}

class Fee_Structure {
  String? retcode;
  String? message;
  List<Data12>? data;

  Fee_Structure({this.retcode, this.message, this.data});

  Fee_Structure.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data12>[];
      json['data'].forEach((v) {
        data!.add(new Data12.fromJson(v));
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

class Data12 {
  String? feeId;
  String? transType;
  String? range;
  String? totalCharge;
  String? agentIncome;
  String? bankIncome;
  String? agentTargetIncome;
  String? bancnetIncome;

  Data12(
      {this.feeId,
      this.transType,
      this.range,
      this.totalCharge,
      this.agentIncome,
      this.bankIncome,
      this.agentTargetIncome,
      this.bancnetIncome});

  Data12.fromJson(Map<String, dynamic> json) {
    feeId = json['fee_id'];
    transType = json['trans_type'];
    range = json['Range'];
    totalCharge = json['total_charge'];
    agentIncome = json['agent_income'];
    bankIncome = json['bank_income'];
    agentTargetIncome = json['agent_target_income'];
    bancnetIncome = json['bancnet_income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fee_id'] = this.feeId;
    data['trans_type'] = this.transType;
    data['Range'] = this.range;
    data['total_charge'] = this.totalCharge;
    data['agent_income'] = this.agentIncome;
    data['bank_income'] = this.bankIncome;
    data['agent_target_income'] = this.agentTargetIncome;
    data['bancnet_income'] = this.bancnetIncome;
    return data;
  }
}

class Prov_Config {
  String? retcode;
  String? message;
  List<Data13>? data;

  Prov_Config({this.retcode, this.message, this.data});

  Prov_Config.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data13>[];
      json['data'].forEach((v) {
        data!.add(new Data13.fromJson(v));
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

class Data13 {
  String? paramId;
  String? appType;
  String? paramName;
  String? paramValue;
  String? paramDesc;

  Data13(
      {this.paramId,
      this.appType,
      this.paramName,
      this.paramValue,
      this.paramDesc});

  Data13.fromJson(Map<String, dynamic> json) {
    paramId = json['param_id'];
    appType = json['app_type'];
    paramName = json['param_name'];
    paramValue = json['param_value'];
    paramDesc = json['param_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['param_id'] = this.paramId;
    data['app_type'] = this.appType;
    data['param_name'] = this.paramName;
    data['param_value'] = this.paramValue;
    data['param_desc'] = this.paramDesc;
    return data;
  }
}
