// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get app => 'ካዛንግ ፔይ';

  @override
  String get settings => 'ቅንብሮች';

  @override
  String get transactionHistory => 'የግብይት ታሪክ';

  @override
  String get welcome => 'እንደምን አሰናዳችሁ';

  @override
  String companyWelcome(Object name) {
    return 'እንኳን ወደ $name በደህና መጡ';
  }

  @override
  String get newSale => 'አዲስ ሽያጭ';

  @override
  String get purchaseAmount => 'የግዢ መጠን';

  @override
  String get cashbackAmount => 'የካሽባክ መጠን';

  @override
  String get addCashback => 'ካሽባክ ያክሉ';

  @override
  String get pay => 'ክፍያ ይፈጽሙ';

  @override
  String get insertOrTap => 'ካርዱን ያስገቡ ወይም ይንኩ';

  @override
  String get amountDue => 'የሚከፈል መጠን';

  @override
  String get returnTo => 'ወደ ግብይት ተመለስ';

  @override
  String get cancel => 'ግብይቱን ሰርዝ';

  @override
  String get cancelTitle => 'ይህን ግብይት ለመሰረዝ ነዎት';

  @override
  String get cancelMessage => 'አሁን የሚደረገው ግብይት ይተወዋል';

  @override
  String get checkBalance => 'ሂሳብ ይመልከቱ';

  @override
  String get enterPin => 'የግብይት ታሪክ እና ስተልመንት ለማየት ፒን ያስገቡ';

  @override
  String get supervisorPin => 'እባኮትን የአስተዳደር ፒን ያስገቡ';

  @override
  String get continueButton => 'ቀጥል';

  @override
  String get back => 'ተመለስ';

  @override
  String get transactionHistoryTitle => 'የግብይት ታሪክ እና ስተልመንት';

  @override
  String get ok => 'እሺ';

  @override
  String get error => 'ስህተት';

  @override
  String get unexpectedError => 'ያልተጠበቀ ስህተት ተፈጥሯል፣ እባኮትን እንደገና ይሞክሩ።';

  @override
  String get removeCard => 'ካርዱን ያስወግዱ';

  @override
  String get merchantReceipt => 'የነጋዴ ደረሰኝ';

  @override
  String get customerReceipt => 'የደንበኛ ደረሰኝ';

  @override
  String get view => 'ይመልከቱ';

  @override
  String get print => 'ማተም';

  @override
  String get merchantId => 'የነጋዴ መታወቂያ';

  @override
  String get merchantName => 'የነጋዴ ስም';

  @override
  String get terminalId => 'የመሳሪያ መታወቂያ';

  @override
  String get date => 'ቀን';

  @override
  String get time => 'ሰዓት';

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
  String get purchase => 'ግዢ';

  @override
  String get total => 'ድምር:';

  @override
  String get transseqNo => 'TRANSSEQNO';

  @override
  String get reason => 'ምክንያት';

  @override
  String get selectAccount => 'ሂሳብ ይምረጡ';

  @override
  String get budgetTerm => 'የትእዛዝ ጊዜ ይምረጡ';

  @override
  String get accountBalance => 'የሂሳብ ቀሪ';

  @override
  String accountName(Object name) {
    return 'የሂሳብ ስም: $name';
  }

  @override
  String get checkAnother => 'ሌላ ሂሳብ ይፈትሹ';

  @override
  String get done => 'ተጠናቋል';

  @override
  String get sortBy => 'ቅደም ተከተል';

  @override
  String get dateFilter => 'ቀን';

  @override
  String get saleTransaction => 'የሽያጭ ግብይት';

  @override
  String get approved => 'ተፈቅዷል';

  @override
  String get declined => 'ተቀባይነት አላገኘም';

  @override
  String get pending => 'በመጠባበቅ ላይ';

  @override
  String get cancelled => 'ተሰርዟል';

  @override
  String get refunded => 'ተመላሽ';

  @override
  String get settlementStatus => 'ሁኔታ:';

  @override
  String get settled => 'ተከፍሏል';

  @override
  String get onboardingWelcome => 'እንኳን ወደ ካዛንግ ፔይ በደህና መጡ!';

  @override
  String get onboardingRegister => 'እንኳን ደስ አላችሁ፣ የካዛንግ ፔይ ካርድ አንቀሳቃሽዎን ለማቀናበር የመጨረሻውን ደረጃ ደርሳችኋል።';

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
  String get registerDevice => 'መሳሪያን ይመዝግቡ';

  @override
  String get accountNumber => 'Enter account number:';

  @override
  String get password => 'የይለፍ ቃል ያስገቡ';

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
  String get profile => 'መገለጫ';

  @override
  String get language => 'ቋንቋ';

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

  @override
  String get transType => 'TRANTYPE:';

  @override
  String get noTransactionsFound => 'No transactions found';

  @override
  String get noSettlementsFound => 'No settlements found';

  @override
  String get resetPin => 'ፒን ዳግም ይስቀሉ';

  @override
  String get pinResetSuccess => 'Supervisor PIN reset successfully';

  @override
  String get retry => 'እንደገና ይሞክሩ';

  @override
  String get switchTitle => 'ማስተላለፍ';

  @override
  String get updateKeys => 'Updating Keys...';
}
