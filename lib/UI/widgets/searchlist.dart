class StateService {
  static final List<String> states = [
    'Register Client',
    'Active Client',
    'Client Transaction',
    'eLoad Transaction',
    'Bank Transaction',
    'User Management',
    'Roles Management',
    'Client List for Registration',
    'Client Profile',
    'Remittance Dashboard',
    'Transaction for Confirmation',
    'Remittance Transaction Log',
    'SMS Logs',
    'SLF Request',
    'Transaction Log',
    'Operation Dashboard',
    'Authorized Reset Password and MPIN',
    'Agent Dashboard',
    'List of Used Device ID',
    'Failed Enrollment',
    'List of Agent',
    'Fee Structure',
    'MADHYA PRADESH',
    'Parameter',
    'DCM Location',
    'Bank News',
    'Product and Services',
    'Service Downtime',
    'Institution',
    'Branch',
    'Unit',
    'Center',
    'Provider',
    'Product Type',
    'Biller Product',
    'Load Product',
    'Commission Setup',
    'IBFT Bank List',
    'Partner',
    'Splash Screen',
    'CSR Dashboard',
    'UTTAR PRADESH',
    'Broadcast Message',
    'Type of Concern',
    'CSR Hotline',
    'Webtool User Listing',
    'Remittance Sent',
    'Remittance Claimed',
    'Remittance Cancelled',
    'Active History',
    'MPIN Password Change',
    'Resend SMS Activation ',
    'Login Logout',
    'User Activity Logs',
    'Suspicious Transaction',
    'Registered Clients',
    'Valid Transaction',
    'CS Dashboard',
    'Recon CCM',
    'SMS Log Report',
    'Account Status Report',
    'List of Agent Report',
    'Igate Recentiliation',
    'Activity Merchant',
    'Deactivated Merchant',
    'Used Device I.D',
    'Failed Enrollment Report',
    'Core Transaction',
    'ECPay Reconciliation'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
