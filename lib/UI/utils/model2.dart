
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

class RemittanceLog_Api {
  String? retCode;
  String? message;
  List<Remittance_Log>? data;

  RemittanceLog_Api({this.retCode, this.message, this.data});

  RemittanceLog_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Remittance_Log>[];
      json['data'].forEach((v) {
        data!.add(new Remittance_Log.fromJson(v));
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
class Remittance_Log {
  String? id;
  String? sentMobileRefId;
  String? sentCoreRefId;
  String? referenceNumberRefID;
  String? senderName;
  String? receiverName;
  String? amount;
  String? senderMobileNumber;
  String? createdDate;
  String? sourceBranch;
  String? processedByFullname;
  String? lastUpdatedDate;
  String? targetBranch;
  String? disbursedByFullname;
  String? cancelledDate;
  String? cancelledByFullname;
  String? status;
  String? claimedCoreRefId;
  String? claimedMobileRefId;

  Remittance_Log(
      {this.id,
        this.sentMobileRefId,
        this.sentCoreRefId,
        this.referenceNumberRefID,
        this.senderName,
        this.receiverName,
        this.amount,
        this.senderMobileNumber,
        this.createdDate,
        this.sourceBranch,
        this.processedByFullname,
        this.lastUpdatedDate,
        this.targetBranch,
        this.disbursedByFullname,
        this.cancelledDate,
        this.cancelledByFullname,
        this.status,
        this.claimedCoreRefId,
        this.claimedMobileRefId});

  Remittance_Log.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentMobileRefId = json['sent_mobile_ref_id'];
    sentCoreRefId = json['sent_core_ref_id'];
    referenceNumberRefID = json['reference_number _Ref_ID'];
    senderName = json['sender_name'];
    receiverName = json['Receiver_Name'];
    amount = json['amount'];
    senderMobileNumber = json['sender_mobile_number'];
    createdDate = json['created_date'];
    sourceBranch = json['source_branch'];
    processedByFullname = json['Processed_By_Fullname'];
    lastUpdatedDate = json['last_updated_date'];
    targetBranch = json['target_branch'];
    disbursedByFullname = json['Disbursed_By_Fullname'];
    cancelledDate = json['cancelled_date'];
    cancelledByFullname = json['Cancelled_By_Fullname'];
    status = json['status'];
    claimedCoreRefId = json['claimed_core_ref_id'];
    claimedMobileRefId = json['claimed_mobile_ref_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sent_mobile_ref_id'] = this.sentMobileRefId;
    data['sent_core_ref_id'] = this.sentCoreRefId;
    data['reference_number _Ref_ID'] = this.referenceNumberRefID;
    data['sender_name'] = this.senderName;
    data['Receiver_Name'] = this.receiverName;
    data['amount'] = this.amount;
    data['sender_mobile_number'] = this.senderMobileNumber;
    data['created_date'] = this.createdDate;
    data['source_branch'] = this.sourceBranch;
    data['Processed_By_Fullname'] = this.processedByFullname;
    data['last_updated_date'] = this.lastUpdatedDate;
    data['target_branch'] = this.targetBranch;
    data['Disbursed_By_Fullname'] = this.disbursedByFullname;
    data['cancelled_date'] = this.cancelledDate;
    data['Cancelled_By_Fullname'] = this.cancelledByFullname;
    data['status'] = this.status;
    data['claimed_core_ref_id'] = this.claimedCoreRefId;
    data['claimed_mobile_ref_id'] = this.claimedMobileRefId;
    return data;
  }
}



class UseoflistDevice_Api {
  String? retCode;
  String? message;
  List<UseoflistDevice_Log>? data;

  UseoflistDevice_Api({this.retCode, this.message, this.data});

  UseoflistDevice_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UseoflistDevice_Log>[];
      json['data'].forEach((v) {
        data!.add(new UseoflistDevice_Log.fromJson(v));
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
class UseoflistDevice_Log {
  String? createdDate;
  String? deviceId;
  String? deviceModel;
  String? androidVersion;
  String? cid;
  String? branchCode;
  String? mobileNumber;
  String? clientName;
  String? clientType;
  String? deviceStatus;

  UseoflistDevice_Log(
      {this.createdDate,
        this.deviceId,
        this.deviceModel,
        this.androidVersion,
        this.cid,
        this.branchCode,
        this.mobileNumber,
        this.clientName,
        this.clientType,
        this.deviceStatus});

  UseoflistDevice_Log.fromJson(Map<String, dynamic> json) {
    createdDate = json['created_date'];
    deviceId = json['device_id'];
    deviceModel = json['device_model'];
    androidVersion = json['android_version'];
    cid = json['cid'];
    branchCode = json['branch_code'];
    mobileNumber = json['mobile_number'];
    clientName = json['client_name'];
    clientType = json['client_type'];
    deviceStatus = json['device_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_date'] = this.createdDate;
    data['device_id'] = this.deviceId;
    data['device_model'] = this.deviceModel;
    data['android_version'] = this.androidVersion;
    data['cid'] = this.cid;
    data['branch_code'] = this.branchCode;
    data['mobile_number'] = this.mobileNumber;
    data['client_name'] = this.clientName;
    data['client_type'] = this.clientType;
    data['device_status'] = this.deviceStatus;
    return data;
  }
}