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
