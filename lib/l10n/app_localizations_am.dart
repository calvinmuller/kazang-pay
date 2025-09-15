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
  String get welcome => 'መልካም ቀን';

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
  String get addCashback => 'ጥሬ ገንዘብ መልሶ ይጨምሩ';

  @override
  String get pay => 'ክፍያ ይፈጽሙ';

  @override
  String get insertOrTap => 'ካርዱን ያስገቡ ወይም ይንኩ';

  @override
  String get amountDue => 'የሚገባው መጠን';

  @override
  String get returnTo => 'ወደ ግብይት ተመለስ';

  @override
  String get cancel => 'ንግድ ይሰረዝ';

  @override
  String get cancelTitle => 'የእርስዎ ይህን ልውውጥ ሊሰርዝ ነው';

  @override
  String get cancelMessage => 'የእርስዎ የአሁኑ ልውውጥ ይሰረዛል';

  @override
  String get checkBalance => 'ቀሪ ገንዘብን ፍትሹ';

  @override
  String get enterPin => 'የግብይት ታሪክና ክፍያዎችን ለማግኘት ፒን ኮድዎን ያስገቡ።';

  @override
  String get supervisorPin => 'እባኮትን የአስተዳደር ፒን ያስገቡ';

  @override
  String get continueButton => 'ቀጥል';

  @override
  String get back => 'ወደ ኋላ';

  @override
  String get transactionHistoryTitle => 'የንግድ ታሪክ እና ሰፈሮች';

  @override
  String get ok => 'እሺ';

  @override
  String get error => 'ስህተት';

  @override
  String get unexpectedError => 'ያልተጠበቀ ስህተት ተፈጥሯል፣ እባኮትን እንደገና ይሞክሩ።';

  @override
  String get removeCard => 'ካርዱን ከውስጥ ያውጡ።';

  @override
  String get merchantReceipt => 'የነጋዴ ደረሰኝ';

  @override
  String get customerReceipt => 'የደንበኛ ደረሰኝ';

  @override
  String get view => 'ይመልከቱ';

  @override
  String get print => 'አትም ያድርጉ';

  @override
  String get merchantId => 'የነጋዴ መታወቂያ';

  @override
  String get merchantName => 'የነጋዴ ስም';

  @override
  String get terminalId => 'ተርሚናል መታወቂያ';

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
  String get appType => 'የአፕሊኬሽን ዓይነት';

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
  String get checkAnother => 'ሌላ አካውንት ይመልከቱ';

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
  String get settlementStatus => 'የክፍያ ሁኔታ';

  @override
  String get settled => 'ተከፍሏል';

  @override
  String get onboardingWelcome => 'እንኳን ወደ ካዛንግ ፔይ በደህና መጡ!';

  @override
  String get onboardingRegister =>
      'እንኳን ደስ አላችሁ፣ የካዛንግ ፔይ ካርድ አንቀሳቃሽዎን ለማቀናበር የመጨረሻውን ደረጃ ደርሳችኋል።';

  @override
  String get onboardRegisterHelp =>
      'እባኮትን የካዛንግ ሽያጭ ወኪሉ በመጨረሻው ደረጃ እንዲረዳዎት ይፍቀዱ።';

  @override
  String get signIn => 'እባኮትን ለመቀጠል የመግቢያ መረጃዎን ያስገቡ:';

  @override
  String get standalone => 'ብቻ ሞድ ተገኝቷል';

  @override
  String get onboard1 =>
      'አሁን በሚወዷት ካዛንግ ፔይ መሳሪያ በመጠቀም በካዛንግ መሳሪያዎ ላይ ላሉ ማንኛውም ሽያጭ የካርድ ክፍያ መቀበል ይችላሉ።';

  @override
  String get onboard2 =>
      'አሁን ከካዛንግ ፔይ መሳሪያዎ በመጠቀም ወደ ካዛንግ ዋሌትዎን መሙላት ይችላሉ። ባንክ መሄድ አያስፈልግም፤ ለንግድዎም አደጋ ዝቅ ያለ ይሆናል።';

  @override
  String get onboard3 => 'የካርድ ክፍያዎችዎ በቀጥታ ወደ ካዛንግ ዋሌትዎ ይተላለፋሉ።';

  @override
  String get registerDevice => 'መሳሪያን ይመዝግቡ';

  @override
  String get accountNumber => 'የሂሳብ ቁጥር ያስገቡ:';

  @override
  String get password => 'የይለፍ ቃል ያስገቡ';

  @override
  String get enterSerialNumber => 'የመሳሪያ ስሪት ቁጥር ያስገቡ:';

  @override
  String get usernameError => 'እባኮትን የተጠቃሚ ስም ያስገቡ።';

  @override
  String get passwordError => 'እባኮትን የይለፍ ቃል ያስገቡ።';

  @override
  String get submit => 'ላክ';

  @override
  String get loading => 'በመጫን ላይ';

  @override
  String get initialized => 'ተጀምሯል';

  @override
  String get enterPinAccessSettings => 'ቅንብሮችን ለማግኘት ፒን ያስገቡ';

  @override
  String get pleaseProvideSupervisorPin => 'እባኮትን የአስተዳደር ፒንዎን ያስገቡ';

  @override
  String get noPinSet => 'ምንም ፒን አልተቀመጠም';

  @override
  String get setPinToProceed => 'ለመቀጠል እባክዎ ፒን ኮድ ያዘጋጁ።';

  @override
  String get pinLengthError => 'ፒን 4 ቁጥር መሆን አለበት';

  @override
  String get incorrectPin => 'የተሳሳተ ፒን';

  @override
  String get voidTransaction => 'ግብይት ሰርዝ';

  @override
  String get settlements => 'ክፍያ';

  @override
  String get totalSettlementAmount => 'አጠቃላይ ክፍያ መጠን';

  @override
  String get viewMore => 'ተጨማሪ ይመልከቱ';

  @override
  String get noOfTransaction => 'የግብይት ቁጥር';

  @override
  String get noOfSettlements => 'ክፍያ ቁጥር';

  @override
  String settlementSummaryFor(Object date) {
    return 'ለ $date የክፍያ ማጠቃለያ';
  }

  @override
  String get totalPurchaseFees => 'አጠቃላይ ግዢ ክፍያዎች:';

  @override
  String get totalPurchaseAmount => 'አጠቃላይ ግዢ መጠን:';

  @override
  String get totalCashbackAmount => 'አጠቃላይ ካሽባክ መጠን:';

  @override
  String get totalAmountProcessed => 'የተሰራ አጠቃላይ መጠን:';

  @override
  String get totalCashbackFees => 'አጠቃላይ ካሽባክ ክፍያዎች:';

  @override
  String get totalFees => 'አጠቃላይ ክፍያዎች:';

  @override
  String settlementHistoryFor(Object date) {
    return 'ለ $date የክፍያ ዝርዝሮች';
  }

  @override
  String get totalSettlementAmountCalc =>
      '* አጠቃላይ ክፍያ መጠን = አጠቃላይ የተሰራ መጠን - አጠቃላይ የተጠናቀቁ ክፍያ - ክፍያዎች';

  @override
  String get proxySettings => 'የፕሮክሲ ቅንብሮች';

  @override
  String get sendDeviceLogs => 'የመሳሪያ ሎጎችን ላክ';

  @override
  String get connectPos => 'ፒኦኤስ ያገናኙ';

  @override
  String get supervisorPinTitle => 'የአስተዳደር ፒን';

  @override
  String get profile => 'መገለጫ';

  @override
  String get language => 'ቋንቋ';

  @override
  String get settlementDetails => 'የክፍያ ዝርዝሮች';

  @override
  String get timeColumn => 'የጊዜ አምድ';

  @override
  String get amount => 'መጠን:';

  @override
  String get printReceipt => 'ደረሰኝ ማተም';

  @override
  String get printing => 'በማተም ላይ';

  @override
  String get username => 'የተጠቃሚ ስም:';

  @override
  String get deviceSerial => 'የመሳሪያ ስሪት:';

  @override
  String get version => 'ስሪት:';

  @override
  String get terminalIdTitle => 'የቴርሚናል መለያ';

  @override
  String get loadingSettlements => 'ክፍያ በመጫን ላይ ነው';

  @override
  String get profileInformation => 'የመገለጫ መረጃ';

  @override
  String get serialNumberLengthMax => 'እንደገና ያረጋግጡ ይህ መስክ ከ14 ፊደላት በላይ አይኖርም።';

  @override
  String get serialNumberLengthMin => 'እንደገና ያረጋግጡ ይህ መስክ ከ13 ፊደላት በላይ አይኖርም።';

  @override
  String get required => 'ይህ መስክ ያስፈልጋል።';

  @override
  String get pinTooShort => 'ፒን ቢያንስ 4 ቁጥር መሆን አለበት';

  @override
  String get manufacturer => 'አምራች:';

  @override
  String get model => 'ሞዴል:';

  @override
  String get voidConfirm => 'ይህንን ግብይት ለመሰረዝ ነዎት';

  @override
  String batteryLow(Object percentage) {
    return 'ባትሪው ለደህንነት ግብይት በጣም ዝቅተኛ ነው። እባኮትን መሳሪያዎን ይሙሉ። $percentage%';
  }

  @override
  String get printerError => 'የማተሚያ ስህተት ተፈጥሯል፣ እባኮትን ወረቀት ይፈትሹ እና እንደገና ይሞክሩ።';

  @override
  String get usernameMin => 'እባኮትን ይህ መስክ ቢያንስ 10 ቁምፊዎች (ፊደላት) እንዲኖረው ያረጋግጡ።';

  @override
  String get usernameMax => 'እባኮትን ይህ መስክ ከ10 ቁምፊዎች (ፊደላት) በላይ እንዳይሆን ያረጋግጡ።';

  @override
  String get connectionError => 'የግንኙነት ስህተት ተፈጥሯል፣ እባኮትን እንደገና ይሞክሩ።';

  @override
  String get transType => 'TRANTYPE:';

  @override
  String get noTransactionsFound => 'ምንም ግብይት አልተገኘም';

  @override
  String get noSettlementsFound => 'ምንም ክፍያ አልተገኘም';

  @override
  String get resetPin => 'ፒን ኮድ ዳግም ያስተካክሉ';

  @override
  String get pinResetSuccess => 'የአስተዳደር ፒን በተሳካ ሁኔታ ዳግም ተቀምጧል';

  @override
  String get retry => 'እንደገና ይሞክሩ';

  @override
  String get switchTitle => 'ርዕስ ቀይር';

  @override
  String get transactionCompleted => 'ግብይቱ ተጠናቋል';

  @override
  String get transactionCompletedPrompt => 'ግብይቱ ተጠናቋል፣ የግብይት መረጃዎን ይመልከቱ።';

  @override
  String get yes => 'አዎ';

  @override
  String get no => 'አይደለም';

  @override
  String get updateKeys => 'ቁልፎችን ማሻሻል';

  @override
  String get osUpdateRequired => 'ኦኤስ ማሻሻያ ያስፈልጋል';

  @override
  String get transactionDetails => 'የግብይት ዝርዝሮች';

  @override
  String get cashback => 'የገንዘብ መልሶ ክፈላ';

  @override
  String get saleAmount => 'የሽያጭ መጠን:';

  @override
  String get totalAmount => 'ድምር:';

  @override
  String get selectSettingToConfig => 'ለማዋቀር ከግራ ወደ ቀኝ ክፍያን ይምረጡ';

  @override
  String get manageReceipts => 'ደረሰኞችን ያስተዳድሩ';

  @override
  String get selectToView => 'ለማየት ይምረጡ';
}
