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