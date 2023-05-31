import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtool_rep/UI/screens/administration/hierarchy/addhierarchy/add_hierarchy.dart';
import 'package:webtool_rep/UI/screens/administration/hierarchy/hierarchy.dart';
import 'package:webtool_rep/UI/screens/administration/rolemanagement/addroles/add_roles.dart';
import 'package:webtool_rep/UI/screens/administration/rolemanagement/role_management.dart';
import 'package:webtool_rep/UI/screens/administration/usermanagement/adduser/add_user.dart';
import 'package:webtool_rep/UI/screens/administration/usermanagement/user_management.dart';
import 'package:webtool_rep/UI/screens/customerservice/broadcastmessage/broadcast_message.dart';
import 'package:webtool_rep/UI/screens/customerservice/csrdashboard/addcsrdashboard/add_csrdashboard.dart';
import 'package:webtool_rep/UI/screens/customerservice/csrdashboard/csr_dashboard.dart';
import 'package:webtool_rep/UI/screens/customerservice/csrhotline/csr_hotline.dart';
import 'package:webtool_rep/UI/screens/customerservice/typeofconcern/type_of_concern.dart';
import 'package:webtool_rep/UI/screens/dashboard/activeclient/active_client.dart';
import 'package:webtool_rep/UI/screens/dashboard/banktransaction/bank_transaction.dart';
import 'package:webtool_rep/UI/screens/dashboard/clienttransaction/client_transaction.dart';
import 'package:webtool_rep/UI/screens/dashboard/eloadetransaction/eload_transaction.dart';
import 'package:webtool_rep/UI/screens/dashboard/registerclient/register_client.dart';
import 'package:webtool_rep/UI/screens/enrollment/clientlistforregistration/client_list_for_registration.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/monitoring/agentdashboard/agent_dashboard.dart';
import 'package:webtool_rep/UI/screens/monitoring/authorizedresetpassword/authorized_reset_password.dart';
import 'package:webtool_rep/UI/screens/monitoring/clientprofile/client_profile.dart';
import 'package:webtool_rep/UI/screens/monitoring/failedenrollment/failed_enrollment.dart';
import 'package:webtool_rep/UI/screens/monitoring/listofagent/list_of_agent.dart';
import 'package:webtool_rep/UI/screens/monitoring/listofuseddevice/list_of_used_device.dart';
import 'package:webtool_rep/UI/screens/monitoring/operationdashboard/operation_dashboard.dart';
import 'package:webtool_rep/UI/screens/monitoring/remitancetransactionlog/remittance_transaction_log.dart';
import 'package:webtool_rep/UI/screens/monitoring/remittancedashboard/remittance_dashboard.dart';
import 'package:webtool_rep/UI/screens/monitoring/slfrequest/slf_request.dart';
import 'package:webtool_rep/UI/screens/monitoring/smslogs/sms_logs.dart';
import 'package:webtool_rep/UI/screens/monitoring/transactionforconfirmation/transaction_for_confirmation.dart';
import 'package:webtool_rep/UI/screens/monitoring/transactionlog/transaction_log.dart';
import 'package:webtool_rep/UI/screens/reports/Remittancesent/remittance_sent.dart';
import 'package:webtool_rep/UI/screens/reports/accountstatusreport/account_status_report.dart';
import 'package:webtool_rep/UI/screens/reports/activatedmerchant/activated_merchant.dart';
import 'package:webtool_rep/UI/screens/reports/activityhistory/activity_history.dart';
import 'package:webtool_rep/UI/screens/reports/coretransaction/core_transaction.dart';
import 'package:webtool_rep/UI/screens/reports/csdashboard/cs_dashboard.dart';
import 'package:webtool_rep/UI/screens/reports/deactivatedmerchant/deactivated_merchant.dart';
import 'package:webtool_rep/UI/screens/reports/failedenrollmentreport/failed_enrollment_report.dart';
import 'package:webtool_rep/UI/screens/reports/igaterecentiliation/igate_recentiliation.dart';
import 'package:webtool_rep/UI/screens/reports/listofagentreport/list_of_agent_report.dart';
import 'package:webtool_rep/UI/screens/reports/loginlogout/login_logout.dart';
import 'package:webtool_rep/UI/screens/reports/mpinchangepassword/mpin_change_password.dart';
import 'package:webtool_rep/UI/screens/reports/reconnccm/reconn_ccm.dart';
import 'package:webtool_rep/UI/screens/reports/registerclients/register_clients.dart';
import 'package:webtool_rep/UI/screens/reports/remittancecancelled/remittance_cancelled.dart';
import 'package:webtool_rep/UI/screens/reports/remittanceclaimed/Remittance_claimed.dart';
import 'package:webtool_rep/UI/screens/reports/resendsmsactivation/resend_sms_activation.dart';
import 'package:webtool_rep/UI/screens/reports/smslogreport/sms_log_report.dart';
import 'package:webtool_rep/UI/screens/reports/suspicioustransactio/suspicious_transaction.dart';
import 'package:webtool_rep/UI/screens/reports/transactionlog/transaction_log.dart';
import 'package:webtool_rep/UI/screens/reports/useddeviceid/used_device_id.dart';
import 'package:webtool_rep/UI/screens/reports/useractivitylogs/user_activity_logs.dart';
import 'package:webtool_rep/UI/screens/reports/validtransaction/valid_transaction.dart';
import 'package:webtool_rep/UI/screens/reports/webtooluserreport/webtooluser_report.dart';
import 'package:webtool_rep/UI/screens/utilities/banklist/addbanklist/addbank_list.dart';
import 'package:webtool_rep/UI/screens/utilities/banklist/bank_list.dart';
import 'package:webtool_rep/UI/screens/utilities/banknews/addbanknews/addbank_news.dart';
import 'package:webtool_rep/UI/screens/utilities/banknews/bank_news.dart';
import 'package:webtool_rep/UI/screens/utilities/billerproduct/addbillerproduct/addbiller_product.dart';
import 'package:webtool_rep/UI/screens/utilities/billerproduct/biller_product.dart';
import 'package:webtool_rep/UI/screens/utilities/branch/addbranch/addbranch.dart';
import 'package:webtool_rep/UI/screens/utilities/branch/branch.dart';
import 'package:webtool_rep/UI/screens/utilities/center/addcenter/addcenter.dart';
import 'package:webtool_rep/UI/screens/utilities/center/center.dart';
import 'package:webtool_rep/UI/screens/utilities/commissionsetup/addcommissionsetup/addcommission_setup.dart';
import 'package:webtool_rep/UI/screens/utilities/commissionsetup/commission_setup.dart';
import 'package:webtool_rep/UI/screens/utilities/dcmlocation/adddcmlocation/add_dcmlocation.dart';
import 'package:webtool_rep/UI/screens/utilities/dcmlocation/dcm_location.dart';
import 'package:webtool_rep/UI/screens/utilities/feestructure/addstructure/add_structure.dart';
import 'package:webtool_rep/UI/screens/utilities/feestructure/free_structure.dart';
import 'package:webtool_rep/UI/screens/utilities/institution/addinstitution/addinstitution.dart';
import 'package:webtool_rep/UI/screens/utilities/institution/components/instiAPI.dart';
import 'package:webtool_rep/UI/screens/utilities/institution/institution.dart';
import 'package:webtool_rep/UI/screens/utilities/loadproduct/addloadproduct/addload_product.dart';
import 'package:webtool_rep/UI/screens/utilities/loadproduct/load_product.dart';
import 'package:webtool_rep/UI/screens/utilities/parameter/addparameter/add_parameter.dart';
import 'package:webtool_rep/UI/screens/utilities/parameter/parameter.dart';
import 'package:webtool_rep/UI/screens/utilities/partner/addpartner/addpartner.dart';
import 'package:webtool_rep/UI/screens/utilities/partner/partner.dart';
import 'package:webtool_rep/UI/screens/utilities/productandservices/addproductandservices/addproduct_and_services.dart';
import 'package:webtool_rep/UI/screens/utilities/productandservices/product_and_services.dart';
import 'package:webtool_rep/UI/screens/utilities/productcategory/addproductcategory/addproduct_category.dart';
import 'package:webtool_rep/UI/screens/utilities/productcategory/product_category.dart';
import 'package:webtool_rep/UI/screens/utilities/producttype/addproducttype/addproduct_type.dart';
import 'package:webtool_rep/UI/screens/utilities/producttype/product_type.dart';
import 'package:webtool_rep/UI/screens/utilities/provider/addprovider/addprovider.dart';
import 'package:webtool_rep/UI/screens/utilities/provider/providers.dart';
import 'package:webtool_rep/UI/screens/utilities/servicedowntime/addservice_downtime/addservice_downtime.dart';
import 'package:webtool_rep/UI/screens/utilities/servicedowntime/service_downtime.dart';
import 'package:webtool_rep/UI/screens/utilities/splashscreen/addsplashscreen/addsplash_screen.dart';
import 'package:webtool_rep/UI/screens/utilities/splashscreen/splash_screen.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/addunit/addunit.dart';
import 'package:webtool_rep/UI/screens/utilities/unit/unit.dart';
import 'package:webtool_rep/UI/utils/constant.dart';
import 'package:webtool_rep/UI/utils/responsive.dart';
import 'package:webtool_rep/UI/widgets/contains.dart';
import 'package:webtool_rep/UI/widgets/header.dart';
import 'package:webtool_rep/UI/widgets/listTile.dart';
import 'package:webtool_rep/UI/widgets/sidemenu.dart';
import 'package:webtool_rep/core/adduser_controller.dart';
import 'package:webtool_rep/core/getter_setter.dart';
import 'package:webtool_rep/core/providers/Provider.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static const String route = '/HomePage';
  String? user;
  String? oldpass;
  HomePage({Key? key, this.user, this.oldpass}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AddinstiAPI addinstitutionapi = AddinstiAPI();
  AddinstiController addinstiController = AddinstiController();
  // Timer? _timer;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _startTimer();
  //     print('flutter-----(time start!)');
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
  //
  // void _startTimer() {
  //   final timer = Provider.of<TimerProvider>(context, listen: false);
  //   timer.startTimer();
  //   timer.buildContext = context;
  // }
  //
  // void _pauseTimer([_]) {
  //   _timer?.cancel();
  //   _startTimer();
  //   print('flutter-----(time pause!)');
  // }

  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            SizedBox(
              width: 250.0,
              child: Drawer(
                  backgroundColor: Colors.green[200],
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        DrawerHeader(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: kTertiaryColor5,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: const Offset(0, 1)),
                                  ],
                                ),
                                height: 100,
                                width: 100,
                                child: const Image(
                                  image: AssetImage("assets/icons/kplus.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.dashboard_outlined,
                            title: "Dashboard",
                            child: [
                              Container(
                                decoration: BoxDecoration(
                                  color: shared.title == "Register Client"
                                      ? const Color(0xFF7FA998)
                                      : Colors.transparent,
                                ),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.account_circle_outlined,
                                  title: "Register Client",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = CupertinoIcons.cube;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Dashboard";
                                      shared.title = "Register Client";
                                      shared.homewidget = [
                                        const Registerclient()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "Active Client"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.check_circle_outline_outlined,
                                  title: "Active Client",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = CupertinoIcons.cube;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Dashboard";
                                      shared.title = "Active Client";
                                      shared.homewidget = [
                                        const Activeclient()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "Client Transaction"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.receipt_long_outlined,
                                  title: "Client Transaction",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = CupertinoIcons.cube;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Dashboard";
                                      shared.title = "Client Transaction";
                                      shared.homewidget = [
                                        const Clienttransaction()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "eLoad Transaction"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.receipt_outlined,
                                  title: "eLoad Transaction",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = CupertinoIcons.cube;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Dashboard";
                                      shared.title = "eLoad Transaction";
                                      shared.homewidget = [
                                        const eLoadtransaction()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "Bank Transaction"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.account_balance_outlined,
                                  title: "Bank Transaction",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = CupertinoIcons.cube;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Dashboard";
                                      shared.title = "Bank Transaction";
                                      shared.homewidget = [
                                        const Banktransaction()
                                      ];
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.admin_panel_settings_outlined,
                            title: "Administration",
                            child: [
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "User Management"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.person_outline,
                                  title: "User Management",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.onPress = () {
                                        setState(() {
                                          shared.onPress = () {
                                            setState(() {
                                              shared.icon = Icons.perm_identity;
                                              shared.addicon =
                                                  Icons.add_outlined;
                                              shared.uploadbutton = "";
                                              shared.subuploadbutton = "";
                                              shared.addbutton = "New User";
                                              shared.subaddbutton =
                                                  "Add New User Data";
                                              shared.header = "Administration";
                                              shared.title = "User Management";
                                              shared.homewidget = [
                                                const Usermanagement()
                                              ];
                                            });
                                          };
                                          shared.icon = Icons.add_outlined;
                                          shared.addicon = Icons.save_outlined;
                                          shared.header =
                                              "Administration  >  Create / Edit";
                                          shared.addbutton = "Save";
                                          shared.subaddbutton =
                                              "Save All User Data";
                                          shared.title = "Create / Edit";
                                          shared.homewidget = [
                                            const Addusers()
                                          ];
                                        });
                                      };
                                      shared.icon = Icons.perm_identity;
                                      shared.addicon = Icons.add_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "New User";
                                      shared.subaddbutton = "Add New User Data";
                                      shared.header = "Administration";
                                      shared.title = "User Management";
                                      shared.homewidget = [
                                        const Usermanagement()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "Role Management"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.people_outline,
                                  title: "Role Management",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.onPress = () {
                                        setState(() {
                                          shared.onPress = () {
                                            setState(() {
                                              shared.addicon =
                                                  Icons.add_outlined;
                                              shared.icon =
                                                  Icons.people_outline;
                                              shared.addicon =
                                                  Icons.add_outlined;
                                              shared.uploadbutton = "";
                                              shared.subuploadbutton = "";
                                              shared.addbutton = "New Role";
                                              shared.subaddbutton =
                                                  "Add New Role Data";
                                              shared.header = "Administration";
                                              shared.title = "Role Management";
                                              shared.homewidget = [
                                                const Rolemanagement()
                                              ];
                                            });
                                          };
                                          shared.icon = Icons.add_outlined;
                                          shared.addicon = Icons.save_outlined;
                                          shared.header =
                                              "Administration  >  Create / Edit";
                                          shared.addbutton = "Save";
                                          shared.subaddbutton =
                                              "Save All Roles";
                                          shared.title = "Create / Edit";
                                          shared.homewidget = [
                                            const Addroles()
                                          ];
                                        });
                                      };
                                      shared.addicon = Icons.add_outlined;
                                      shared.icon = Icons.people_outline;
                                      shared.addicon = Icons.add_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "New Role";
                                      shared.subaddbutton = "Add New Role Data";
                                      shared.header = "Administration";
                                      shared.title = "Role Management";
                                      shared.homewidget = [
                                        const Rolemanagement()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "Hierarchy"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.lan_outlined,
                                  title: "Hierarchy",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.onPress = () {
                                        setState(() {
                                          shared.onPress = () {
                                            setState(() {
                                              shared.addicon =
                                                  Icons.add_outlined;
                                              shared.icon = Icons.lan_outlined;
                                              shared.uploadbutton = "Upload";
                                              shared.subuploadbutton =
                                                  "Upload Hierarchy Data";
                                              shared.addbutton =
                                                  "New Hierarchy";
                                              shared.subaddbutton =
                                                  "Add New Hierarchy Data";
                                              shared.header = "Administration";
                                              shared.title = "Hierarchy";
                                              shared.homewidget = [
                                                const Hierarchy()
                                              ];
                                            });
                                          };
                                          shared.icon = Icons.add_outlined;
                                          shared.addicon = Icons.save_outlined;
                                          shared.uploadbutton = "";
                                          shared.subuploadbutton = "";
                                          shared.header =
                                              "Administration  >  Create / Edit";
                                          shared.addbutton = "Save";
                                          shared.subaddbutton =
                                              "Save Hierarchy";
                                          shared.title = "Create / Edit";
                                          shared.homewidget = [
                                            const Addhierarchy()
                                          ];
                                        });
                                      };
                                      shared.addicon = Icons.add_outlined;
                                      shared.icon = Icons.lan_outlined;
                                      shared.uploadbutton = "Upload";
                                      shared.subuploadbutton =
                                          "Upload Hierarchy Data";
                                      shared.addbutton = "New Hierarchy";
                                      shared.subaddbutton =
                                          "Add New Hierarchy Data";
                                      shared.header = "Administration";
                                      shared.title = "Hierarchy";
                                      shared.homewidget = [const Hierarchy()];
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.person_add_alt_outlined,
                            title: "Enrollment",
                            child: [
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title ==
                                            "Client List for Registration"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.dashboard,
                                  title: "Client List for Registration",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.onPress = null;
                                      shared.addicon = null;
                                      shared.icon = Icons.menu;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Enrollment";
                                      shared.title =
                                          "Client List for Registration";
                                      shared.homewidget = [
                                        const Clientlistforregistration()
                                      ];
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.person_outline,
                            title: "Monitoring",
                            child: [
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "Client Profile"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.dashboard,
                                  title: "Client Profile",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = Icons.person_outline;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Monitoring";
                                      shared.title = "Client Profile";
                                      shared.homewidget = [
                                        const Clientprofile()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        shared.title == "Remittance Dashboard"
                                            ? const Color(0xFF7FA998)
                                            : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.content_copy_outlined,
                                  title: "Remittance Dashboard",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = Icons.content_copy_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Monitoring";
                                      shared.title = "Remittance Dashboard";
                                      shared.homewidget = [
                                        const Remittancedashboard()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title ==
                                            "Transaction for Confirmation"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.mobile_friendly_outlined,
                                  title: "Transaction for Confirmation",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon =
                                          Icons.mobile_friendly_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Monitoring";
                                      shared.title =
                                          "Transaction for Confirmation";
                                      shared.homewidget = [
                                        const Transactionforconfirmation()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title ==
                                            "Remittance Transaction Log"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.money_outlined,
                                  title: "Remittance Transaction Log",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = Icons.content_copy_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Monitoring";
                                      shared.title =
                                          "Remittance Transaction Log";
                                      shared.homewidget = [
                                        const Remittancetransactionlog()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: shared.title == "SMS Logs"
                                        ? const Color(0xFF7FA998)
                                        : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.email_outlined,
                                  title: "SMS Logs",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header = "Client Profile";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.addicon = null;
                                      shared.onPress = null;
                                      shared.icon = Icons.email_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "";
                                      shared.subaddbutton = "";
                                      shared.header = "Monitoring";
                                      shared.title = "SMS Logs";
                                      shared.homewidget = [const Smslogs()];
                                    });
                                  },
                                ),
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.archive_outlined,
                                title: "SLF Request",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.archive_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "SLF Request";
                                    shared.homewidget = [const Slfrequest()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Transaction Log",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "Transaction Log";
                                    shared.homewidget = [
                                      const Transactionlog()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Operation Dashboard",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "Operation Dashboard";
                                    shared.homewidget = [
                                      const Operationdashboard()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Authorized Reset Password and MPIN",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title =
                                        "Authorized Reset Password and MPIN";
                                    shared.homewidget = [
                                      const Authorizedresetpassword()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Agent Dashboard",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "Agent Dashboard";
                                    shared.homewidget = [
                                      const Agentdashboard()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.smartphone_outlined,
                                title: "List of Used Device ID",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.smartphone_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "List of Used Device ID";
                                    shared.homewidget = [
                                      const Listofuseddevice()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.list_outlined,
                                title: "Failed Enrollment List",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.list_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "Failed Enrollment List";
                                    shared.homewidget = [
                                      const Failedenrollment()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: CupertinoIcons.cube,
                                title: "List of Agent",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.addicon = null;
                                    shared.onPress = null;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Monitoring";
                                    shared.title = "List of Agent";
                                    shared.homewidget = [const Listofagent()];
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.settings_outlined,
                            title: "Utilities",
                            child: [
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Fee Structure",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Fee Structure";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton =
                                                "New Fee Structure";
                                            shared.subaddbutton =
                                                "Add New Fee Structure";
                                            shared.header = "Utilities";
                                            shared.title = "Fee Structure";
                                            shared.homewidget = [
                                              const Feestructure()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Fee Structure";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addstructure()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Fee Structure";
                                    shared.subaddbutton =
                                        "Add New Fee Structure";
                                    shared.header = "Utilities";
                                    shared.title = "Fee Structure";
                                    shared.homewidget = [const Feestructure()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Parameter",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Parameter";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Parameter";
                                            shared.subaddbutton =
                                                "Add New Parameter";
                                            shared.header = "Utilities";
                                            shared.title = "Parameter";
                                            shared.homewidget = [
                                              const Parameters()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Parameter";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addparameters()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Parameter";
                                    shared.subaddbutton = "Add New Parameter";
                                    shared.header = "Utilities";
                                    shared.title = "Parameter";
                                    shared.homewidget = [const Parameters()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "DCM Location",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "DCM Location";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton =
                                                "New DCM Location";
                                            shared.subaddbutton =
                                                "Add New DCM Location";
                                            shared.header = "Utilities";
                                            shared.title = "DCM Location";
                                            shared.homewidget = [
                                              const Dcmlocation()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save DCM Location";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Adddcmlocation()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New DCM Location";
                                    shared.subaddbutton =
                                        "Add New DCM Location";
                                    shared.header = "Utilities";
                                    shared.title = "DCM Location";
                                    shared.homewidget = [const Dcmlocation()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Bank News",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Bank News";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Bank News";
                                            shared.subaddbutton =
                                                "Add New Bank News";
                                            shared.header = "Utilities";
                                            shared.title = "Bank News";
                                            shared.homewidget = [
                                              const Banknews()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Bank News";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addbanknews()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Bank News";
                                    shared.subaddbutton = "Add New Bank News";
                                    shared.header = "Utilities";
                                    shared.title = "Bank News";
                                    shared.homewidget = [const Banknews()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Product and Services",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Product and Services";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Product";
                                            shared.subaddbutton =
                                                "Add New Product & Services";
                                            shared.header = "Utilities";
                                            shared.title =
                                                "Product and Services";
                                            shared.homewidget = [
                                              const Productandservices()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Product & Services";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addproductandservices()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Product";
                                    shared.subaddbutton =
                                        "Add Product & Services";
                                    shared.header = "Utilities";
                                    shared.title = "Product and Services";
                                    shared.homewidget = [
                                      const Productandservices()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Service DownTime",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Service DownTime";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Service";
                                            shared.subaddbutton =
                                                "Add New ServiceDownTime";
                                            shared.header = "Utilities";
                                            shared.title =
                                                "Product and Services";
                                            shared.homewidget = [
                                              const Productandservices()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save ServiceDownTime";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addservicedowntime()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Service";
                                    shared.subaddbutton = "Add ServiceDownTime";
                                    shared.header = "Utilities";
                                    shared.title = "Service DownTime";
                                    shared.homewidget = [
                                      const Servicedowntime()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Institution",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Institution";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton =
                                                "New Institution";
                                            shared.subaddbutton =
                                                "Add New Institution";
                                            shared.header = "Utilities";
                                            shared.title = "Institution";
                                            shared.homewidget = [
                                              const Institution()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.onPress = () async {
                                          if (addinstiController.cinsticode.text!= null &&
                                              addinstiController.cinstidesc.text!= null) {
                                            try {

                                              print(SaveInsti.GetInstidesc().toString());
                                              print(SaveInsti.GetInsticode().toString());
                                              http.Response response =
                                                  await addinstitutionapi
                                                      .addinstiapi(
                                                          SaveInsti
                                                              .GetInsticode().toString(),
                                                          SaveInsti
                                                              .GetInstidesc().toString()
                                                  );
                                              if(jsonDecode(response.body) ['Created Successfully'] == false){
                                                Navigator.pop(context);

                                              }
                                            } catch (e) {
                                              debugPrint(e.toString());
                                            }
                                          }else{
                                            debugPrint('check');
                                          }
                                        };
                                        shared.subaddbutton =
                                            "Save Institution";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addinstitution()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Institution";
                                    shared.subaddbutton = "Add Institution";
                                    shared.header = "Utilities";
                                    shared.title = "Institution";
                                    shared.homewidget = [const Institution()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Branch",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Branch";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Branch";
                                            shared.subaddbutton =
                                                "Add New Branch";
                                            shared.header = "Utilities";
                                            shared.title = "Branch";
                                            shared.homewidget = [
                                              const Branch()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Branch";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addbranch()];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Branch";
                                    shared.subaddbutton = "Add Branch";
                                    shared.header = "Utilities";
                                    shared.title = "Branch";
                                    shared.homewidget = [const Branch()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Unit",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Unit";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Unit";
                                            shared.subaddbutton =
                                                "Add New Unit";
                                            shared.header = "Utilities";
                                            shared.title = "Unit";
                                            shared.homewidget = [const Unit()];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Unit";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addunit()];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Unit";
                                    shared.subaddbutton = "Add Unit";
                                    shared.header = "Utilities";
                                    shared.title = "Unit";
                                    shared.homewidget = [const Unit()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Center",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Center";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Center";
                                            shared.subaddbutton =
                                                "Add New Center";
                                            shared.header = "Utilities";
                                            shared.title = "Center";
                                            shared.homewidget = [
                                              const Centers()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Center";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addcenters()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Unit";
                                    shared.subaddbutton = "Add Center";
                                    shared.header = "Utilities";
                                    shared.title = "Center";
                                    shared.homewidget = [const Centers()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Provider",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Provider";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Provider";
                                            shared.subaddbutton =
                                                "Add New Provider";
                                            shared.header = "Utilities";
                                            shared.title = "Provider";
                                            shared.homewidget = [
                                              const Providers()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Provider";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addproviders()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Provider";
                                    shared.subaddbutton = "Add Provider";
                                    shared.header = "Utilities";
                                    shared.title = "Provider";
                                    shared.homewidget = [const Providers()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Product Type",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Product Type";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton =
                                                "New Product Type";
                                            shared.subaddbutton =
                                                "Add New Product Type";
                                            shared.header = "Utilities";
                                            shared.title = "Product Type";
                                            shared.homewidget = [
                                              const Producttype()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Product Type";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addproducttype()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Product Type";
                                    shared.subaddbutton = "Add Product Type";
                                    shared.header = "Utilities";
                                    shared.title = "Product Type";
                                    shared.homewidget = [const Producttype()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Product Category",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Product Category";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Product";
                                            shared.subaddbutton =
                                                "Add Product Category";
                                            shared.header = "Utilities";
                                            shared.title = "Product Category";
                                            shared.homewidget = [
                                              const Productcategory()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Product Category";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const AddProductCategory()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Product";
                                    shared.subaddbutton =
                                        "Add Product Category";
                                    shared.header = "Utilities";
                                    shared.title = "Product Category";
                                    shared.homewidget = [
                                      const Productcategory()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Biller Product",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.uploadbutton = "";
                                        shared.subuploadbutton = "";
                                        shared.header = "Biller Product";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.uploadbutton = "Download";
                                            shared.subuploadbutton =
                                                "Download Biller Product";
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.addbutton =
                                                "New Biller Product";
                                            shared.subaddbutton =
                                                "Add Biller Product";
                                            shared.header = "Utilities";
                                            shared.title = "Biller Product";
                                            shared.homewidget = [
                                              const Billerproduct()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.uploadbutton = "";
                                        shared.subuploadbutton = "";
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Biller Product";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addbillerproduct()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.addbutton = "New Biller Product";
                                    shared.subaddbutton = "Add Biller Product";
                                    shared.uploadbutton = "Download";
                                    shared.subuploadbutton =
                                        "Download Biller Product";
                                    shared.header = "Utilities";
                                    shared.title = "Biller Product";
                                    shared.homewidget = [const Billerproduct()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Load Product",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Load Product";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton =
                                                "New Load Product";
                                            shared.subaddbutton =
                                                "Add Load Product";
                                            shared.header = "Utilities";
                                            shared.title = "Load Product";
                                            shared.homewidget = [
                                              const Loadproduct()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Load Product";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addloadproduct()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Load Product";
                                    shared.subaddbutton = "Add Load Product";
                                    shared.header = "Utilities";
                                    shared.title = "Load Product";
                                    shared.homewidget = [const Loadproduct()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Commission Setup",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Commission Setup";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Commission";
                                            shared.subaddbutton =
                                                "Add Commission Setup";
                                            shared.header = "Utilities";
                                            shared.title = "Commission Setup";
                                            shared.homewidget = [
                                              const Commissionsetup()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Commission Setup";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addcommission()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Commission";
                                    shared.subaddbutton =
                                        "Add Commission Setup";
                                    shared.header = "Utilities";
                                    shared.title = "Commission Setup";
                                    shared.homewidget = [
                                      const Commissionsetup()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "IBFT Bank List",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Bank List";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Bank List";
                                            shared.subaddbutton =
                                                "Add Bank List";
                                            shared.header = "Utilities";
                                            shared.title = "Bank List";
                                            shared.homewidget = [
                                              const Banklist()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Bank List";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addbanklist()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Bank List";
                                    shared.subaddbutton = "Add Bank List";
                                    shared.header = "Utilities";
                                    shared.title = "Bank List";
                                    shared.homewidget = [const Banklist()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Partner",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Partner";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Partner";
                                            shared.subaddbutton = "Add Partner";
                                            shared.header = "Utilities";
                                            shared.title = "Partner";
                                            shared.homewidget = [
                                              const Partner()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Partner";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addpartner()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Partner";
                                    shared.subaddbutton = "Add Partner";
                                    shared.header = "Utilities";
                                    shared.title = "Partner";
                                    shared.homewidget = [const Partner()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.people_outline,
                                title: "Splash Screen",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Splash Screen";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.addicon = Icons.add_outlined;
                                            shared.icon = Icons.people_outline;
                                            shared.addicon = Icons.add_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton =
                                                "New Splash Screen";
                                            shared.subaddbutton =
                                                "Add Splash Screen";
                                            shared.header = "Utilities";
                                            shared.title = "Splash Screen";
                                            shared.homewidget = [
                                              const Splashscreen()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Utilities  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save Splash Screen";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addsplashscreen()
                                        ];
                                      });
                                    };
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.people_outline;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Splash Screen";
                                    shared.subaddbutton = "Add Splash Screen";
                                    shared.header = "Utilities";
                                    shared.title = "Splash Screen";
                                    shared.homewidget = [const Splashscreen()];
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.phone_outlined,
                            title: "Customer Service",
                            child: [
                              Listtile(
                                color: Colors.black,
                                icon: Icons.person_outline,
                                title: "CSR Dashboard",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.icon = Icons.add_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Customer Service  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton =
                                            "Save All User Data";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [
                                          const Addcsrdashboard()
                                        ];
                                      });
                                    };
                                    shared.icon = Icons.perm_identity;
                                    shared.addicon = Icons.add_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New CS Dashboard";
                                    shared.subaddbutton =
                                        "Add New CS Dashboard";
                                    shared.header = "Customer Service";
                                    shared.title = "CSR Dashboard";
                                    shared.homewidget = [const Csrdashboard()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.email_outlined,
                                title: "Broadcast Message",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {};
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Message";
                                    shared.subaddbutton = "Add New Dashboard";
                                    shared.header = "Customer Service";
                                    shared.title = "Broadcast Message";
                                    shared.homewidget = [
                                      const Broadcastmessage()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.star_outline,
                                title: "Type of Concern",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {};
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Concern";
                                    shared.subaddbutton =
                                        "Add New Type Concern";
                                    shared.header = "Customer Service";
                                    shared.title = "Type of Concern";
                                    shared.homewidget = [const Typeofconcern()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.phone_outlined,
                                title: "CSR Hotline",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Client Profile";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {};
                                    shared.addicon = Icons.add_outlined;
                                    shared.icon = Icons.list_alt_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New CSR Hotline";
                                    shared.subaddbutton = "Add New Data";
                                    shared.header = "Customer Service";
                                    shared.title = "CSR Hotline";
                                    shared.homewidget = [const Csrhotline()];
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTertiaryColor5,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Sidemenu(
                            icon: Icons.newspaper_outlined,
                            title: "Report",
                            child: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        shared.title == "Webtool User Listing"
                                            ? const Color(0xFF7FA998)
                                            : Colors.transparent),
                                child: Listtile(
                                  color: Colors.black,
                                  icon: Icons.content_copy_outlined,
                                  title: "Webtool User Listing",
                                  onTap: () {
                                    setState(() {
                                      shared.onTaps = () {
                                        setState(() {
                                          shared.header =
                                              "Webtool User Listing";
                                          shared.title = "Change Password";
                                          shared.homewidget = [
                                            const Changepassword()
                                          ];
                                        });
                                      };
                                      shared.onPress = () {
                                        setState(() {
                                          shared.onPress = () {
                                            setState(() {
                                              shared.icon =
                                                  Icons.content_copy_outlined;
                                              shared.addicon =
                                                  Icons.report_outlined;
                                              shared.uploadbutton = "";
                                              shared.subuploadbutton = "";
                                              shared.addbutton = "New Report";
                                              shared.subaddbutton =
                                                  "Generate Reports";
                                              shared.header = "Reports";
                                              shared.title =
                                                  "Webtool User Listing";
                                              shared.homewidget = [
                                                const Webtoolusereport()
                                              ];
                                            });
                                          };
                                          shared.icon = Icons.report_outlined;
                                          shared.addicon = Icons.save_outlined;
                                          shared.header =
                                              "Report  >  Create / Edit";
                                          shared.addbutton = "Save";
                                          shared.subaddbutton = "Save Report";
                                          shared.title = "Create / Edit";
                                          shared.homewidget = [
                                            const Addusers()
                                          ];
                                        });
                                      };
                                      shared.icon = Icons.content_copy_outlined;
                                      shared.addicon = Icons.report_outlined;
                                      shared.uploadbutton = "";
                                      shared.subuploadbutton = "";
                                      shared.addbutton = "New Report";
                                      shared.subaddbutton = "Generate Reports";
                                      shared.header = "Reports";
                                      shared.title = "Webtool User Listing";
                                      shared.homewidget = [
                                        const Webtoolusereport()
                                      ];
                                    });
                                  },
                                ),
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Transaction Logs",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Transaction Logs";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Transaction Logs";
                                            shared.homewidget = [
                                              const Transactionlogs()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Transaction Logs";
                                    shared.homewidget = [
                                      const Transactionlogs()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Remittance Sent",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Remittance Sent";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Remittance Sent";
                                            shared.homewidget = [
                                              const Remittancesent()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Remittance Sent";
                                    shared.homewidget = [
                                      const Remittancesent()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Remittance Claimed",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Remittance Claimed";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Remittance Claimed";
                                            shared.homewidget = [
                                              const Remittanceclaimed()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Remittance Claimed";
                                    shared.homewidget = [
                                      const Remittanceclaimed()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Remittance Cancelled",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Remittance Cancelled";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "Remittance Cancelled";
                                            shared.homewidget = [
                                              const Remittancecancelled()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Remittance Cancelled";
                                    shared.homewidget = [
                                      const Remittancecancelled()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Activity History",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Activity History";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Activity History";
                                            shared.homewidget = [
                                              const Activityhistory()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Activity History";
                                    shared.homewidget = [
                                      const Activityhistory()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "MPIN Change - Password",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header =
                                            "MPIN Change - Password";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "MPIN Change - Password";
                                            shared.homewidget = [
                                              const MPINchangepassword()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "MPIN Change - Password";
                                    shared.homewidget = [
                                      const MPINchangepassword()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Resend SMS Activation",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Resend SMS Activation";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "Resend SMS Activation";
                                            shared.homewidget = [
                                              const Resendsmsactivation()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Resend SMS Activation";
                                    shared.homewidget = [
                                      const Resendsmsactivation()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Login - Logout",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Login - Logout";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Login - Logout";
                                            shared.homewidget = [
                                              const Loginlogout()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Login - Logout";
                                    shared.homewidget = [const Loginlogout()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "User Activity Logs",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "User Activity Logs";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "User Activity Logs";
                                            shared.homewidget = [
                                              const Useractivitylogs()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "User Activity Logs";
                                    shared.homewidget = [
                                      const Useractivitylogs()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Suspicious Transaction",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header =
                                            "Suspicious Transaction";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "Suspicious Transaction";
                                            shared.homewidget = [
                                              const Suspicioustransaction()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Suspicious Transaction";
                                    shared.homewidget = [
                                      const Suspicioustransaction()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Register Clients",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Register Clients";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Register Clients";
                                            shared.homewidget = [
                                              const Registerclients()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Register Clients";
                                    shared.homewidget = [
                                      const Registerclients()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Valid Transaction",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Valid Transaction";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Valid Transaction";
                                            shared.homewidget = [
                                              const Validtransaction()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Valid Transaction";
                                    shared.homewidget = [
                                      const Validtransaction()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "CS Dashboard",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "CS Dashboard";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "CS Dashboard";
                                            shared.homewidget = [
                                              const CSdashboard()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "CS Dashboard";
                                    shared.homewidget = [const CSdashboard()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Reconn CCM",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Reconn CCM";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Reconn CCM";
                                            shared.homewidget = [
                                              const Reconnccm()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Reconn CCM";
                                    shared.homewidget = [const Reconnccm()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "SMS Log Report",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "SMS Log Report";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "SMS Log Report";
                                            shared.homewidget = [
                                              const Smslogreport()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "SMS Log Report";
                                    shared.homewidget = [const Smslogreport()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Account Status Report",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Account Status Report";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "Account Status Report";
                                            shared.homewidget = [
                                              const Accountstatusreport()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Account Status Report";
                                    shared.homewidget = [
                                      const Accountstatusreport()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "List of Agent Report",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "List of Agent Report";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "List of Agent Report";
                                            shared.homewidget = [
                                              const Listofagentreport()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "List of Agent Report";
                                    shared.homewidget = [
                                      const Listofagentreport()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Igate Recentiliation",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Igate Recentiliation";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "Igate Recentiliation";
                                            shared.homewidget = [
                                              const Igaterecentiliation()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Igate Recentiliation";
                                    shared.homewidget = [
                                      const Igaterecentiliation()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Activated Merchant",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Activated Merchant";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Activated Merchant";
                                            shared.homewidget = [
                                              const Activatedmerchant()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Activated Merchant";
                                    shared.homewidget = [
                                      const Activatedmerchant()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Deactivated Merchant",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Deactivated Merchant";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Activated Merchant";
                                            shared.homewidget = [
                                              const Deactivatedmerchant()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Deactivated Merchant";
                                    shared.homewidget = [
                                      const Deactivatedmerchant()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Used Device ID",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Used Device ID";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title = "Used Device ID";
                                            shared.homewidget = [
                                              const Useddeviceid()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Used Device ID";
                                    shared.homewidget = [const Useddeviceid()];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Failed Enrollment Report",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header =
                                            "Failed Enrollment Report";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = () {
                                      setState(() {
                                        shared.onPress = () {
                                          setState(() {
                                            shared.icon =
                                                Icons.content_copy_outlined;
                                            shared.addicon =
                                                Icons.report_outlined;
                                            shared.uploadbutton = "";
                                            shared.subuploadbutton = "";
                                            shared.addbutton = "New Report";
                                            shared.subaddbutton =
                                                "Generate Reports";
                                            shared.header = "Reports";
                                            shared.title =
                                                "Failed Enrollment Report";
                                            shared.homewidget = [
                                              const Failedenrollmentreport()
                                            ];
                                          });
                                        };
                                        shared.icon = Icons.report_outlined;
                                        shared.addicon = Icons.save_outlined;
                                        shared.header =
                                            "Report  >  Create / Edit";
                                        shared.addbutton = "Save";
                                        shared.subaddbutton = "Save Report";
                                        shared.title = "Create / Edit";
                                        shared.homewidget = [const Addusers()];
                                      });
                                    };
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.addicon = Icons.report_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "New Report";
                                    shared.subaddbutton = "Generate Reports";
                                    shared.header = "Reports";
                                    shared.title = "Failed Enrollment Report";
                                    shared.homewidget = [
                                      const Failedenrollmentreport()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.content_copy_outlined,
                                title: "Core Transaction",
                                onTap: () {
                                  setState(() {
                                    shared.onTaps = () {
                                      setState(() {
                                        shared.header = "Core Transaction";
                                        shared.title = "Change Password";
                                        shared.homewidget = [
                                          const Changepassword()
                                        ];
                                      });
                                    };
                                    shared.onPress = null;
                                    shared.addicon = null;
                                    shared.icon = Icons.content_copy_outlined;
                                    shared.uploadbutton = "";
                                    shared.subuploadbutton = "";
                                    shared.addbutton = "";
                                    shared.subaddbutton = "";
                                    shared.header = "Enrollment";
                                    shared.title = "Core Transaction";
                                    shared.homewidget = [
                                      const Coretransaction()
                                    ];
                                  });
                                },
                              ),
                              Listtile(
                                color: Colors.black,
                                icon: Icons.dashboard,
                                title: "ECPay Reconciliation",
                                onTap: () {
                                  setState(() {
                                    shared.title = "ECPay Reconciliation";
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Header(
                    user: widget.user!,
                    icon: shared.icon,
                    header: shared.header,
                    addicon: shared.addicon,
                    title: shared.title,
                    addbutton: shared.addbutton,
                    subaddbutton: shared.subaddbutton,
                    uploadbutton: shared.uploadbutton,
                    subuploadbutton: shared.subuploadbutton,
                    onPress: shared.onPress,
                    onTaps: shared.onTaps,
                  ),
                  Contains(
                    child: shared.homewidget,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
