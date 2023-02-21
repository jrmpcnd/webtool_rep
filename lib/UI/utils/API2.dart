import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'model.dart';
import 'model2.dart';

class HierachyPush {
  Future<http.Response> pushHttp2() async {
    http.Response response2 = await http.post(
      Uri.parse('http://10.21.0.74:1234/get_hierarchy'),
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