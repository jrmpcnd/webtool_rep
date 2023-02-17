import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class User_Push {
  Future<http.Response> pushHttp2() async {
    http.Response response2 = await http.post(
      Uri.parse('http://10.21.0.74:1234/get_usermanagement/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "branch_names": "",
          "check_status": "",
          "given_name": "",
          "last_name": "",
          "middle_name": "",
          "user_login": ""
        },
      ),
    );
    if (response2.statusCode == 200) {
      print(response2.statusCode);
      print(response2.body);
      return response2;
    } else {
      return response2;
    }
  }
}

class UserParse {
  Future<User_Management> profile2() async {
    User_Push httpPush2 = User_Push();
    http.Response res2 = await httpPush2.pushHttp2();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var Umanagement = User_Management.fromJson(jsonDecode(res2.body));
    return Umanagement;
  }
}

class Role_Push {
  Future<http.Response> pushHttp() async {
    http.Response response = await http.post(
      Uri.parse('http://10.21.0.74:1234/get_rolesmanagement/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{"role_name": ""},
      ),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      return response;
    } else {
      return response;
    }
  }
}

class Role_Parse {
  Future<Role_Management> profile() async {
    Role_Push httpPush = Role_Push();
    http.Response res = await httpPush.pushHttp();
    print("-------->>>>>>>>>>${jsonDecode(res.body).length}");

    var Rmanagement = Role_Management.fromJson(jsonDecode(res.body));

    return Rmanagement;
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
class transacconfirm_Api {
  Future<http.Response> news(
      String branch_desc, cid, status, trans_date, trans_desc) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('http://10.21.0.74:1234/get_transconfirmation'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'branch_desc': branch_desc,
              'cid': cid,
              'status': status,
              'trans_date': trans_date,
              'trans_desc': trans_desc,
            },
          ),
        )
        .timeout(const Duration(minutes: 1));
    return getResponse;
  }
}

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

//API Dropdown
//Monitoring
class TransactionConfirm_API {
  Future<List> getCategory() async {
    List res = [];
    http.Response response = await http.get(Uri.parse(
        'http://10.21.0.74:1234/get_transaction_logs_status_dropdown'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class TransactionStatus_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http
        .get(Uri.parse('http://10.21.0.74:1234/get_tfc_status_dropdown/'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class Remittancelog_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http
        .get(Uri.parse('http://10.21.0.74:1234/get_rtl_status_dropdown/'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class SMSLogs_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_sms_logs_smstype_dropdown/'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class SMSLogsStatus_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_sms_logs_smsstatus_dropdown/'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class TransactionLogs_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http.get(Uri.parse(
        'http://10.21.0.74:1234/get_transaction_logs_transaction_dropdown/'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class TransactionLogsStatus_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http.get(Uri.parse(
        'http://10.21.0.74:1234/get_transaction_logs_status_dropdown'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class ListofUseDevice_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http
        .get(Uri.parse('http://10.21.0.74:1234/get_lud_clientype_dropdown'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class ListofUseDeviceStatus_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http
        .get(Uri.parse('http://10.21.0.74:1234/get_lud_status_dropdown'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

class FieldEnrollmentList_Api {
  Future<List> getStatus() async {
    List res = [];
    http.Response response = await http
        .get(Uri.parse('http://10.21.0.74:1234/get_fel_clienttype_dropdown'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body)['data'];
      res = jsonData;
      print(jsonDecode(response.body)['data']);
      return res;
    } else {
      throw 'connection error';
    }
  }
}

//Administration
class Um_userstatus_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_um_userstatus_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Hierarchy_Institution_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_hierarchy_insti_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Hierarchy_Unit_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_hierarchy_unit_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Hierarchy_Branch_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_hierarchy_branch_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Hierarchy_Center_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_hierarchy_center_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

//Utilities
class FeeStructure_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_fs_transaction_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Parameter_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_pc_parametertype_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class ProductType_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_pt_provider_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class ProductCategory_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_pt_provider_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class ProductCategory_ProductType_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_pc_producttype_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class BillerProduct_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_pt_provider_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class BillerProduct_Category_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_bp_productcategory_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class LoadProduct_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_lp_productcategory_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Partner_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_p_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

//Customer Service
class CSR_Dashboard_Concern_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_cs_concern_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class CSR_Dashboard_Status_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_cs_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class CSR_TypeofConcern_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_toc_complexity_level_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
//Reports Screen

class Account_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class ActiveatedMarchant_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Activity_History_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class CS_Dashboard_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class FailedEnrollment_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class IGate_Recentiliation_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class ListofAgent_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Login_Logout_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Mpin_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Reconn_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class RegisterClient_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Remmittance_Cancelled_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Remmittance_Claimed_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Remmittance_Sent_Status_Report_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class ResentSms_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class SmsLogs_ReSport_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Suspicious_Transaction_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Transaction_Logs_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Used_Device_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class User_Activity_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class Valid_Transaction_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

class WebtoolUser_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('http://10.21.0.74:1234/get_report_status_dropdown'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body)['data'];
        res = jsonData;
        print(jsonDecode(response.body)['data']);
        return res;
      } else {
        throw 'connection error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
