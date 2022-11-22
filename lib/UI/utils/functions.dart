import 'package:http/http.dart' as http;
import 'api.dart';

// Administrator
class Usermanagement_Function {
  static void user({
    String fname = '',
    String mname = '',
    String lname = '',
    String user_login = '',
    String branch_names = '',
    String check_status = '',
    String roles = '',
  }) async {
    Usermanagement_Api api = Usermanagement_Api();
    http.Response getParamReturn = await api.user(
      fname,
      mname,
      lname,
      user_login,
      branch_names,
      check_status,
      roles,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Rolemanagement_Function {
  static void role({String role_name = ''}) async {
    Rolemanagement_Api api = Rolemanagement_Api();
    http.Response getParamReturn = await api.role(role_name);
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Hierarchy_Function {
  static void role({String search_role = ''}) async {
    Rolemanagement_Api api = Rolemanagement_Api();
    http.Response getParamReturn = await api.role(search_role);
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

// Enrollment
// class Clientlist_Function {
//   static void inquire({String search_banknews = ''}) async {
//     Banknews_Api api = Banknews_Api();
//     http.Response getParamReturn = await api.inquire(search_banknews);
//     print(getParamReturn.statusCode);
//     print(getParamReturn.body);
//   }
// }

// Monitoring
class Banknews_Function {
  static void news({String search_banknews = ''}) async {
    Banknews_Api api = Banknews_Api();
    http.Response getParamReturn = await api.news(search_banknews);
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Clientprofile_Function {
  static void profile({
    String cid = '',
    String username = '',
    String mobile = '',
  }) async {
    Clientprofile_Api api = Clientprofile_Api();
    http.Response getParamReturn = await api.profile(
      cid,
      username,
      mobile,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

// Utilities
class Feestructure_Function {
  static void product({String trans_type = ''}) async {
    Feestructure_Api api = Feestructure_Api();
    http.Response getParamReturn = await api.fee(trans_type);
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Institution_Function {
  static void insti({
    String insti_code = '',
    String insti_desc = '',
  }) async {
    Institution_Api api = Institution_Api();
    http.Response getParamReturn = await api.insti(
      insti_code,
      insti_desc,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Branch_Function {
  static void branch({
    String branch_code = '',
    String branch_desc = '',
  }) async {
    Branch_Api api = Branch_Api();
    http.Response getParamReturn = await api.branch(
      branch_code,
      branch_desc,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Unit_Function {
  static void unit({
    String unit_code = '',
    String unit_desc = '',
  }) async {
    Unit_Api api = Unit_Api();
    http.Response getParamReturn = await api.unit(
      unit_code,
      unit_desc,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Center_Function {
  static void center({
    String center_code = '',
    String center_desc = '',
  }) async {
    Center_Api api = Center_Api();
    http.Response getParamReturn = await api.center(
      center_code,
      center_desc,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Provider_Function {
  static void provider({
    String provider_code = '',
    String provider_desc = '',
  }) async {
    Provider_Api api = Provider_Api();
    http.Response getParamReturn = await api.provider(
      provider_code,
      provider_desc,
    );
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}

class Productandservices_Function {
  static void product({String search_productservices = ''}) async {
    Productandservices_Api api = Productandservices_Api();
    http.Response getParamReturn = await api.product(search_productservices);
    print(getParamReturn.statusCode);
    print(getParamReturn.body);
  }
}
