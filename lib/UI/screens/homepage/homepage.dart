import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/screens/administration/hierarchy/addhierarchy/add_hierarchy.dart';
import 'package:webtool_rep/UI/screens/administration/rolemanagement/addroles/add_roles.dart';
import 'package:webtool_rep/UI/screens/administration/rolemanagement/role_management.dart';
import 'package:webtool_rep/UI/screens/administration/usermanagement/adduser/add_user.dart';
import 'package:webtool_rep/UI/screens/customerservice/csrdashboard/addcsrdashboard/add_csrdashboard.dart';
import 'package:webtool_rep/UI/screens/homepage/main_dashboard.dart';
import 'package:webtool_rep/UI/screens/login/change_password.dart';
import 'package:webtool_rep/UI/screens/monitoring/agentdashboard/agent_dashboard.dart';
import 'package:webtool_rep/UI/screens/monitoring/authorizedresetpassword/authorized_reset_password.dart';
import 'package:webtool_rep/UI/screens/monitoring/failedenrollment/failed_enrollment.dart';
import 'package:webtool_rep/UI/screens/monitoring/listofagent/list_of_agent.dart';
import 'package:webtool_rep/UI/screens/monitoring/listofuseddevice/list_of_used_device.dart';
import 'package:webtool_rep/UI/screens/monitoring/slfrequest/slf_request.dart';
import 'package:webtool_rep/UI/screens/monitoring/smslogs/sms_logs.dart';
import 'package:webtool_rep/UI/screens/monitoring/transactionforconfirmation/transaction_for_confirmation.dart';
import 'package:webtool_rep/UI/screens/monitoring/transactionlog/transaction_log.dart';
import 'package:webtool_rep/UI/screens/reports/resendsmsactivation/resend_sms_activation.dart';
import 'package:webtool_rep/UI/screens/reports/webtooluserreport/webtooluser_report.dart';
import 'package:webtool_rep/UI/widgets/header.dart';
import '../../../UI/utils/constant.dart';
import '../../../UI/widgets/contains.dart';
import '../../../UI/widgets/listTile.dart';
import '../../../UI/widgets/sidemenu.dart';
import '../../utils/responsive.dart';
import '../administration/hierarchy/hierarchy.dart';
import '../administration/usermanagement/user_management.dart';
import '../customerservice/broadcastmessage/broadcast_message.dart';
import '../customerservice/csrdashboard/csr_dashboard.dart';
import '../customerservice/csrhotline/csr_hotline.dart';
import '../customerservice/typeofconcern/type_of_concern.dart';
import '../dashboard/activeclient/active_client.dart';
import '../dashboard/banktransaction/bank_transaction.dart';
import '../dashboard/clienttransaction/client_transaction.dart';
import '../dashboard/eloadetransaction/eload_transaction.dart';
import '../dashboard/registerclient/register_client.dart';
import '../enrollment/clientlistforregistration/client_list_for_registration.dart';
import '../monitoring/clientprofile/client_profile.dart';
import '../monitoring/operationdashboard/operation_dashboard.dart';
import '../monitoring/remitancetransactionlog/remittance_transaction_log.dart';
import '../monitoring/remittancedashboard/remittance_dashboard.dart';
import '../reports/Remittancesent/remittance_sent.dart';
import '../reports/accountstatusreport/account_status_report.dart';
import '../reports/activatedmerchant/activated_merchant.dart';
import '../reports/activityhistory/activity_history.dart';
import '../reports/coretransaction/core_transaction.dart';
import '../reports/csdashboard/cs_dashboard.dart';
import '../reports/deactivatedmerchant/deactivated_merchant.dart';
import '../reports/failedenrollmentreport/failed_enrollment_report.dart';
import '../reports/igaterecentiliation/igate_recentiliation.dart';
import '../reports/listofagentreport/list_of_agent_report.dart';
import '../reports/loginlogout/login_logout.dart';
import '../reports/mpinchangepassword/mpin_change_password.dart';
import '../reports/reconnccm/reconn_ccm.dart';
import '../reports/registerclients/register_clients.dart';
import '../reports/remittancecancelled/remittance_cancelled.dart';
import '../reports/remittanceclaimed/Remittance_claimed.dart';
import '../reports/smslogreport/sms_log_report.dart';
import '../reports/suspicioustransactio/suspicious_transaction.dart';
import '../reports/transactionlog/transaction_log.dart';
import '../reports/useddeviceid/used_device_id.dart';
import '../reports/useractivitylogs/user_activity_logs.dart';
import '../reports/validtransaction/valid_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> homewidget = [const Maindashboard()];
  String title = "Dashboard";
  String header = "Home";
  String addbutton = "";
  String subaddbutton = "";
  String uploadbutton = "";
  String subuploadbutton = "";
  IconData? icon = Icons.home_outlined;
  IconData? addicon;
  VoidCallback? onPress;
  VoidCallback? onTaps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            SizedBox(
              width: 250.0,
              child: Drawer(
                  backgroundColor: kTertiaryColor5,
                  child: ListView(
                    children: [
                      DrawerHeader(
                        child: Row(
                          children: const [
                            Expanded(
                              child: Image(
                                height: 100.0,
                                width: 100.0,
                                image: AssetImage("assets/icons/kplus.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Sidemenu(
                        icon: Icons.dashboard_outlined,
                        title: "Dashboard",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.account_circle_outlined,
                            title: "Register Client",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = CupertinoIcons.cube;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Dashboard";
                                title = "Register Client";
                                homewidget = [const Registerclient()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.check_circle_outline_outlined,
                            title: "Active Client",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = CupertinoIcons.cube;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Dashboard";
                                title = "Active Client";
                                homewidget = [const Activeclient()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.receipt_long_outlined,
                            title: "Client Transaction",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = CupertinoIcons.cube;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Dashboard";
                                title = "Client Transaction";
                                homewidget = [const Clienttransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.receipt_outlined,
                            title: "eLoad Transaction",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = CupertinoIcons.cube;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Dashboard";
                                title = "eLoad Transaction";
                                homewidget = [const eLoadtransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.account_balance_outlined,
                            title: "Bank Transaction",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = CupertinoIcons.cube;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Dashboard";
                                title = "Bank Transaction";
                                homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.admin_panel_settings_outlined,
                        title: "Administration",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.person_outline,
                            title: "User Management",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.perm_identity;
                                        addicon = Icons.add_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New User";
                                        subaddbutton = "Add New User Data";
                                        header = "Administration";
                                        title = "User Management";
                                        homewidget = [const Usermanagement()];
                                      });
                                    };
                                    icon = Icons.add_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Administration  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save All User Data";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.perm_identity;
                                addicon = Icons.add_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New User";
                                subaddbutton = "Add New User Data";
                                header = "Administration";
                                title = "User Management";
                                homewidget = [const Usermanagement()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.people_outline,
                            title: "Role Management",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        addicon = Icons.add_outlined;
                                        icon = CupertinoIcons.person_3;
                                        addicon = Icons.add_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Role";
                                        subaddbutton = "Add New Role Data";
                                        header = "Administration";
                                        title = "Role Management";
                                        homewidget = [const Rolemanagement()];
                                      });
                                    };
                                    icon = Icons.add_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Administration  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save All Roles";
                                    title = "Create / Edit";
                                    homewidget = [const Addroles()];
                                  });
                                };
                                addicon = Icons.add_outlined;
                                icon = CupertinoIcons.person_3;
                                addicon = Icons.add_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Role";
                                subaddbutton = "Add New Role Data";
                                header = "Administration";
                                title = "Role Management";
                                homewidget = [const Rolemanagement()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.lan_outlined,
                            title: "Hierarchy",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        addicon = Icons.add_outlined;
                                        icon = Icons.lan_outlined;
                                        uploadbutton = "Upload";
                                        subuploadbutton =
                                            "Upload Hierarchy Data";
                                        addbutton = "New Hierarchy";
                                        subaddbutton = "Add New Hierarchy Data";
                                        header = "Administration";
                                        title = "Hierarchy";
                                        homewidget = [const Hierarchy()];
                                      });
                                    };
                                    icon = Icons.add_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Administration  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Hierarchy";
                                    title = "Create / Edit";
                                    homewidget = [const Addhierarchy()];
                                  });
                                };
                                addicon = Icons.add_outlined;
                                icon = Icons.lan_outlined;
                                uploadbutton = "Upload";
                                subuploadbutton = "Upload Hierarchy Data";
                                addbutton = "New Hierarchy";
                                subaddbutton = "Add New Hierarchy Data";
                                header = "Administration";
                                title = "Hierarchy";
                                homewidget = [const Hierarchy()];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.person_add_alt_outlined,
                        title: "Enrollment",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Client List for Registration",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = null;
                                addicon = null;
                                icon = Icons.menu;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Enrollment";
                                title = "Client List for Registration";
                                homewidget = [
                                  const Clientlistforregistration()
                                ];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.person_outline,
                        title: "Monitoring",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Client Profile",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.person_outline;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Client Profile";
                                homewidget = [const Clientprofile()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Remittance Dashboard",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.content_copy_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Remittance Dashboard";
                                homewidget = [const Remittancedashboard()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.mobile_friendly_outlined,
                            title: "Transaction for Confirmation",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.mobile_friendly_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Transaction for Confirmation";
                                homewidget = [
                                  const Transactionforconfirmation()
                                ];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.money_outlined,
                            title: "Remittance Transaction Log",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.content_copy_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Remittance Transaction Log";
                                homewidget = [const Remittancetransactionlog()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.email_outlined,
                            title: "SMS Logs",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.email_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "SMS Logs";
                                homewidget = [const Smslogs()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.archive_outlined,
                            title: "SLF Request",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.archive_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "SLF Request";
                                homewidget = [const Slfrequest()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Transaction Log",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Transaction Log";
                                homewidget = [const Transactionlog()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Operation Dashboard",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Operation Dashboard";
                                homewidget = [const Operationdashboard()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Authorized Reset Password and MPIN",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Authorized Reset Password and MPIN";
                                homewidget = [const Authorizedresetpassword()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Agent Dashboard",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Agent Dashboard";
                                homewidget = [const Agentdashboard()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.smartphone_outlined,
                            title: "List of Used Device ID",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.smartphone_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "List of Used Device ID";
                                homewidget = [const Listofuseddevice()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.list_outlined,
                            title: "Failed Enrollment List",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.list_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "Failed Enrollment List";
                                homewidget = [const Failedenrollment()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: CupertinoIcons.cube,
                            title: "List of Agent",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                addicon = null;
                                onPress = null;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Monitoring";
                                title = "List of Agent";
                                homewidget = [const Listofagent()];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.settings_outlined,
                        title: "Utilities",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Fee Structure",
                            onTap: () {
                              setState(() {
                                title = "Fee Structure";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "List of Agent",
                            onTap: () {
                              setState(() {
                                title = "List of Agent";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Parameter",
                            onTap: () {
                              setState(() {
                                title = "Parameter";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "DCM Location",
                            onTap: () {
                              setState(() {
                                title = "DCM Location";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Bank News",
                            onTap: () {
                              setState(() {
                                title = "Bank News";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Products and Services",
                            onTap: () {
                              setState(() {
                                title = "Products and Services";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Service Downtime",
                            onTap: () {
                              setState(() {
                                title = "Service Downtime";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Institution",
                            onTap: () {
                              setState(() {
                                title = "Institution";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Branch",
                            onTap: () {
                              setState(() {
                                title = "Branch";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Unit",
                            onTap: () {
                              setState(() {
                                title = "Unit";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Center",
                            onTap: () {
                              setState(() {
                                title = "Center";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Provider",
                            onTap: () {
                              setState(() {
                                title = "Provider";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Product Type",
                            onTap: () {
                              setState(() {
                                title = "Product Type";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Product Category",
                            onTap: () {
                              setState(() {
                                title = "Product Category";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Biller Product",
                            onTap: () {
                              setState(() {
                                title = "Biller Product";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Load Product",
                            onTap: () {
                              setState(() {
                                title = "Load Product";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Commission Setup",
                            onTap: () {
                              setState(() {
                                title = "Commission Setup";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "IBFT Bank List",
                            onTap: () {
                              setState(() {
                                title = "IBFT Bank List";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Partner",
                            onTap: () {
                              setState(() {
                                title = "Partner";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Splash Screen",
                            onTap: () {
                              setState(() {
                                title = "Splash Screen";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.phone_outlined,
                        title: "Customer Service",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.person_outline,
                            title: "CSR Dashboard",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    icon = Icons.add_outlined;
                                    addicon = Icons.save_outlined;
                                    header =
                                        "Customer Service  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save All User Data";
                                    title = "Create / Edit";
                                    homewidget = [const Addcsrdashboard()];
                                  });
                                };
                                icon = Icons.perm_identity;
                                addicon = Icons.add_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New CS Dashboard";
                                subaddbutton = "Add New CS Dashboard";
                                header = "Customer Service";
                                title = "CSR Dashboard";
                                homewidget = [const Csrdashboard()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.email_outlined,
                            title: "Broadcast Message",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {};
                                addicon = Icons.add_outlined;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Message";
                                subaddbutton = "Add New Dashboard";
                                header = "Customer Service";
                                title = "Broadcast Message";
                                homewidget = [const Broadcastmessage()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.star_outline,
                            title: "Type of Concern",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {};
                                addicon = Icons.add_outlined;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Concern";
                                subaddbutton = "Add New Type Concern";
                                header = "Customer Service";
                                title = "Type of Concern";
                                homewidget = [const Typeofconcern()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.phone_outlined,
                            title: "CSR Hotline",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Client Profile";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {};
                                addicon = Icons.add_outlined;
                                icon = Icons.list_alt_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New CSR Hotline";
                                subaddbutton = "Add New Data";
                                header = "Customer Service";
                                title = "CSR Hotline";
                                homewidget = [const Csrhotline()];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.newspaper_outlined,
                        title: "Report",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Webtool User Listing",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Webtool User Listing";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Webtool User Listing";
                                        homewidget = [const Webtoolusereport()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Webtool User Listing";
                                homewidget = [const Webtoolusereport()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Transaction Logs",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Transaction Logs";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Transaction Logs";
                                        homewidget = [const Transactionlogs()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Transaction Logs";
                                homewidget = [const Transactionlogs()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Remittance Sent",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Remittance Sent";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Remittance Sent";
                                        homewidget = [const Remittancesent()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Remittance Sent";
                                homewidget = [const Remittancesent()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Remittance Claimed",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Remittance Claimed";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Remittance Claimed";
                                        homewidget = [
                                          const Remittanceclaimed()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Remittance Claimed";
                                homewidget = [const Remittanceclaimed()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Remittance Cancelled",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Remittance Cancelled";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Remittance Cancelled";
                                        homewidget = [
                                          const Remittancecancelled()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Remittance Cancelled";
                                homewidget = [const Remittancecancelled()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Activity History",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Activity History";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Activity History";
                                        homewidget = [const Activityhistory()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Activity History";
                                homewidget = [const Activityhistory()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "MPIN Change - Password",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "MPIN Change - Password";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "MPIN Change - Password";
                                        homewidget = [
                                          const MPINchangepassword()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "MPIN Change - Password";
                                homewidget = [const MPINchangepassword()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Resend SMS Activation",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Resend SMS Activation";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Resend SMS Activation";
                                        homewidget = [
                                          const Resendsmsactivation()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Resend SMS Activation";
                                homewidget = [const Resendsmsactivation()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Login - Logout",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Login - Logout";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Login - Logout";
                                        homewidget = [const Loginlogout()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Login - Logout";
                                homewidget = [const Loginlogout()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "User Activity Logs",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "User Activity Logs";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "User Activity Logs";
                                        homewidget = [const Useractivitylogs()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "User Activity Logs";
                                homewidget = [const Useractivitylogs()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Suspicious Transaction",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Suspicious Transaction";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Suspicious Transaction";
                                        homewidget = [
                                          const Suspicioustransaction()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Suspicious Transaction";
                                homewidget = [const Suspicioustransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Register Clients",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Register Clients";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Register Clients";
                                        homewidget = [const Registerclients()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Register Clients";
                                homewidget = [const Registerclients()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Valid Transaction",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Valid Transaction";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Valid Transaction";
                                        homewidget = [const Validtransaction()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Valid Transaction";
                                homewidget = [const Validtransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "CS Dashboard",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "CS Dashboard";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "CS Dashboard";
                                        homewidget = [const CSdashboard()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "CS Dashboard";
                                homewidget = [const CSdashboard()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Reconn CCM",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Reconn CCM";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Reconn CCM";
                                        homewidget = [const Reconnccm()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Reconn CCM";
                                homewidget = [const Reconnccm()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "SMS Log Report",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "SMS Log Report";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "SMS Log Report";
                                        homewidget = [const Smslogreport()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "SMS Log Report";
                                homewidget = [const Smslogreport()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Account Status Report",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Account Status Report";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Account Status Report";
                                        homewidget = [
                                          const Accountstatusreport()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Account Status Report";
                                homewidget = [const Accountstatusreport()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "List of Agent Report",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "List of Agent Report";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "List of Agent Report";
                                        homewidget = [
                                          const Listofagentreport()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "List of Agent Report";
                                homewidget = [const Listofagentreport()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Igate Recentiliation",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Igate Recentiliation";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Igate Recentiliation";
                                        homewidget = [
                                          const Igaterecentiliation()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Igate Recentiliation";
                                homewidget = [const Igaterecentiliation()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Activated Merchant",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Activated Merchant";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Activated Merchant";
                                        homewidget = [
                                          const Activatedmerchant()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Activated Merchant";
                                homewidget = [const Activatedmerchant()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Deactivated Merchant",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Deactivated Merchant";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Activated Merchant";
                                        homewidget = [
                                          const Deactivatedmerchant()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Deactivated Merchant";
                                homewidget = [const Deactivatedmerchant()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Used Device ID",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Used Device ID";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Used Device ID";
                                        homewidget = [const Useddeviceid()];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Used Device ID";
                                homewidget = [const Useddeviceid()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Failed Enrollment Report",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Failed Enrollment Report";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = () {
                                  setState(() {
                                    onPress = () {
                                      setState(() {
                                        icon = Icons.content_copy_outlined;
                                        addicon = Icons.report_outlined;
                                        uploadbutton = "";
                                        subuploadbutton = "";
                                        addbutton = "New Report";
                                        subaddbutton = "Generate Reports";
                                        header = "Reports";
                                        title = "Failed Enrollment Report";
                                        homewidget = [
                                          const Failedenrollmentreport()
                                        ];
                                      });
                                    };
                                    icon = Icons.report_outlined;
                                    addicon = Icons.save_outlined;
                                    header = "Report  >  Create / Edit";
                                    addbutton = "Save";
                                    subaddbutton = "Save Report";
                                    title = "Create / Edit";
                                    homewidget = [const Addusers()];
                                  });
                                };
                                icon = Icons.content_copy_outlined;
                                addicon = Icons.report_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "New Report";
                                subaddbutton = "Generate Reports";
                                header = "Reports";
                                title = "Failed Enrollment Report";
                                homewidget = [const Failedenrollmentreport()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.content_copy_outlined,
                            title: "Core Transaction",
                            onTap: () {
                              setState(() {
                                onTaps = () {
                                  setState(() {
                                    header = "Core Transaction";
                                    title = "Change Password";
                                    homewidget = [const Changepassword()];
                                  });
                                };
                                onPress = null;
                                addicon = null;
                                icon = Icons.content_copy_outlined;
                                uploadbutton = "";
                                subuploadbutton = "";
                                addbutton = "";
                                subaddbutton = "";
                                header = "Enrollment";
                                title = "Core Transaction";
                                homewidget = [const Coretransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "ECPay Reconciliation",
                            onTap: () {
                              setState(() {
                                title = "ECPay Reconciliation";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Header(
                    icon: icon,
                    header: header,
                    addicon: addicon,
                    title: title,
                    addbutton: addbutton,
                    subaddbutton: subaddbutton,
                    uploadbutton: uploadbutton,
                    subuploadbutton: subuploadbutton,
                    onPress: onPress,
                    onTaps: onTaps,
                  ),
                  Contains(
                    child: homewidget,
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
