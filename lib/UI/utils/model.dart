<<<<<<< HEAD
import 'dart:convert';

import 'package:webtool_rep/UI/utils/api.dart';

class SavedAccounts {
=======
//Administration
class Role_Management {
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
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

<<<<<<< HEAD
class H_SavedAccounts {
  String? retCode;
  String? message;
  List<Data1>? data;

  H_SavedAccounts({this.retCode, this.message, this.data});

  H_SavedAccounts.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
=======
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
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
<<<<<<< HEAD
    data['retCode'] = this.retCode;
=======
    data['retcode'] = this.retcode;
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

<<<<<<< HEAD
class Data1 {
  String? branch_code;
  String? branch_desc;
  String? unit_code;
  String? unit_desc;
  String? center_code;
  String? center_desc;



  Data1({this.branch_code,this.branch_desc,this.unit_code,this.unit_desc,this.center_code,this.center_desc});

  Data1.fromJson(Map<String, dynamic> json) {
   branch_code = json['branch_code'];
   branch_desc = json['branch_desc'];
   unit_code = json['unit_code'];
   unit_desc = json['unit_desc'];
   center_code = json['center_code'];
   center_desc = json['center_desc'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_code'] = this.branch_code;
    data['branch_desc'] = this.branch_desc;
    data['unit_code'] = this.unit_code;
    data['unit_desc'] = this.unit_desc;
    data['center_code'] = this.center_code;
    data['center_desc'] = this.center_desc;

    return data;
  }
}
class T_SavedAccounts {
  String? retCode;
  String? message;
  List<Data2>? data;

  T_SavedAccounts({this.retCode, this.message, this.data});

  T_SavedAccounts.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
=======
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
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
<<<<<<< HEAD
    data['retCode'] = this.retCode;
=======
    data['retcode'] = this.retcode;
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

<<<<<<< HEAD
class Data2 {
  String? agentFeature;
  String? agentIncome;
  String? amount;
  String? arOrNumber;
  String? bancnetIncome;
  String? bankIncome;
  String? bankName;
  String? coreRefno;
  String? custCid;
  String? message;
  String? mobileRefno;
  String? postDate;
  String? sourceAccount;
  String? sourceAccountType;
  String? sourceBranch;
  String? sourceCid;
  String? sourceClientType;
  String? sourceName;
  String? status;
  String? targetAccount;
  String? targetAccountType;
  String? targetBranch;
  String? targetCid;
  String? targetClientType;
  String? targetName;
  String? transAmountFee;
  String? transDate;
  String? transLog;
  String? transTypeCode;
  Data2(
      {this.agentFeature,
        this.agentIncome,
        this.amount,
        this.arOrNumber,
        this.bancnetIncome,
        this.bankIncome,
        this.bankName,
        this.coreRefno,
        this.custCid,
        this.message,
        this.mobileRefno,
        this.postDate,
        this.sourceAccount,
        this.sourceAccountType,
        this.sourceBranch,
        this.sourceCid,
        this.sourceClientType,
        this.sourceName,
        this.status,
        this.targetAccount,
        this.targetAccountType,
        this.targetBranch,
        this.targetCid,
        this.targetClientType,
        this.targetName,
        this.transAmountFee,
        this.transDate,
        this.transLog,
        this.transTypeCode});

  Data2.fromJson(Map<String, dynamic> json) {
    agentFeature = json['agent_feature'];
    agentIncome = json['agent_income'];
    amount = json['amount'];
    arOrNumber = json['ar_or_number'];
    bancnetIncome = json['bancnet_income'];
    bankIncome = json['bank_income'];
    bankName = json['bank_name'];
    coreRefno = json['core_refno'];
    custCid = json['cust_cid'];
    message = json['message'];
    mobileRefno = json['mobile_refno'];
    postDate = json['post_date'];
    sourceAccount = json['source_account'];
    sourceAccountType = json['source_account_type'];
    sourceBranch = json['source_branch'];
    sourceCid = json['source_cid'];
    sourceClientType = json['source_client_type'];
    sourceName = json['source_name'];
    status = json['status'];
    targetAccount = json['target_account'];
    targetAccountType = json['target_account_type'];
    targetBranch = json['target_branch'];
    targetCid = json['target_cid'];
    targetClientType = json['target_client_type'];
    targetName = json['target_name'];
    transAmountFee = json['trans_amount_fee'];
    transDate = json['trans_date'];
    transLog = json['trans_log'];
    transTypeCode = json['trans_type_code'];
=======
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
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
<<<<<<< HEAD
    data['agent_feature'] = this.agentFeature;
    data['agent_income'] = this.agentIncome;
    data['amount'] = this.amount;
    data['ar_or_number'] = this.arOrNumber;
    data['bancnet_income'] = this.bancnetIncome;
    data['bank_income'] = this.bankIncome;
    data['bank_name'] = this.bankName;
    data['core_refno'] = this.coreRefno;
    data['cust_cid'] = this.custCid;
    data['message'] = this.message;
    data['mobile_refno'] = this.mobileRefno;
    data['post_date'] = this.postDate;
    data['source_account'] = this.sourceAccount;
    data['source_account_type'] = this.sourceAccountType;
    data['source_branch'] = this.sourceBranch;
    data['source_cid'] = this.sourceCid;
    data['source_client_type'] = this.sourceClientType;
    data['source_name'] = this.sourceName;
    data['status'] = this.status;
    data['target_account'] = this.targetAccount;
    data['target_account_type'] = this.targetAccountType;
    data['target_branch'] = this.targetBranch;
    data['target_cid'] = this.targetCid;
    data['target_client_type'] = this.targetClientType;
    data['target_name'] = this.targetName;
    data['trans_amount_fee'] = this.transAmountFee;
    data['trans_date'] = this.transDate;
    data['trans_log'] = this.transLog;
    data['trans_type_code'] = this.transTypeCode;
    return data;
  }
}
=======
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
>>>>>>> 9fa2b3595e78db18e6142bf365b96394b619ce3f
