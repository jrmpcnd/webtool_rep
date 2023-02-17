import 'dart:convert';

import 'package:webtool_rep/UI/utils/api.dart';

class SavedAccounts {
  String? retCode;
  String? message;
  List<Data>? data;

  SavedAccounts({this.retCode, this.message, this.data});

  SavedAccounts.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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