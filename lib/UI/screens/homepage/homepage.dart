import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/screens/administration/rolemanagement/rolemanagement.dart';
import 'package:webtool_rep/UI/widgets/containers.dart';
import 'package:webtool_rep/UI/widgets/header.dart';
import '../../../UI/utils/constant.dart';
import '../../../UI/widgets/contains.dart';
import '../../../UI/widgets/listTile.dart';
import '../../../UI/widgets/sidemenu.dart';
import '../../utils/responsive.dart';
import '../administration/hierarchy/hierarchy.dart';
import '../administration/usermanagement/usermanagement.dart';
import '../dashboard/activeclient/activeclient.dart';
import '../dashboard/banktransaction/banktransaction.dart';
import '../dashboard/clienttransaction/clienttransaction.dart';
import '../dashboard/eloadetransaction/eloadtransaction.dart';
import '../dashboard/registerclient/registerclient.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> homewidget = [];
  String title = "Dashboard";
  String header = "";
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
                            icon: Icons.dashboard,
                            title: "User Management",
                            onTap: () {
                              setState(() {
                                header = "Administration";
                                title = "User Management";
                                homewidget = [const Usermanagement()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Role Management",
                            onTap: () {
                              setState(() {
                                title = "Role Management";
                                homewidget = [const Rolemanagement()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Hierarchy",
                            onTap: () {
                              setState(() {
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
                                title = "Client List for Registration";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                        ],
                      ),
                      Sidemenu(
                        icon: Icons.monitor_outlined,
                        title: "Monitoring",
                        child: [
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Client Profile",
                            onTap: () {
                              setState(() {
                                title = "Client Profile";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Remittance Dashboard",
                            onTap: () {
                              setState(() {
                                title = "Remittance Dashboard";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Transaction for Confirmation",
                            onTap: () {
                              setState(() {
                                title = "Transaction for Confirmation";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Remittance Transaction Log",
                            onTap: () {
                              setState(() {
                                title = "Remittance Transaction Log";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "SMS Logs",
                            onTap: () {
                              setState(() {
                                title = "SMS Logs";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "SLF Request",
                            onTap: () {
                              setState(() {
                                title = "SLF Request";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Transaction Log",
                            onTap: () {
                              setState(() {
                                title = "Transaction Log";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Operation Dashboard",
                            onTap: () {
                              setState(() {
                                title = "Operation Dashboard";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Authorized Reset Password",
                            onTap: () {
                              setState(() {
                                title = "Authorized Reset Password";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Agent Dashboard",
                            onTap: () {
                              setState(() {
                                title = "Agent Dashboard";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "List of Used Device ID",
                            onTap: () {
                              setState(() {
                                title = "List of Used Device ID";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Failed Enrollment",
                            onTap: () {
                              setState(() {
                                title = "Failed Enrollment";
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
                            icon: Icons.dashboard,
                            title: "CSR Dashboard",
                            onTap: () {
                              setState(() {
                                title = "CSR Dashboard";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Broadcast Message",
                            onTap: () {
                              setState(() {
                                title = "Broadcast Message";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "Type of Concern",
                            onTap: () {
                              setState(() {
                                title = "Type of Concern";
                                // homewidget = [const Banktransaction()];
                              });
                            },
                          ),
                          Listtile(
                            color: Colors.black,
                            icon: Icons.dashboard,
                            title: "CSR Hotline",
                            onTap: () {
                              setState(() {
                                title = "CSR Hotline";
                                // homewidget = [const Banktransaction()];
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
                                title = "Web Tool User Listing";
                                // homewidget = [const Banktransaction()];
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
                  Header(header: header, title: title),
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
