class AdduserModel {
  String? setGivenName;
  String? setLastName;
  String? setMiddleName;
  String? setUserEmail;
  String? setUserName;
  String? setUserPhone;
  String? setUserStatus;
  String? setCheckStatus;

  AdduserModel(
      {
        this.setGivenName,
        this.setLastName,
        this.setMiddleName,
        this.setUserEmail,
        this.setUserName,
        this.setUserPhone,
        this.setUserStatus,
        this.setCheckStatus
      });

  AdduserModel.fromJson(Map<String, dynamic> json) {
    setGivenName = json['set_given_name'];
    setLastName = json['set_last_name'];
    setMiddleName = json['set_middle_name'];
    setUserEmail = json['set_user_email'];
    setUserName = json['set_user_name'];
    setUserPhone = json['set_user_phone'];
    setUserStatus = json['set_user_status'];
    setCheckStatus = json['set_check_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_given_name'] = this.setGivenName;
    data['set_last_name'] = this.setLastName;
    data['set_middle_name'] = this.setMiddleName;
    data['set_user_email'] = this.setUserEmail;
    data['set_user_name'] = this.setUserName;
    data['set_user_phone'] = this.setUserPhone;
    data['set_user_status'] = this.setUserStatus;
    return data;
  }
}
