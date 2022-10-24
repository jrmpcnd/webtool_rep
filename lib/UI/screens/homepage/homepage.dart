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
                            icon: Icons.dashboard,
                            title: "Web Tool User Listing",
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
                                header = "Reports";
                                title = "Web Tool User Listing";
                                homewidget = [const Webtoolusereport()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Transaction Logs",
                            onTap: () {
                              setState(() {
                                title = "Transaction Logs";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Remittance Sent",
                            onTap: () {
                              setState(() {
                                title = "Remittance Sent";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Remittance Claimed",
                            onTap: () {
                              setState(() {
                                title = "Remittance Claimed";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Remittance Cancelled",
                            onTap: () {
                              setState(() {
                                title = "Remittance Cancelled";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Activity History",
                            onTap: () {
                              setState(() {
                                title = "Activity History";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "MPIN Password Change",
                            onTap: () {
                              setState(() {
                                title = "MPIN Password Change";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Resend SMS Activation ",
                            onTap: () {
                              setState(() {
                                title = "Resend SMS Activation ";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Login Logout",
                            onTap: () {
                              setState(() {
                                title = "Login Logout";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "User Activity Logs",
                            onTap: () {
                              setState(() {
                                title = "User Activity Logs";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Suspicious Transaction",
                            onTap: () {
                              setState(() {
                                title = "Suspicious Transaction";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Registered Clients",
                            onTap: () {
                              setState(() {
                                title = "Registered Clients";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Valid Transaction",
                            onTap: () {
                              setState(() {
                                title = "Valid Transaction";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "CS Dashboard",
                            onTap: () {
                              setState(() {
                                title = "CS Dashboard";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Recon CCM",
                            onTap: () {
                              setState(() {
                                title = "Recon CCM";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "SMS Log Report",
                            onTap: () {
                              setState(() {
                                title = "SMS Log Report";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Account Status Report",
                            onTap: () {
                              setState(() {
                                title = "Account Status Report";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "List of Agent Report",
                            onTap: () {
                              setState(() {
                                title = "List of Agent Report";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Igate Recentiliation",
                            onTap: () {
                              setState(() {
                                title = "Igate Recentiliation";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Activity Merchant",
                            onTap: () {
                              setState(() {
                                title = "Activity Merchant";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Deactivated Merchant",
                            onTap: () {
                              setState(() {
                                title = "Deactivated Merchant";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Used Device ID",
                            onTap: () {
                              setState(() {
                                title = "Used Device ID";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Failed Enrollment Report",
                            onTap: () {
                              setState(() {
                                title = "Failed Enrollment Report";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Core Transaction",
                            onTap: () {
                              setState(() {
                                title = "Core Transaction";
                                // homewidget = [const Banktransaction()];
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
