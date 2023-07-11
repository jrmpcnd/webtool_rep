import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/providers/data_provider.dart';
import 'model2.dart';
import 'token.dart';
import 'model.dart';

//Administration
class User_Push {
  Future<http.Response> pushHttp2() async {
    http.Response response2 = await http.post(
      Uri.parse('$API/get_usermanagement/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Token.getToken()}'
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
      Uri.parse('$API/get_rolesmanagement'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Token.getToken()}'
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

//Monitoring

class Tconfirmation_Push {
  Future<http.Response> pushHttp3() async {
    http.Response response3 = await http.post(
      Uri.parse('$API/get_transconfirmation/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "branch_desc": "",
          "center_desc": "",
          "cid": "",
          "client_mobile_no": "",
          "client_name": "",
          "note": "",
          "status": "",
          "start_date": "",
          "trans_desc": "",
          "unit_desc": ""
        },
      ),
    );
    if (response3.statusCode == 200) {
      print(response3.statusCode);
      print(response3.body);
      return response3;
    } else {
      return response3;
    }
  }
}

class TconfirmationParse {
  Future<Transaction_Confirmation> profile3() async {
    Tconfirmation_Push httpPush3 = Tconfirmation_Push();
    http.Response res3 = await httpPush3.pushHttp3();
    print("-----e2423423--->>>>>>>>>>${jsonDecode(res3.body).length}");
    var Confirmation = Transaction_Confirmation.fromJson(jsonDecode(res3.body));
    return Confirmation;
  }
}

class Sms_Push {
  Future<http.Response> pushHttp5() async {
    http.Response response5 = await http.post(
      Uri.parse('$API/get_smslog/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Token.getToken()}'
      },
      body: jsonEncode(
        <String, String>{
          "activity": "",
          "cid": "",
          "msg_command": "",
          "msg_id": "",
          "msg_sent_date": "",
          "msg_status": "",
          "msisdn": "",
          "name": ""
        },
      ),
    );
    if (response5.statusCode == 200) {
      print(response5.statusCode);
      print(response5.body);
      return response5;
    } else {
      return response5;
    }
  }
}
// comment

class SmsParse {
  Future<Sms_Logs> profile5() async {
    Sms_Push httpPush5 = Sms_Push();
    http.Response res5 = await httpPush5.pushHttp5();
    print("-------->>>>>>>>>>${jsonDecode(res5.body).length}");
    var sms = Sms_Logs.fromJson(jsonDecode(res5.body));
    return sms;
  }
}

class Agent_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_agentdashboard/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "aap": "",
          "agent_assisted_payment": "",
          "bill_payment": "",
          "bp": "",
          "branch_desc": "",
          "cash_in": "",
          "cash_out": "",
          "ci": "",
          "client_name": "",
          "co": "",
          "id": "",
          "sum": "",
          "sum_income": "",
          "total": "",
          "total_income": ""
        },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class AgentParse {
  Future<Agent_Dashboard> profile6() async {
    Agent_Push httpPush6 = Agent_Push();
    http.Response res6 = await httpPush6.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var agent = Agent_Dashboard.fromJson(jsonDecode(res6.body));
    return agent;
  }
}

class Failed_Push {
  Future<http.Response> pushHttp7() async {
    http.Response response7 = await http.post(
      Uri.parse('$API/get_failedenrollment/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "account_number": "",
          "client_type": "",
          "created_date": "",
          "date_of_birth": "",
          "device_id": "",
          "device_model": "",
          "error_message": "",
          "id": "",
          "mobile_number": ""
        },
      ),
    );
    if (response7.statusCode == 200) {
      print(response7.statusCode);
      print(response7.body);
      return response7;
    } else {
      return response7;
    }
  }
}

class FailedParse {
  Future<Failed_Enrollment> profile7() async {
    Failed_Push httpPush6 = Failed_Push();
    http.Response res7 = await httpPush6.pushHttp7();
    print("-------->>>>>>>>>>${jsonDecode(res7.body).length}");
    var failed = Failed_Enrollment.fromJson(jsonDecode(res7.body));
    return failed;
  }
}

class List_of_Agent_Push {
  Future<http.Response> pushHttp8() async {
    http.Response response8 = await http.post(
      Uri.parse('$API/get_listofagent/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "a.inst_desc": "",
          "c.branch_desc": "",
          "c.center_desc": "",
          "c.cid": "",
          "c.date_and_time": "",
          "c.fullname": "",
          "c.mobile_no": "",
          "c.unit_desc": "",
          "i.user_name": ""
        },
      ),
    );
    if (response8.statusCode == 200) {
      print(response8.statusCode);
      print(response8.body);
      return response8;
    } else {
      return response8;
    }
  }
}

class ListAgentParse {
  Future<List_Agent> profile8() async {
    List_of_Agent_Push httpPush8 = List_of_Agent_Push();
    http.Response res8 = await httpPush8.pushHttp8();
    print("-------->>>>>>>>>>${jsonDecode(res8.body).length}");
    var listagent = List_Agent.fromJson(jsonDecode(res8.body));
    return listagent;
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

// Customer Service API

class Broadcast_MessagePush {
  Future<http.Response> pushHttp9() async {
    http.Response response9 = await http.post(
      Uri.parse('$API/get_broadcastsms/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "inbox_date": "",
          "inbox_desc": "",
          "inbox_id": "",
          "period_end": "",
          "period_start": "",
          "subject": ""
        },
      ),
    );
    if (response9.statusCode == 200) {
      print(response9.statusCode);
      print(response9.body);
      return response9;
    } else {
      return response9;
    }
  }
}

class Broadcast_MessageParse {
  Future<Broadcast_Message> profile9() async {
    Broadcast_MessagePush httpPush9 = Broadcast_MessagePush();
    http.Response res9 = await httpPush9.pushHttp9();
    print("-------->>>>>>>>>>${jsonDecode(res9.body).length}");
    var broadcast = Broadcast_Message.fromJson(jsonDecode(res9.body));
    return broadcast;
  }
}

class Type_ConcernPush {
  Future<http.Response> pushHttp10() async {
    http.Response response10 = await http.post(
      Uri.parse('$API/get_concerntype/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "concern_code": "",
          "concern_level": "",
          "concern_name": "",
          "concern_time": ""
        },
      ),
    );
    if (response10.statusCode == 200) {
      print(response10.statusCode);
      print(response10.body);
      return response10;
    } else {
      return response10;
    }
  }
}

class Type_ConcernParse {
  Future<Type_of_Concern> profile10() async {
    Type_ConcernPush httpPush10 = Type_ConcernPush();
    http.Response res10 = await httpPush10.pushHttp10();
    print("-------->>>>>>>>>>${jsonDecode(res10.body).length}");
    var concern = Type_of_Concern.fromJson(jsonDecode(res10.body));
    return concern;
  }
}

class CSR_HotlinePush {
  Future<http.Response> pushHttp11() async {
    http.Response response11 = await http.post(
      Uri.parse('$API/get_csrhotline/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "contact_number": "",
          "id": "",
          "inst_desc": "",
          "network_provider": ""
        },
      ),
    );
    if (response11.statusCode == 200) {
      print(response11.statusCode);
      print(response11.body);
      return response11;
    } else {
      return response11;
    }
  }
}

class CSR_HotlineParse {
  Future<CSR_Hotline> profile11() async {
    CSR_HotlinePush httpPush11 = CSR_HotlinePush();
    http.Response res11 = await httpPush11.pushHttp11();
    print("-------->>>>>>>>>>${jsonDecode(res11.body).length}");
    var hotline = CSR_Hotline.fromJson(jsonDecode(res11.body));
    return hotline;
  }
}

class Fee_StructurePush {
  Future<http.Response> pushHttp12() async {
    http.Response response12 = await http.post(
      Uri.parse('$API/get_feestructure/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "Range": "",
          "agent_income": "",
          "agent_target_income": "",
          "bancnet_income": "",
          "bank_income": "",
          "fee_id": "",
          "total_charge": "",
          "trans_type": "",
          "clientType;": "",
        },
      ),
    );
    if (response12.statusCode == 200) {
      print(response12.statusCode);
      print(response12.body);
      return response12;
    } else {
      return response12;
    }
  }
}

class Fee_StructureParse {
  Future<Fee_Structure> profile12() async {
    Fee_StructurePush httpPush12 = Fee_StructurePush();
    http.Response res12 = await httpPush12.pushHttp12();
    print("-------->>>>>>>>>>${jsonDecode(res12.body).length}");
    var fee = Fee_Structure.fromJson(jsonDecode(res12.body));
    return fee;
  }
}

class Prov_ConfigPush {
  Future<http.Response> pushHttp13() async {
    http.Response response13 = await http.post(
      Uri.parse('$API/get_paramconfig/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "app_type": "",
          "param_desc": "",
          "param_id": "",
          "param_name": "",
          "param_value": ""
        },
      ),
    );
    if (response13.statusCode == 200) {
      print(response13.statusCode);
      print(response13.body);
      return response13;
    } else {
      return response13;
    }
  }
}

class Prov_ConfigParse {
  Future<Prov_Config> profile13() async {
    Prov_ConfigPush httpPush13 = Prov_ConfigPush();
    http.Response res13 = await httpPush13.pushHttp13();
    print("-------->>>>>>>>>>${jsonDecode(res13.body).length}");
    var prov = Prov_Config.fromJson(jsonDecode(res13.body));
    return prov;
  }
}

class Product_TypePush {
  Future<http.Response> pushHttp14() async {
    http.Response response14 = await http.post(
      Uri.parse('$API/get_producttype/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "description": "",
          "id": "",
          "last_sync": "",
          "product_type_id": "",
          "product_type_name": "",
          "provider_name": "",
          "status": ""
        },
      ),
    );
    if (response14.statusCode == 200) {
      print(response14.statusCode);
      print(response14.body);
      return response14;
    } else {
      return response14;
    }
  }
}

class Product_TypeParse {
  Future<Product_Type> profile14() async {
    Product_TypePush httpPush14 = Product_TypePush();
    http.Response res14 = await httpPush14.pushHttp14();
    print("-------->>>>>>>>>>${jsonDecode(res14.body).length}");
    var product = Product_Type.fromJson(jsonDecode(res14.body));
    return product;
  }
}

class Product_CategoryPush {
  Future<http.Response> pushHttp15() async {
    http.Response response15 = await http.post(
      Uri.parse('$API/get_productcategory/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "description": "",
          "id": "",
          "last_sync": "",
          "product_type_id": "",
          "product_type_name": "",
          "provider_name": "",
          "status": ""
        },
      ),
    );
    if (response15.statusCode == 200) {
      print(response15.statusCode);
      print(response15.body);
      return response15;
    } else {
      return response15;
    }
  }
}

class Product_CategoryParse {
  Future<Product_Category> profile15() async {
    Product_CategoryPush httpPush15 = Product_CategoryPush();
    http.Response res15 = await httpPush15.pushHttp15();
    print("-------->>>>>>>>>>${jsonDecode(res15.body).length}");
    var category = Product_Category.fromJson(jsonDecode(res15.body));
    return category;
  }
}

class Biller_ProductPush {
  Future<http.Response> pushHttp16() async {
    http.Response response16 = await http.post(
      Uri.parse('$API/get_billerproduct/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "bank_commission": "",
          "biller_product_id": "",
          "biller_product_name": "",
          "description": "",
          "product_category_name": "",
          "provider_name": "",
          "service_fee": "",
          "status": ""
        },
      ),
    );
    if (response16.statusCode == 200) {
      print(response16.statusCode);
      print(response16.body);
      return response16;
    } else {
      return response16;
    }
  }
}

class Biller_ProductParse {
  Future<Biller_Product> profile16() async {
    Biller_ProductPush httpPush16 = Biller_ProductPush();
    http.Response res16 = await httpPush16.pushHttp16();
    print("-------->>>>>>>>>>${jsonDecode(res16.body).length}");
    var biller = Biller_Product.fromJson(jsonDecode(res16.body));
    return biller;
  }
}

class Load_ProductPush {
  Future<http.Response> pushHttp17() async {
    http.Response response17 = await http.post(
      Uri.parse('$API/get_loadproduct/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "bank_commission": "",
          "biller_product_id": "",
          "biller_product_name": "",
          "description": "",
          "product_category_name": "",
          "provider_name": "",
          "service_fee": "",
          "status": ""
        },
      ),
    );
    if (response17.statusCode == 200) {
      print(response17.statusCode);
      print(response17.body);
      return response17;
    } else {
      return response17;
    }
  }
}

class Load_ProductParse {
  Future<Load_Product> profile17() async {
    Load_ProductPush httpPush16 = Load_ProductPush();
    http.Response res17 = await httpPush16.pushHttp17();
    print("-------->>>>>>>>>>${jsonDecode(res17.body).length}");
    var load = Load_Product.fromJson(jsonDecode(res17.body));
    return load;
  }
}

class Commission_SetupPush {
  Future<http.Response> pushHttp18() async {
    http.Response response18 = await http.post(
      Uri.parse('$API/get_commission/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "agent_income": "",
          "bank_income": "",
          "bank_partner_income": "",
          "commission_type": "",
          "customer_income": "",
          "id": "",
          "trans_type": ""
        },
      ),
    );
    if (response18.statusCode == 200) {
      print(response18.statusCode);
      print(response18.body);
      return response18;
    } else {
      return response18;
    }
  }
}

class Commission_SetupParse {
  Future<Commission_Setup> profile18() async {
    Commission_SetupPush httpPush18 = Commission_SetupPush();
    http.Response res17 = await httpPush18.pushHttp18();
    print("-------->>>>>>>>>>${jsonDecode(res17.body).length}");
    var load = Commission_Setup.fromJson(jsonDecode(res17.body));
    return load;
  }
}

class Bank_ListPush {
  Future<http.Response> pushHttp19() async {
    http.Response response19 = await http.post(
      Uri.parse('$API/get_banklist/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "bank_bic": "",
          "bank_code": "",
          "bank_name": "",
          "id": "",
          "short_name": ""
        },
      ),
    );
    if (response19.statusCode == 200) {
      print(response19.statusCode);
      print(response19.body);
      return response19;
    } else {
      return response19;
    }
  }
}

class Bank_ListParse {
  Future<Bank_List> profile19() async {
    Bank_ListPush httpPush18 = Bank_ListPush();
    http.Response res17 = await httpPush18.pushHttp19();
    print("-------->>>>>>>>>>${jsonDecode(res17.body).length}");
    var list = Bank_List.fromJson(jsonDecode(res17.body));
    return list;
  }
}

class Partner_ListPush {
  Future<http.Response> pushHttp20() async {
    http.Response response20 = await http.post(
      Uri.parse('$API/get_partnerlist/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "merchant_id_prefix": "",
          "merchant_payment_callback_url": "",
          "mri_group": "",
          "partner_account": "",
          "partner_api_url": "",
          "partner_desc": "",
          "partner_id": "",
          "partner_name": "",
          "status": ""
        },
      ),
    );
    if (response20.statusCode == 200) {
      print(response20.statusCode);
      print(response20.body);
      return response20;
    } else {
      return response20;
    }
  }
}

class Partner_listParse {
  Future<Partner_List> profile20() async {
    Partner_ListPush httpPush18 = Partner_ListPush();
    http.Response res17 = await httpPush18.pushHttp20();
    print("-------->>>>>>>>>>${jsonDecode(res17.body).length}");
    var partner = Partner_List.fromJson(jsonDecode(res17.body));
    return partner;
  }
}

class Splash_ScreenPush {
  Future<http.Response> pushHttp21() async {
    http.Response response21 = await http.post(
      Uri.parse('$API/get_splashscreen/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "action": "",
          "image_url": "",
          "message": "",
          "show": "",
          "sub_message": "",
          "title": ""
        },
      ),
    );
    if (response21.statusCode == 200) {
      print(response21.statusCode);
      print(response21.body);
      return response21;
    } else {
      return response21;
    }
  }
}

class Splash_ScreenParse {
  Future<Splash_Screen> profile21() async {
    Splash_ScreenPush httpPush18 = Splash_ScreenPush();
    http.Response res17 = await httpPush18.pushHttp21();
    print("-------->>>>>>>>>>${jsonDecode(res17.body).length}");
    var partner = Splash_Screen.fromJson(jsonDecode(res17.body));
    return partner;
  }
}

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

class Unit_Update {
  Future<http.Response> unit(
      String get_unit_code, get_unit_desc, get_unit_id) async {
    http.Response getResponse = await http
        .post(
          Uri.parse('https://sit-api-janus.fortress-asya.com:1234/edit_unit/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              "get_unit_code": get_unit_code,
              "get_unit_desc": get_unit_desc,
              "get_unit_id": get_unit_id,
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
    http.Response response =
        await http.get(Uri.parse('$API/get_tfc_transaction_dropdown'));
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
    http.Response response =
        await http.get(Uri.parse('$API/get_tfc_status_dropdown/'));
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
    http.Response response =
        await http.get(Uri.parse('$API/get_rtl_status_dropdown/'));
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
    http.Response response =
        await http.get(Uri.parse('$API/get_sms_logs_smstype_dropdown/'));
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
    http.Response response =
        await http.get(Uri.parse('$API/get_sms_logs_smsstatus_dropdown/'));
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
    http.Response response = await http
        .get(Uri.parse('$API/get_transaction_logs_transaction_dropdown/'));
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
    http.Response response =
        await http.get(Uri.parse('$API/get_transaction_logs_status_dropdown'));
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
    http.Response response =
        await http.get(Uri.parse('$API/get_lud_clientype_dropdown'));
    print("hi" + response.statusCode.toString());
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
    http.Response response =
        await http.get(Uri.parse('$API/get_lud_status_dropdown'));
    print(response.statusCode);
    if (response.statusCode == 201) {
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
    http.Response response =
        await http.get(Uri.parse('$API/get_fel_clienttype_dropdown'));
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
        Uri.parse('$API/get_um_userstatus_dropdown'),
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
        Uri.parse('$API/get_hierarchy_insti_dropdown'),
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
        Uri.parse('$API/get_hierarchy_unit_dropdown'),
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
        Uri.parse('$API/get_hierarchy_branch_dropdown'),
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
        Uri.parse('$API/get_hierarchy_center_dropdown'),
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
        Uri.parse('$API/get_fs_transaction_dropdown'),
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

class FeeStructureEdit_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('$API/get_edit_fs_clienttype_dropdown'),
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
        Uri.parse('$API/get_pc_parametertype_dropdown'),
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
        Uri.parse('$API/get_pt_provider_dropdown'),
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
        Uri.parse('$API/get_pt_provider_dropdown'),
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
        Uri.parse('$API/get_pc_producttype_dropdown'),
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
        Uri.parse('$API/get_pt_provider_dropdown'),
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
        Uri.parse('$API/get_bp_productcategory_dropdown'),
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
        Uri.parse('$API/get_lp_productcategory_dropdown'),
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
        Uri.parse('$API/get_p_status_dropdown'),
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
        Uri.parse('$API/get_cs_concern_dropdown'),
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
        Uri.parse('$API/get_cs_status_dropdown'),
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
        Uri.parse('$API/get_toc_complexity_level_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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
        Uri.parse('$API/get_report_status_dropdown'),
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

class Usermanagementdropdown_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('$API/get_um_userstatus_dropdown'),
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

class Logout {
  Future<http.Response> logout(user_login) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/Logout/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Token.getToken()}',
        },
        body: jsonEncode(<String, String>{
          'user_login': user_login,
        }));
    return response;
  }
}

class PartnerMRI_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('$API/get_partner_mri_dropdown'),
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

class Splashscreen_Api {
  Future<List> getUserstatus() async {
    try {
      List res = [];
      http.Response response = await http.get(
        Uri.parse('$API/get_splash_chose_dropdown'),
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

class Report_Claim_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_remittanceclaimedreport/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
      <String, String>{
      "reportId" : "",
      "reportParam" : "",
      "userName" : "",
      "branchDesc" : "",
      "submitedDate" : "",
      "completedDate" : "",
      "reportStatus" : "",
      "fileType" : "",
      "remark" : "",
      },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class Report_Claim_Parse {
  Future<Remittance_Claim_Api> profile6() async {
    Report_Claim_Push httpreport_Claim = Report_Claim_Push();
    http.Response res6 = await httpreport_Claim.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var report_claim = Remittance_Claim_Api.fromJson(jsonDecode(res6.body));
    return report_claim;
  }
}

class Report_Cancel_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_remittancecancelledreport/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "reportId" : "",
          "reportParam" : "",
          "userName" : "",
          "branchDesc" : "",
          "submitedDate" : "",
          "completedDate" : "",
          "reportStatus" : "",
          "fileType" : "",
          "remark" : "",
        },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class Report_Cancel_Parse {
  Future<Remittance_Claim_Api> profile6() async {
    Report_Claim_Push httpreport_Claim = Report_Claim_Push();
    http.Response res6 = await httpreport_Claim.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var report_claim = Remittance_Claim_Api.fromJson(jsonDecode(res6.body));
    return report_claim;
  }
}

class Webtool_User_Report_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_webreport/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "reportId" : "",
          "reportParam" : "",
          "userName" : "",
          "branchDesc" : "",
          "submitedDate" : "",
          "completedDate" : "",
          "reportStatus" : "",
          "fileType" : "",
          "remark" : "",
        },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class Webtool_User_Report_Parse {
  Future<Webtool_User_Listing_Api> profile6() async {
    Webtool_User_Report_Push httptranslog = Webtool_User_Report_Push();
    http.Response res6 = await httptranslog.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var webtool_listing = Webtool_User_Listing_Api.fromJson(jsonDecode(res6.body));
    return webtool_listing;
  }
}

class Transaction_Logs_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_transreport/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
       "reportId" : "",
       "reportParam" : "",
       "userName" : "",
       "branchDesc" : "",
       "submitedDate" : "",
     "completedDate" : "",
       "reportStatus" : "",
       "fileType" : "",
       "remark" : "",
        },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class Transaction_Logs_Parse {
  Future<Transaction_log_Api> profile6() async {
    Transaction_Logs_Push httptranslog = Transaction_Logs_Push();
    http.Response res6 = await httptranslog.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var transaction_report = Transaction_log_Api.fromJson(jsonDecode(res6.body));
    return transaction_report;
  }
}

class Remittance_Sent_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_remittancesentreport/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "reportId" : "",
          "reportParam" : "",
          "userName" : "",
          "branchDesc" : "",
          "submitedDate" : "",
          "completedDate" : "",
          "reportStatus" : "",
          "fileType" : "",
          "remark" : "",
        },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class Remittance_Sent_Parse {
  Future<Remittance_Sent_Api> profile6() async {
    Remittance_Sent_Push httptranslog = Remittance_Sent_Push();
    http.Response res6 = await httptranslog.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var remittance_sent = Remittance_Sent_Api.fromJson(jsonDecode(res6.body));
    return remittance_sent;
  }
}


class Active_History_Push {
  Future<http.Response> pushHttp6() async {
    http.Response response6 = await http.post(
      Uri.parse('$API/get_activityhistoryreport/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njk5NDQ0NjAsImlzQWRtaW4iOnRydWUsInVzZXIiOnsiY2lkIjpudWxsLCJtb2JpbGUiOm51bGwsInVzZXJuYW1lIjpudWxsfX0.uzPKB5VQ_Ru_Z0LdA49cz4QUT8pOCVCeiX8LVSV2AHE'
      },
      body: jsonEncode(
        <String, String>{
          "reportId" : "",
          "reportParam" : "",
          "userName" : "",
          "branchDesc" : "",
          "submitedDate" : "",
          "completedDate" : "",
          "reportStatus" : "",
          "fileType" : "",
          "remark" : "",
        },
      ),
    );
    if (response6.statusCode == 200) {
      print(response6.statusCode);
      print(response6.body);
      return response6;
    } else {
      return response6;
    }
  }
}

class Active_History_Parse {
  Future<Active_History_Api> profile6() async {
    Active_History_Push httptranslog = Active_History_Push();
    http.Response res6 = await httptranslog.pushHttp6();
    print("-------->>>>>>>>>>${jsonDecode(res6.body).length}");
    var active_history = Active_History_Api.fromJson(jsonDecode(res6.body));
    return active_history;
  }
}


