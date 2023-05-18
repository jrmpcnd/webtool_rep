import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/UI/utils/models/addinsti_model.dart';

class AddinstiAPI {
  Future<http.Response> addinstiapi(
    String set_insti_code,
    String set_inst_desc,
  ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_insti/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddinstiModel(
        setInstCode: set_insti_code,
        setInstDesc: set_inst_desc,
      )),
    );
    return response;
  }
}

class AddbranchAPI {
  Future<http.Response> addbranchapi(
    String set_branch_code,
    String set_branch_desc,
  ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_branch/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddbranchModel(
        setBranchCode: set_branch_code,
        setBranchDesc: set_branch_desc,
      )),
    );
    return response;
  }
}

class AddunitAPI {
  Future<http.Response> addunitapi(
    String set_unit_code,
    String set_unit_desc,
  ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_unit/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddunitModel(
        setUnitCode: set_unit_code,
        setUnitDesc: set_unit_desc,
      )),
    );
    return response;
  }
}

class AddcenterAPI {
  Future<http.Response> addcenterapi(
    String set_center_code,
    String set_center_desc,
  ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_center/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddcenterModel(
        setCenterCode: set_center_code,
        setCenterDesc: set_center_desc,
      )),
    );
    return response;
  }
}
// ---------- Dpa tapos --------
// class AddproviderAPI {
//   Future<http.Response> addproviderapi(
//     String set_provider_code,
//     String set_provider_desc,
//   ) async {
//     String url =
//         'https://sit-api-janus.fortress-asya.com:1234/create_provider/';
//     final http.Response response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8'
//       },
//       body: jsonEncode(AddproviderModel(
//         setCenterCode: set_provider_code,
//         setCenterDesc: set_provider_code,
//       )),
//     );
//     return response;
//   }
// }

class AddbankAPI {
  Future<http.Response> addbankapi(
    String set_bank_code,
    String set_bank_name,
    String set_short_name,
    String set_bank_bic,
  ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/create_bank/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddbankModel(
        setBankCode: set_bank_code,
        setBankName: set_bank_name,
        setShortName: set_short_name,
        setBankBic: set_bank_bic,
      )),
    );
    return response;
  }
}

class DeleteInstitution {
  Future<http.Response> deleteinstitution(drop_id
      // drop_insti
      ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/drop_insti/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "drop_id": drop_id,
          // "drop_insti": drop_insti,
        }));
    return response;
  }
}

class DeleteBranch {
  Future<http.Response> deletebranch(drop_id
      // drop_insti
      ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/drop_branch/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "drop_id": drop_id,
          // "drop_insti": drop_insti,
        }));
    return response;
  }
}

class DeleteCenter {
  Future<http.Response> deletecenter(drop_id
      // drop_insti
      ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/drop_center/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "drop_id": drop_id,
          // "drop_insti": drop_insti,
        }));
    return response;
  }
}

class DeleteUnit {
  Future<http.Response> deleteunit(drop_id
      // drop_insti
      ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/drop_unit/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "drop_id": drop_id,
          // "drop_insti": drop_insti,
        }));
    return response;
  }
}

class DeleteBanknews {
  Future<http.Response> deletebanknews(drop_id
      // drop_insti
      ) async {
    String url = 'https://sit-api-janus.fortress-asya.com:1234/drop_banknews/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "drop_id": drop_id,
          // "drop_insti": drop_insti,
        }));
    return response;
  }
}
