// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app => 'Kazang Pay';

  @override
  String get settings => 'Settings';

  @override
  String get transactionHistory => 'Transaction History';

  @override
  String get welcome => 'Good Day';

  @override
  String companyWelcome(Object name) {
    return 'Welcome to $name';
  }

  @override
  String get newSale => 'New Sale';

  @override
  String get purchaseAmount => 'Purchase Amount';

  @override
  String get cashbackAmount => 'Cashback Amount';

  @override
  String get addCashback => 'Add Cashback';

  @override
  String get pay => 'Pay';

  @override
  String get insertOrTap => 'Insert Or Tap Card';

  @override
  String get amountDue => 'Amount Due';

  @override
  String get returnTo => 'Return To Transaction';

  @override
  String get cancel => 'Cancel Transaction';

  @override
  String get cancelTitle => 'You are about to cancel this transaction';

  @override
  String get cancelMessage => 'Your current transaction will be cancelled';

  @override
  String get checkBalance => 'Check Balance';

  @override
  String get enterPin => 'Enter Pin To Access Transaction History & Settlements';

  @override
  String get supervisorPin => 'Please provide your supervisor pin';

  @override
  String get continueButton => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get transactionHistoryTitle => 'Transaction History & Settlements';

  @override
  String get ok => 'Ok';

  @override
  String get error => 'Error';

  @override
  String get unexpectedError => 'Unexpected error occurred, please try again.';

  @override
  String get removeCard => 'Remove Card';

  @override
  String get merchantReceipt => 'Merchant Receipt';

  @override
  String get customerReceipt => 'Customer Receipt';

  @override
  String get view => 'View';

  @override
  String get print => 'Print';

  @override
  String get merchantId => 'Merchant ID';

  @override
  String get merchantName => 'Merchant Name';

  @override
  String get terminalId => 'TERMINAL ID';

  @override
  String get date => 'DATE';

  @override
  String get time => 'TIME';

  @override
  String get aid => 'AID';

  @override
  String get pan => 'PAN';

  @override
  String get rrn => 'RRN';

  @override
  String get appType => 'APP';

  @override
  String get switchType => 'SWITCH';

  @override
  String get purchase => 'PURCHASE';

  @override
  String get total => 'TOTAL:';

  @override
  String get transseqNo => 'TRANSSEQNO';

  @override
  String get reason => 'REASON';

  @override
  String get selectAccount => 'Select An Account To Continue';

  @override
  String get accountBalance => 'Account Balance';

  @override
  String accountName(Object name) {
    return 'Account Name: $name';
  }

  @override
  String get checkAnother => 'Check Another Account';

  @override
  String get done => 'Done';

  @override
  String get sortBy => 'Sort By';

  @override
  String get dateFilter => 'Date';

  @override
  String get saleTransaction => 'Sale Transaction';

  @override
  String get approved => 'Approved';

  @override
  String get declined => 'Declined';

  @override
  String get pending => 'Pending';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get refunded => 'Refunded';

  @override
  String get settlementStatus => 'Status:';

  @override
  String get settled => 'Settled';

  @override
  String get onboardingWelcome => 'Welcome to Kazang Pay!';

  @override
  String get onboardingRegister => 'Congratulations, you are at the final step of setting up your Kazang Pay Card Reader.';

  @override
  String get onboardRegisterHelp => 'Please allow the Kazang Sales Agent to assist you with the final step.';

  @override
  String get signIn => 'Please provide your login credentials to continue:';

  @override
  String get standalone => 'Stand-Alone mode detected. ';

  @override
  String get onboard1 => 'You can now accept card payments for any sales on your Kazang device using your very own Kazang Pay device.';

  @override
  String get onboard2 => 'You can now top up your Kazang Wallet using your Kazang Pay device, no more trips to the banks and less risk for your business.';

  @override
  String get onboard3 => 'Your card payments will be transferred directly into your Kazang Wallet.';

  @override
  String get registerDevice => 'Register Device';

  @override
  String get accountNumber => 'Enter account number:';

  @override
  String get password => 'Enter Password:';

  @override
  String get enterSerialNumber => 'Enter Device Serial Number:';

  @override
  String get usernameError => 'Please enter a username.';

  @override
  String get passwordError => 'Please enter a password.';

  @override
  String get submit => 'Submit';

  @override
  String get loading => 'Loading please wait';

  @override
  String get initialized => 'Initialized';

  @override
  String get enterPinAccessSettings => 'Enter PIN To Access Settings';

  @override
  String get pleaseProvideSupervisorPin => 'Please provide your supervisor pin';

  @override
  String get noPinSet => 'No PIN has been set';

  @override
  String get setPinToProceed => 'Please set a pin to proceed';

  @override
  String get pinLengthError => 'PIN must be 4 digits long';

  @override
  String get incorrectPin => 'Invalid PIN';

  @override
  String get voidTransaction => 'Void Transaction';

  @override
  String get settlements => 'Settlements';

  @override
  String get totalSettlementAmount => 'Total Settlement Amount';

  @override
  String get viewMore => 'View More';

  @override
  String get noOfTransaction => 'Number of Transactions';

  @override
  String get noOfSettlements => 'Number of Settlements';

  @override
  String settlementSummaryFor(Object date) {
    return 'Settlement Summary for $date';
  }

  @override
  String get totalPurchaseFees => 'Total Purchase Fees:';

  @override
  String get totalPurchaseAmount => 'Total Purchase Amount:';

  @override
  String get totalCashbackAmount => 'Total Cashback Amount:';

  @override
  String get totalAmountProcessed => 'Total Amount Processed:';

  @override
  String get totalCashbackFees => 'Total Cashback Fees:';

  @override
  String get totalFees => 'Total Fees:';

  @override
  String settlementHistoryFor(Object date) {
    return 'Settlement History for $date';
  }

  @override
  String get totalSettlementAmountCalc => '* Total Settlement Amount = Total Amount Processed - Total Settlements completed - Fees';

  @override
  String get proxySettings => 'Proxy Settings';

  @override
  String get sendDeviceLogs => 'Send Device Logs';

  @override
  String get connectPos => 'Connect POS';

  @override
  String get supervisorPinTitle => 'Supervisor PIN';

  @override
  String get profile => 'Profile';

  @override
  String get language => 'Language';

  @override
  String get settlementDetails => 'Settlement Details';

  @override
  String get timeColumn => 'Time:';

  @override
  String get amount => 'Amount:';

  @override
  String get printReceipt => 'Print Receipt';

  @override
  String get printing => 'Printing';

  @override
  String get username => 'Username:';

  @override
  String get deviceSerial => 'Device Serial:';

  @override
  String get version => 'Version:';

  @override
  String get terminalIdTitle => 'Terminal ID:';

  @override
  String get loadingSettlements => 'Loading Settlements';

  @override
  String get profileInformation => 'Profile Information';

  @override
  String get serialNumberLengthMax => 'Ensure this field has no more than 14 characters.';

  @override
  String get serialNumberLengthMin => 'Ensure this field has at least 13 characters.';

  @override
  String get required => 'This field is required.';

  @override
  String get pinTooShort => 'PIN must be at least 4 digits long';

  @override
  String get manufacturer => 'Manufacturer:';

  @override
  String get model => 'Model:';

  @override
  String get voidConfirm => 'You are about to Void this transaction';

  @override
  String batteryLow(Object percentage) {
    return 'Battery is too low to transact safely. Please charge your device. $percentage%';
  }

  @override
  String get printerError => 'Printer error occurred, please check paper and try again.';

  @override
  String get usernameMin => 'Ensure this field has at least 10 characters.';

  @override
  String get usernameMax => 'Ensure this field has no more than 10 characters.';

  @override
  String get connectionError => 'Connection error occurred, please try again.';
}

/// The translations for English, as used in South Africa (`en_ZA`).
class AppLocalizationsEnZa extends AppLocalizationsEn {
  AppLocalizationsEnZa(): super('en_ZA');

  @override
  String get app => 'Kazang Pay';

  @override
  String get settings => 'Settings';

  @override
  String get transactionHistory => 'Transaction History';

  @override
  String get welcome => 'Good Day';

  @override
  String companyWelcome(Object name) {
    return 'Welcome to $name';
  }

  @override
  String get newSale => 'New Sale';

  @override
  String get purchaseAmount => 'Purchase Amount';

  @override
  String get cashbackAmount => 'Cashback Amount';

  @override
  String get addCashback => 'Add Cashback';

  @override
  String get pay => 'Pay';

  @override
  String get insertOrTap => 'Insert Or Tap Card';

  @override
  String get amountDue => 'Amount Due';

  @override
  String get returnTo => 'Return To Transaction';

  @override
  String get cancel => 'Cancel Transaction';

  @override
  String get cancelTitle => 'You are about to cancel this transaction';

  @override
  String get cancelMessage => 'Your current transaction will be cancelled';

  @override
  String get checkBalance => 'Check Balance';

  @override
  String get enterPin => 'Enter Pin To Access Transaction History & Settlements';

  @override
  String get supervisorPin => 'Please provide your supervisor pin';

  @override
  String get continueButton => 'Continue';

  @override
  String get back => 'Back';

  @override
  String get transactionHistoryTitle => 'Transaction History & Settlements';

  @override
  String get ok => 'Ok';

  @override
  String get error => 'Error';

  @override
  String get unexpectedError => 'Unexpected error occurred, please try again.';

  @override
  String get removeCard => 'Remove Card';

  @override
  String get merchantReceipt => 'Merchant Receipt';

  @override
  String get customerReceipt => 'Customer Receipt';

  @override
  String get view => 'View';

  @override
  String get print => 'Print';

  @override
  String get merchantId => 'Merchant ID';

  @override
  String get merchantName => 'Merchant Name';

  @override
  String get terminalId => 'TERMINAL ID';

  @override
  String get date => 'DATE';

  @override
  String get time => 'TIME';

  @override
  String get aid => 'AID';

  @override
  String get pan => 'PAN';

  @override
  String get rrn => 'RRN';

  @override
  String get appType => 'APP';

  @override
  String get switchType => 'SWITCH';

  @override
  String get purchase => 'PURCHASE';

  @override
  String get total => 'TOTAL:';

  @override
  String get transseqNo => 'TRANSSEQNO';

  @override
  String get reason => 'REASON';

  @override
  String get selectAccount => 'Select An Account To Continue';

  @override
  String get accountBalance => 'Account Balance';

  @override
  String accountName(Object name) {
    return 'Account Name: $name';
  }

  @override
  String get checkAnother => 'Check Another Account';

  @override
  String get done => 'Done';

  @override
  String get sortBy => 'Sort By';

  @override
  String get dateFilter => 'Date';

  @override
  String get saleTransaction => 'Sale Transaction';

  @override
  String get approved => 'Approved';

  @override
  String get declined => 'Declined';

  @override
  String get pending => 'Pending';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get refunded => 'Refunded';

  @override
  String get settlementStatus => 'Status:';

  @override
  String get settled => 'Settled';

  @override
  String get onboardingWelcome => 'Welcome to Kazang Pay!';

  @override
  String get onboardingRegister => 'Congratulations, you are at the final step of setting up your Kazang Pay Card Reader.';

  @override
  String get onboardRegisterHelp => 'Please allow the Kazang Sales Agent to assist you with the final step.';

  @override
  String get signIn => 'Please provide your login credentials to continue:';

  @override
  String get standalone => 'Stand-Alone mode detected. ';

  @override
  String get onboard1 => 'You can now accept card payments for any sales on your Kazang device using your very own Kazang Pay device.';

  @override
  String get onboard2 => 'You can now top up your Kazang Wallet using your Kazang Pay device, no more trips to the banks and less risk for your business.';

  @override
  String get onboard3 => 'Your card payments will be transferred directly into your Kazang Wallet.';

  @override
  String get registerDevice => 'Register Device';

  @override
  String get accountNumber => 'Enter account number:';

  @override
  String get password => 'Enter Password:';

  @override
  String get enterSerialNumber => 'Enter Device Serial Number:';

  @override
  String get usernameError => 'Please enter a username.';

  @override
  String get passwordError => 'Please enter a password.';

  @override
  String get submit => 'Submit';

  @override
  String get loading => 'Loading please wait';

  @override
  String get initialized => 'Initialized';

  @override
  String get enterPinAccessSettings => 'Enter PIN To Access Settings';

  @override
  String get pleaseProvideSupervisorPin => 'Please provide your supervisor pin';

  @override
  String get noPinSet => 'No PIN has been set';

  @override
  String get setPinToProceed => 'Please set a pin to proceed';

  @override
  String get pinLengthError => 'PIN must be 4 digits long';

  @override
  String get incorrectPin => 'Invalid PIN';

  @override
  String get voidTransaction => 'Void Transaction';

  @override
  String get settlements => 'Settlements';

  @override
  String get totalSettlementAmount => 'Total Settlement Amount';

  @override
  String get viewMore => 'View More';

  @override
  String get noOfTransaction => 'Number of Transactions';

  @override
  String get noOfSettlements => 'Number of Settlements';

  @override
  String settlementSummaryFor(Object date) {
    return 'Settlement Summary for $date';
  }

  @override
  String get totalPurchaseFees => 'Total Purchase Fees:';

  @override
  String get totalPurchaseAmount => 'Total Purchase Amount:';

  @override
  String get totalCashbackAmount => 'Total Cashback Amount:';

  @override
  String get totalAmountProcessed => 'Total Amount Processed:';

  @override
  String get totalCashbackFees => 'Total Cashback Fees:';

  @override
  String get totalFees => 'Total Fees:';

  @override
  String settlementHistoryFor(Object date) {
    return 'Settlement History for $date';
  }

  @override
  String get totalSettlementAmountCalc => '* Total Settlement Amount = Total Amount Processed - Total Settlements completed - Fees';

  @override
  String get proxySettings => 'Proxy Settings';

  @override
  String get sendDeviceLogs => 'Send Device Logs';

  @override
  String get connectPos => 'Connect POS';

  @override
  String get supervisorPinTitle => 'Supervisor PIN';

  @override
  String get profile => 'Profile';

  @override
  String get language => 'Language';

  @override
  String get settlementDetails => 'Settlement Details';

  @override
  String get timeColumn => 'Time:';

  @override
  String get amount => 'Amount:';

  @override
  String get printReceipt => 'Print Receipt';

  @override
  String get printing => 'Printing';

  @override
  String get username => 'Username:';

  @override
  String get deviceSerial => 'Device Serial:';

  @override
  String get version => 'Version:';

  @override
  String get terminalIdTitle => 'Terminal ID:';

  @override
  String get loadingSettlements => 'Loading Settlements';

  @override
  String get profileInformation => 'Profile Information';

  @override
  String get serialNumberLengthMax => 'Ensure this field has no more than 14 characters.';

  @override
  String get serialNumberLengthMin => 'Ensure this field has at least 13 characters.';

  @override
  String get required => 'This field is required.';

  @override
  String get pinTooShort => 'PIN must be at least 4 digits long';

  @override
  String get manufacturer => 'Manufacturer:';

  @override
  String get model => 'Model:';

  @override
  String get voidConfirm => 'You are about to Void this transaction';

  @override
  String batteryLow(Object percentage) {
    return 'Battery is too low to transact safely. Please charge your device. $percentage%';
  }

  @override
  String get printerError => 'Printer error occurred, please check paper and try again.';
}
