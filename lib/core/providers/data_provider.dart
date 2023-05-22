import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/model.dart';

String API = "https://sit-api-janus.fortress-asya.com:1234";

class Prov extends ChangeNotifier {
  String role_button = 'Click here';
  List<Role_Management> role = [];
  List<Data> role_data = [];
  bool search = false;
}

class Prov1 extends ChangeNotifier {
  String user_button = 'Click here';
  List<User_Management> user = [];
  List<Data2> user_data = [];
  bool search1 = false;
}

class Prov3 extends ChangeNotifier {
  String confirmation_button = 'Click here';
  List<Transaction_Confirmation> confirm = [];
  List<Data3> confirm_data = [];
  bool search3 = false;
}

class Prov5 extends ChangeNotifier {
  String sms_button = 'Click here';
  List<Sms_Logs> sms = [];
  List<Data5> sms_data = [];
  bool search5 = false;
}

class Prov6 extends ChangeNotifier {
  String agent_button = 'Click here';
  List<Agent_Dashboard> agent = [];
  List<Data6> agent_data = [];
  bool search6 = false;
}

class Prov7 extends ChangeNotifier {
  String failedenrollment_button = 'Click here';
  List<Failed_Enrollment> failed = [];
  List<Data7> failed_data = [];
  bool search7 = false;
}

class Prov8 extends ChangeNotifier {
  String listoragent_button = 'Click here';
  List<List_Agent> list_agent = [];
  List<Data8> list_agent_data = [];
  bool search8 = false;
}

class Prov9 extends ChangeNotifier {
  String broadcast_button = 'Click here';
  List<Broadcast_Message> broadcast = [];
  List<Data9> broadcast_data = [];
  bool search9 = false;
}

class Prov10 extends ChangeNotifier {
  String concern_button = 'Click here';
  List<Type_of_Concern> concern = [];
  List<Data10> concern_data = [];
  bool search10 = false;
}

class Prov11 extends ChangeNotifier {
  String hotline_button = 'Click here';
  List<CSR_Hotline> hotline = [];
  List<Data11> hotline_data = [];
  bool search11 = false;
}

class Prov12 extends ChangeNotifier {
  String fee_button = 'Click here';
  List<Fee_Structure> fee = [];
  List<Data12> fee_data = [];
  bool search12 = false;
  bool isLoaded = false;
}

class Prov13 extends ChangeNotifier {
  String prov_button = 'Click here';
  List<Prov_Config> prov = [];
  List<Data13> prov_data = [];
  bool search13 = false;
  bool isLoaded = false;
}

class Prov14 extends ChangeNotifier {
  String product_button = 'Click here';
  List<Product_Type> product = [];
  List<Data14> product_data = [];
  bool search14 = false;
}

class Prov15 extends ChangeNotifier {
  String category_button = 'Click here';
  List<Product_Category> category = [];
  List<Data15> category_data = [];
  bool search15 = false;
}

class Prov16 extends ChangeNotifier {
  String biller_button = 'Click here';
  List<Biller_Product> biller = [];
  List<Data16> biller_data = [];
  List<bool> isChecked = [];
  bool isLoaded = false;
  bool search16 = false;
}

class Prov17 extends ChangeNotifier {
  String load_button = 'Click here';
  List<Load_Product> load = [];
  List<Data17> load_data = [];
  List<bool> isChecked = [];
  bool isLoaded = false;
  bool search17 = false;
}

class Prov18 extends ChangeNotifier {
  String commission_button = 'Click here';
  List<Commission_Setup> commission = [];
  List<Data18> commission_data = [];
  List<bool> isChecked = [];
  bool isLoaded = false;
  bool search18 = false;
}

class Prov19 extends ChangeNotifier {
  String list_button = 'Click here';
  late BuildContext dashboardContext;
  List<Bank_List> list = [];
  List<Data19> list_data = [];
  bool search19 = false;
  bool isLoaded = false;
}

class Prov20 extends ChangeNotifier {
  String partner_button = 'Click here';
  List<Partner_List> partner = [];
  List<Data20> partner_data = [];
  List<bool> isChecked = [];
  bool isLoaded = false;
  bool search20 = false;
}

class Prov21 extends ChangeNotifier {
  String splash_button = 'Click here';
  List<Splash_Screen> splash = [];
  List<Data21> splash_data = [];
  List<bool> isChecked = [];
  bool isLoaded = false;
  bool search21 = false;
}
