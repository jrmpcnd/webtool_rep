import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/providers/data_provider.dart';
import 'model2.dart';

class HierachyPush {
  Future<http.Response> pushHttp2() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_hierarchy'),
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

class HierarchyParse_Api {
  Future<Hierarchy_Api> profile3() async {
    HierachyPush httpPush2 = HierachyPush();
    http.Response res2 = await httpPush2.pushHttp2();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var Hierarchy = Hierarchy_Api.fromJson(jsonDecode(res2.body));
    return Hierarchy;
  }
}

class RemittanceL_Push {
  Future<http.Response> pushHttp2() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_remittancelog'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "Cancelled_By_Fullname": "",
          "Disbursed_By_Fullname": "",
          "Processed_By_Fullname": "",
          "Receiver_Name": "",
          "amount": "",
          "cancelled_date": "",
          "claimed_core_ref_id": "",
          "claimed_mobile_ref_id": "",
          "created_date": "",
          "id": "string",
          "last_updated_date": "",
          "reference_number _Ref_ID": "",
          "sender_mobile_number": "",
          "sender_name": "",
          "sent_core_ref_id": "",
          "sent_mobile_ref_id": "",
          "source_branch": "",
          "status": "",
          "target_branch": ""
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

class RemittanceL_Parse {
  Future<RemittanceLog_Api> profile6() async {
    RemittanceL_Push httpPush2 = RemittanceL_Push();
    http.Response res2 = await httpPush2.pushHttp2();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var RemittanceLog = RemittanceLog_Api.fromJson(jsonDecode(res2.body));
    return RemittanceLog;
  }
}

class ListofUserDevice_Push {
  Future<http.Response> pushHttp2() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_listuseddevice'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "created_date": "",
          "device_id": "",
          "device_model": "",
          "android_version": "",
          "cid": "",
          "branch_code": "",
          "mobile_number": "",
          "client_name": "",
          "client_type": "",
          "device_status": ""
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

class ListofUserDevice_Parse {
  Future<UseoflistDevice_Api> profile7() async {
    ListofUserDevice_Push httpPush2 = ListofUserDevice_Push();
    http.Response res2 = await httpPush2.pushHttp2();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var useoflistdevicelog =
        UseoflistDevice_Api.fromJson(jsonDecode(res2.body));
    return useoflistdevicelog;
  }
}

class Atm_Location_Push {
  Future<http.Response> pushHttp20() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_atmloc'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "atm_id": "",
          "inst_desc": "",
          "atm_description": "",
          "atm_address": "",
          "atm_city": ""
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

class Atm_Location_Parse {
  Future<Atm_Loc_Api> profile20() async {
    Atm_Location_Push httpPush20 = Atm_Location_Push();
    http.Response res2 = await httpPush20.pushHttp20();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var atmloclogs =
    Atm_Loc_Api.fromJson(jsonDecode(res2.body));
    return atmloclogs;
  }
}

class BankNews_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_banknews'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "product_id": "",
          "product_date": "",
          "given_name": "",
          "product_name": ""
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

class BanksNews_Parse {
  Future<BankNews_Api> profile21() async {
    BankNews_Push httpPush20 = BankNews_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var banknewslog =
    BankNews_Api.fromJson(jsonDecode(res2.body));
    return banknewslog;
  }
}


class ProductandServices_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_productservices'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "service_id": "",
          "service_name": "",
          "service_description": "",
          "show": "",
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

class ProductandServices_Parse {
  Future<ProductandServices_Api> profile22() async {
    ProductandServices_Push httpPush20 = ProductandServices_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var productandservices =
    ProductandServices_Api.fromJson(jsonDecode(res2.body));
    return productandservices;
  }
}


class Servicedowntime_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_servicedowntime'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "service_id": "",
          "service_name": "",
          "service_description": "",
          "show": "",
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

class Servicedowntime_Parse {
  Future<Servicedowntime_Api> profile23() async {
    Servicedowntime_Push httpPush20 = Servicedowntime_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var servicedowntime =
    Servicedowntime_Api.fromJson(jsonDecode(res2.body));
    return servicedowntime;
  }
}


class Institution_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_insti'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "inst_code": "",
          "inst_desc": "",
          "created_date": ""
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

class Institution_Parse {
  Future<Institution_Api> profile24() async {
    Institution_Push httpPush20 = Institution_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var institution =
    Institution_Api.fromJson(jsonDecode(res2.body));
    return institution;
  }
}


class Branch_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_branch'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "branch_code": "",
          "branch_desc": "",
          "created_date": ""
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

class Branch_Parse {
  Future<Branch_Api> profile24() async {
    Branch_Push httpPush20 = Branch_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var branch =
    Branch_Api.fromJson(jsonDecode(res2.body));
    return branch;
  }
}


class Unit_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_unit'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "unit_code": "",
          "unit_desc": "",
          "created_date": ""
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

class Unit_Parse {
  Future<Unit_Api> profile25() async {
    Unit_Push httpPush20 = Unit_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var unit =
  Unit_Api.fromJson(jsonDecode(res2.body));
    return unit;
  }
}

class Center_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_center'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "center_code": "",
          "center_desc": "",
          "created_date": ""
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

class Center_Parse {
  Future<Center_Api> profile26() async {
    Center_Push httpPush20 = Center_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var center =
    Center_Api.fromJson(jsonDecode(res2.body));
    return center;
  }
}

class Provider_Push {
  Future<http.Response> pushHttp21() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_provider'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "id": "",
          "provider_name": "",
          "description": "",
          "provider_alias": "",
          "status": "",
          "last_sync": ""
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

class Provider_Parse {
  Future<Providers_Api> profile26() async {
    Provider_Push httpPush20 = Provider_Push();
    http.Response res2 = await httpPush20.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res2.body).length}");
    var provider =
    Providers_Api.fromJson(jsonDecode(res2.body));
    return provider;
  }
}
