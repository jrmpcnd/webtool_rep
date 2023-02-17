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
