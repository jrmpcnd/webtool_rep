import 'dart:convert';
import 'package:http/http.dart' as http;

// Administration API
class Usermanagement_Api {
  Future<http.Response> user(
    String fname,
    mname,
    lname,
    user_login,
    branch_names,
    check_status,
    roles,
  ) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://10.21.0.66:1111/get_usermanagement/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'given_name': fname,
              'middle_name': mname,
              'last_name': lname,
              'user_login': user_login,
              'branch_names': branch_names,
              'check_status': check_status,
              'roles': roles,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));

    return getResponse;
  }
}

class Rolemanagement_Api {
  Future<http.Response> role(String role_name) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_rolesmanagement/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'role_name': role_name,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Hierarchy_Api {
  Future<http.Response> inquire(String searchBankNews) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_banknews/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'search_banknews': searchBankNews,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

// Enrollment API
class Clientlist_Api {
  Future<http.Response> inquire(String searchBankNews) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_banknews/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'search_banknews': searchBankNews,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

// Monitoring API
class Banknews_Api {
  Future<http.Response> news(String searchBankNews) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_banknews/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'search_banknews': searchBankNews,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Clientprofile_Api {
  Future<http.Response> profile(
    String cid,
    username,
    mobile,
  ) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_clientprofile/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'cid': cid,
              'username': username,
              'mobile': mobile,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

// Utilities API
class Feestructure_Api {
  Future<http.Response> fee(String search_feestructure) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_feestructure/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'search_feestructure': search_feestructure,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Institution_Api {
  Future<http.Response> insti(String insti_code, insti_desc) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_insti/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'inst_code': insti_code,
              'inst_desc': insti_desc,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Branch_Api {
  Future<http.Response> branch(String branch_code, branch_desc) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_branch/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'branch_code': branch_code,
              'branch_desc': branch_desc,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Unit_Api {
  Future<http.Response> unit(String unit_code, unit_desc) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_unit/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'unit_code': unit_code,
              'unit_desc': unit_desc,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Center_Api {
  Future<http.Response> center(String center_code, center_desc) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_center/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'center_code': center_code,
              'center_desc': center_desc,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Provider_Api {
  Future<http.Response> provider(String provider_code, provider_desc) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_provider/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'provider_code': provider_code,
              'provider_desc': provider_desc,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

class Productandservices_Api {
  Future<http.Response> product(String search_productservices) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_productservices/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'search_productservices': search_productservices,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

//Customer Service API
class Broadcastmessage_Api {
  Future<http.Response> customers(String search_productservices) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://192.168.0.148:1111/get_productservices/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'search_productservices': search_productservices,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}
