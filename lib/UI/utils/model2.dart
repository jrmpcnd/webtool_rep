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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_code'] = branchCode;
    data['branch_desc'] = branchDesc;
    data['center_code'] = centerCode;
    data['center_desc'] = centerDesc;
    data['hierarchy_id'] = hierarchyId;
    data['inst_desc'] = instDesc;
    data['unit_code'] = unitCode;
    data['unit_desc'] = unitDesc;
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
  String? sourceBranch;
  String? processedByFullname;
  String? targetBranch;
  String? disbursedByFullname;
  String? cancelledDate;
  String? cancelledByFullname;
  String? startSendDate;
  String? endSendDate;
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
      this.sourceBranch,
      this.processedByFullname,
      this.targetBranch,
      this.disbursedByFullname,
      this.cancelledDate,
      this.cancelledByFullname,
      this.startSendDate,
      this.endSendDate,
      this.status,
      this.claimedCoreRefId,
      this.claimedMobileRefId});

  Remittance_Log.fromJson(Map<String, dynamic> json) {
    id = '${json['id']}';
    sentMobileRefId = "${json['sent_mobile_ref_id']}";
    sentCoreRefId = "${json['sent_core_ref_id']}";
    referenceNumberRefID = "${json['reference_number _Ref_ID']}";
    senderName = "${json['sender_name']}";
    receiverName = "${json['Receiver_Name']}";
    amount = "${json['amount']}";
    senderMobileNumber = "${json['sender_mobile_number']}";
    sourceBranch = "${json['source_branch']}";
    processedByFullname = "${json['Processed_By_Fullname']}";
    targetBranch = "${json['target_branch']}";
    disbursedByFullname = "${json['Disbursed_By_Fullname']}";
    cancelledDate = "${json['cancelled_date']}";
    cancelledByFullname = "${json['Cancelled_By_Fullname']}";
    startSendDate = "${json['start_send_date']}";
    endSendDate = "${json['end_send_date']}";
    status = "${json['status']}";
    claimedCoreRefId = "${json['claimed_core_ref_id']}";
    claimedMobileRefId = "${json['claimed_mobile_ref_id']}";
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
    data['source_branch'] = this.sourceBranch;
    data['Processed_By_Fullname'] = this.processedByFullname;
    data['target_branch'] = this.targetBranch;
    data['Disbursed_By_Fullname'] = this.disbursedByFullname;
    data['cancelled_date'] = this.cancelledDate;
    data['Cancelled_By_Fullname'] = this.cancelledByFullname;
    data['start_send_date'] = this.startSendDate;
    data['end_send_date'] = this.endSendDate;
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
  String? activatedDateStart;
  String? activatedDateEnd;
  String? deviceModel;
  String? androidVersion;
  String? cid;
  String? branchCode;
  String? deviceId;
  String? mobileNumber;
  String? clientName;
  String? clientType;
  String? deviceStatus;
  UseoflistDevice_Log(
      {this.activatedDateStart,
      this.activatedDateEnd,
      this.deviceModel,
      this.androidVersion,
      this.cid,
      this.branchCode,
      this.deviceId,
      this.mobileNumber,
      this.clientName,
      this.clientType,
      this.deviceStatus});
  UseoflistDevice_Log.fromJson(Map<String, dynamic> json) {
    activatedDateStart = json['activated_date_start'];
    activatedDateEnd = json['activated_date_end'];
    deviceModel = json['device_model'];
    androidVersion = json['android_version'];
    cid = json['cid'];
    branchCode = json['branch_code'];
    deviceId = json['device_id'];
    mobileNumber = json['mobile_number'];
    clientName = json['client_name'];
    clientType = json['client_type'];
    deviceStatus = json['device_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activated_date_start'] = this.activatedDateStart;
    data['activated_date_end'] = this.activatedDateEnd;
    data['device_model'] = this.deviceModel;
    data['android_version'] = this.androidVersion;
    data['cid'] = this.cid;
    data['branch_code'] = this.branchCode;
    data['device_id'] = this.deviceId;
    data['mobile_number'] = this.mobileNumber;
    data['client_name'] = this.clientName;
    data['client_type'] = this.clientType;
    data['device_status'] = this.deviceStatus;
    return data;
  }
}

class Atm_Loc_Api {
  String? retCode;
  String? message;
  List<Atm_Loc_Log>? data;

  Atm_Loc_Api({this.retCode, this.message, this.data});

  Atm_Loc_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Atm_Loc_Log>[];
      json['data'].forEach((v) {
        data!.add(new Atm_Loc_Log.fromJson(v));
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

class Atm_Loc_Log {
  String? atmAddress;
  String? atmCity;
  String? atmDescription;
  String? atmId;
  String? atmLatitude;
  String? atmLongitude;
  String? instDesc;

  Atm_Loc_Log(
      {this.atmAddress,
      this.atmCity,
      this.atmDescription,
      this.atmId,
      this.atmLatitude,
      this.atmLongitude,
      this.instDesc});

  Atm_Loc_Log.fromJson(Map<String, dynamic> json) {
    atmAddress = json['atm_address'];
    atmCity = json['atm_city'];
    atmDescription = json['atm_description'];
    atmId = json['atm_id'];
    atmLatitude = json['atm_latitude'];
    atmLongitude = json['atm_longitude'];
    instDesc = json['inst_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['atm_address'] = this.atmAddress;
    data['atm_city'] = this.atmCity;
    data['atm_description'] = this.atmDescription;
    data['atm_id'] = this.atmId;
    data['atm_latitude'] = this.atmLatitude;
    data['atm_longitude'] = this.atmLongitude;
    data['inst_desc'] = this.instDesc;
    return data;
  }
}

class BankNews_Api {
  String? retCode;
  String? message;
  List<BankNews_Log>? data;

  BankNews_Api({this.retCode, this.message, this.data});

  BankNews_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BankNews_Log>[];
      json['data'].forEach((v) {
        data!.add(new BankNews_Log.fromJson(v));
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

class BankNews_Log {
  String? productId;
  String? productDate;
  String? givenName;
  String? productName;

  BankNews_Log(
      {this.productId, this.productDate, this.givenName, this.productName});

  BankNews_Log.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productDate = json['product_date'];
    givenName = json['given_name'];
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_date'] = this.productDate;
    data['given_name'] = this.givenName;
    data['product_name'] = this.productName;
    return data;
  }
}

class ProductandServices_Api {
  String? retCode;
  String? message;
  List<ProductandServices_Log>? data;

  ProductandServices_Api({this.retCode, this.message, this.data});

  ProductandServices_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductandServices_Log>[];
      json['data'].forEach((v) {
        data!.add(new ProductandServices_Log.fromJson(v));
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

class ProductandServices_Log {
  String? serviceId;
  String? serviceName;
  String? serviceDescription;
  bool? show;

  ProductandServices_Log(
      {this.serviceId, this.serviceName, this.serviceDescription, this.show});

  ProductandServices_Log.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceDescription = json['service_description'];
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_description'] = this.serviceDescription;
    data['show'] = this.show;
    return data;
  }
}

class Servicedowntime_Api {
  String? retCode;
  String? message;
  List<Servicedowntime_Log>? data;

  Servicedowntime_Api({this.retCode, this.message, this.data});

  Servicedowntime_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Servicedowntime_Log>[];
      json['data'].forEach((v) {
        data!.add(new Servicedowntime_Log.fromJson(v));
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

class Servicedowntime_Log {
  String? downtimeId;
  String? downtimeDesc;
  String? downtimeStart;
  String? downtimeEnd;
  String? clientType;

  Servicedowntime_Log(
      {this.downtimeId,
      this.downtimeDesc,
      this.downtimeStart,
      this.downtimeEnd,
      this.clientType});

  Servicedowntime_Log.fromJson(Map<String, dynamic> json) {
    downtimeId = json['downtime_id'];
    downtimeDesc = json['downtime_desc'];
    downtimeStart = json['downtime_start'];
    downtimeEnd = json['downtime_end'];
    clientType = json['client_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['downtime_id'] = this.downtimeId;
    data['downtime_desc'] = this.downtimeDesc;
    data['downtime_start'] = this.downtimeStart;
    data['downtime_end'] = this.downtimeEnd;
    data['client_type'] = this.clientType;
    return data;
  }
}

class Institution_Api {
  String? retCode;
  String? message;
  List<Institution_Log>? data;

  Institution_Api({this.retCode, this.message, this.data});

  Institution_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Institution_Log>[];
      json['data'].forEach((v) {
        data!.add(new Institution_Log.fromJson(v));
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

class Institution_Log {
  String? instCode;
  String? instDesc;
  String? createdDate;

  Institution_Log({this.instCode, this.instDesc, this.createdDate});

  Institution_Log.fromJson(Map<String, dynamic> json) {
    instCode = json['inst_code'];
    instDesc = json['inst_desc'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inst_code'] = this.instCode;
    data['inst_desc'] = this.instDesc;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Branch_Api {
  String? retCode;
  String? message;
  List<Branch_Log>? data;

  Branch_Api({this.retCode, this.message, this.data});

  Branch_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Branch_Log>[];
      json['data'].forEach((v) {
        data!.add(new Branch_Log.fromJson(v));
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

class Branch_Log {
  String? branchCode;
  String? branchDesc;
  String? createdDate;

  Branch_Log({this.branchCode, this.branchDesc, this.createdDate});

  Branch_Log.fromJson(Map<String, dynamic> json) {
    branchCode = json['branch_code'];
    branchDesc = json['branch_desc'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_code'] = this.branchCode;
    data['branch_desc'] = this.branchDesc;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Unit_Api {
  String? retCode;
  String? message;
  List<Unit_Log>? data;

  Unit_Api({this.retCode, this.message, this.data});

  Unit_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Unit_Log>[];
      json['data'].forEach((v) {
        data!.add(new Unit_Log.fromJson(v));
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

class Unit_Log {
  String? unitCode;
  String? unitDesc;
  String? createdDate;

  Unit_Log({this.unitCode, this.unitDesc, this.createdDate});

  Unit_Log.fromJson(Map<String, dynamic> json) {
    unitCode = json['unit_code'];
    unitDesc = json['unit_desc'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_code'] = this.unitCode;
    data['unit_desc'] = this.unitDesc;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Center_Api {
  String? retCode;
  String? message;
  List<Center_Log>? data;

  Center_Api({this.retCode, this.message, this.data});

  Center_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Center_Log>[];
      json['data'].forEach((v) {
        data!.add(new Center_Log.fromJson(v));
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

class Center_Log {
  String? centerCode;
  String? centerDesc;
  String? createdDate;

  Center_Log({this.centerCode, this.centerDesc, this.createdDate});

  Center_Log.fromJson(Map<String, dynamic> json) {
    centerCode = json['center_code'];
    centerDesc = json['center_desc'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['center_code'] = this.centerCode;
    data['center_desc'] = this.centerDesc;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Providers_Api {
  String? retCode;
  String? message;
  List<Providers_Log>? data;

  Providers_Api({this.retCode, this.message, this.data});

  Providers_Api.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Providers_Log>[];
      json['data'].forEach((v) {
        data!.add(new Providers_Log.fromJson(v));
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

class Providers_Log {
  String? id;
  String? providerName;
  String? description;
  String? providerAlias;
  String? status;
  String? lastSync;

  Providers_Log(
      {this.id,
      this.providerName,
      this.description,
      this.providerAlias,
      this.status,
      this.lastSync});

  Providers_Log.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerName = json['provider_name'];
    description = json['description'];
    providerAlias = json['provider_alias'];
    status = json['status'];
    lastSync = json['last_sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_name'] = this.providerName;
    data['description'] = this.description;
    data['provider_alias'] = this.providerAlias;
    data['status'] = this.status;
    data['last_sync'] = this.lastSync;
    return data;
  }
}
