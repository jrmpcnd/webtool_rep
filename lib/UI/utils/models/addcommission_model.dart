class AddCommisionModel {
  String? setAgentIncome;
  String? setBankIncome;
  String? setBankPartnerIncome;
  String? setCommissionType;
  int? setCreatedBy;
  String? setCreatedDate;
  String? setCustomerIncome;
  String? setTransType;

  AddCommisionModel(
      {this.setAgentIncome,
        this.setBankIncome,
        this.setBankPartnerIncome,
        this.setCommissionType,
        this.setCreatedBy,
        this.setCreatedDate,
        this.setCustomerIncome,
        this.setTransType});

  AddCommisionModel.fromJson(Map<String, dynamic> json) {
    setAgentIncome = json['set_agent_income'];
    setBankIncome = json['set_bank_income'];
    setBankPartnerIncome = json['set_bank_partner_income'];
    setCommissionType = json['set_commission_type'];
    setCreatedBy = json['set_created_by'];
    setCreatedDate = json['set_created_date'];
    setCustomerIncome = json['set_customer_income'];
    setTransType = json['set_trans_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_agent_income'] = this.setAgentIncome;
    data['set_bank_income'] = this.setBankIncome;
    data['set_bank_partner_income'] = this.setBankPartnerIncome;
    data['set_commission_type'] = this.setCommissionType;
    data['set_created_by'] = this.setCreatedBy;
    data['set_created_date'] = this.setCreatedDate;
    data['set_customer_income'] = this.setCustomerIncome;
    data['set_trans_type'] = this.setTransType;
    return data;
  }
}
