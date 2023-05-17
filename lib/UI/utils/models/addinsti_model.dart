class AddinstiModel {
  String? setInstCode;
  String? setInstDesc;

  AddinstiModel({this.setInstCode, this.setInstDesc});

  AddinstiModel.fromJson(Map<String, dynamic> json) {
    setInstCode = json['set_inst_code'];
    setInstDesc = json['set_inst_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_inst_code'] = this.setInstCode;
    data['set_inst_desc'] = this.setInstDesc;
    return data;
  }
}

class AddbranchModel {
  String? setBranchCode;
  String? setBranchDesc;
  int? setCreatedBy;
  String? setCreatedDate;

  AddbranchModel(
      {this.setBranchCode,
      this.setBranchDesc,
      this.setCreatedBy,
      this.setCreatedDate});

  AddbranchModel.fromJson(Map<String, dynamic> json) {
    setBranchCode = json['set_branch_code'];
    setBranchDesc = json['set_branch_desc'];
    setCreatedBy = json['set_created_by'];
    setCreatedDate = json['set_created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_branch_code'] = this.setBranchCode;
    data['set_branch_desc'] = this.setBranchDesc;
    data['set_created_by'] = this.setCreatedBy;
    data['set_created_date'] = this.setCreatedDate;
    return data;
  }
}

class AddunitModel {
  int? setCreatedBy;
  String? setCreatedDate;
  String? setUnitCode;
  String? setUnitDesc;

  AddunitModel(
      {this.setCreatedBy,
      this.setCreatedDate,
      this.setUnitCode,
      this.setUnitDesc});

  AddunitModel.fromJson(Map<String, dynamic> json) {
    setCreatedBy = json['set_created_by'];
    setCreatedDate = json['set_created_date'];
    setUnitCode = json['set_unit_code'];
    setUnitDesc = json['set_unit_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_created_by'] = this.setCreatedBy;
    data['set_created_date'] = this.setCreatedDate;
    data['set_unit_code'] = this.setUnitCode;
    data['set_unit_desc'] = this.setUnitDesc;
    return data;
  }
}

class AddcenterModel {
  String? setCenterCode;
  String? setCenterDesc;
  int? setCreatedBy;
  String? setCreatedDate;

  AddcenterModel(
      {this.setCenterCode,
      this.setCenterDesc,
      this.setCreatedBy,
      this.setCreatedDate});

  AddcenterModel.fromJson(Map<String, dynamic> json) {
    setCenterCode = json['set_center_code'];
    setCenterDesc = json['set_center_desc'];
    setCreatedBy = json['set_created_by'];
    setCreatedDate = json['set_created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_center_code'] = this.setCenterCode;
    data['set_center_desc'] = this.setCenterDesc;
    data['set_created_by'] = this.setCreatedBy;
    data['set_created_date'] = this.setCreatedDate;
    return data;
  }
}

class AddproviderModel {
  int? setCreatedBy;
  String? setCreatedDate;
  String? setDescription;
  String? setProviderAlias;
  String? setProviderName;
  int? setStatus;

  AddproviderModel(
      {this.setCreatedBy,
      this.setCreatedDate,
      this.setDescription,
      this.setProviderAlias,
      this.setProviderName,
      this.setStatus});

  AddproviderModel.fromJson(Map<String, dynamic> json) {
    setCreatedBy = json['set_created_by'];
    setCreatedDate = json['set_created_date'];
    setDescription = json['set_description'];
    setProviderAlias = json['set_provider_alias'];
    setProviderName = json['set_provider_name'];
    setStatus = json['set_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_created_by'] = this.setCreatedBy;
    data['set_created_date'] = this.setCreatedDate;
    data['set_description'] = this.setDescription;
    data['set_provider_alias'] = this.setProviderAlias;
    data['set_provider_name'] = this.setProviderName;
    data['set_status'] = this.setStatus;
    return data;
  }
}

class AddbankModel {
  String? setBankBic;
  String? setBankCode;
  String? setBankName;
  int? setCreatedBy;
  String? setCreatedDate;
  String? setShortName;

  AddbankModel(
      {this.setBankBic,
      this.setBankCode,
      this.setBankName,
      this.setCreatedBy,
      this.setCreatedDate,
      this.setShortName});

  AddbankModel.fromJson(Map<String, dynamic> json) {
    setBankBic = json['set_bank_bic'];
    setBankCode = json['set_bank_code'];
    setBankName = json['set_bank_name'];
    setCreatedBy = json['set_created_by'];
    setCreatedDate = json['set_created_date'];
    setShortName = json['set_short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_bank_bic'] = this.setBankBic;
    data['set_bank_code'] = this.setBankCode;
    data['set_bank_name'] = this.setBankName;
    data['set_created_by'] = this.setCreatedBy;
    data['set_created_date'] = this.setCreatedDate;
    data['set_short_name'] = this.setShortName;
    return data;
  }
}
