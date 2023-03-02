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