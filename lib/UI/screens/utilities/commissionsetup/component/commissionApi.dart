import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtool_rep/UI/utils/models/addcommission_model.dart';

class AddCommissionApi {
  Future<http.Response> Addcommissions(
    String set_agent_income,
    String set_bank_income,
    String set_bank_partner_income,
    String set_commission_type,
    String set_customer_income,
    String set_trans_type,
  ) async {
    String url =
        'https://sit-api-janus.fortress-asya.com:1234/create_commission/';
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(AddCommisionModel(
        setAgentIncome: set_agent_income,
        setBankIncome: set_bank_income,
        setBankPartnerIncome: set_bank_partner_income,
        setCommissionType: set_commission_type,
        setCustomerIncome: set_customer_income,
        setTransType: set_trans_type,
      )),
    );
    print(response.body.toString());
    return response;
  }
}
