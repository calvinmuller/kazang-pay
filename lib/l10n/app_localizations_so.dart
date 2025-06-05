// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Somali (`so`).
class AppLocalizationsSo extends AppLocalizations {
  AppLocalizationsSo([String locale = 'so']) : super(locale);

  @override
  String get app => 'Kazang Pay';

  @override
  String get settings => 'Dejinta';

  @override
  String get transactionHistory => 'Taariikhda Qaddarka';

  @override
  String get welcome => 'Maalin Wanaagsan';

  @override
  String companyWelcome(Object name) {
    return 'Ku soo dhawoow $name';
  }

  @override
  String get newSale => 'Iib cusub';

  @override
  String get purchaseAmount => 'Qaddarka Iibsiga';

  @override
  String get cashbackAmount => 'Qaddarka CashBack';

  @override
  String get addCashback => 'Ku dar Cashback';

  @override
  String get pay => 'Bixinta';

  @override
  String get insertOrTap => 'Geli ama Taabo Kaarka';

  @override
  String get amountDue => 'Qaddarka Lagaaga baahan yahay';

  @override
  String get returnTo => 'Ku laabo Qaddarka';

  @override
  String get cancel => 'Jooji Qaddarka';

  @override
  String get cancelTitle => 'Waad joojinaysaa Qaddarkan';

  @override
  String get cancelMessage => 'Qaddarka hadda jirta waa la joojin doonaa';

  @override
  String get checkBalance => 'Hubi Xisaabta';

  @override
  String get enterPin =>
      'Geli PIN si aad u aragto Taariikhda Qaddarka & Habaynta';

  @override
  String get supervisorPin => 'Fadlan geli PIN-kaaga ee Supervisor';

  @override
  String get continueButton => 'Sii wad';

  @override
  String get back => 'Dib ugu noqo';

  @override
  String get transactionHistoryTitle => 'Taariikhda Qaddarka & Habaynta';

  @override
  String get ok => 'Haa';

  @override
  String get error => 'Khalad';

  @override
  String get unexpectedError =>
      'Khalad lama filaan ah ayaa dhacay, fadlan isku day mar kale.';

  @override
  String get removeCard => 'Ka saar Kaarka';

  @override
  String get merchantReceipt => 'Rasiidhka Ganacsadaha';

  @override
  String get customerReceipt => 'Rasiidhka Macmiilka';

  @override
  String get view => 'Muuji';

  @override
  String get print => 'Daabac';

  @override
  String get merchantId => 'Aqoonsiga Ganacsadaha';

  @override
  String get merchantName => 'Magaca Ganacsadaha';

  @override
  String get terminalId => 'Aqoonsiga Terminalka';

  @override
  String get date => 'Taariikhda';

  @override
  String get time => 'Waqtiga';

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
  String get purchase => 'Iibsiga';

  @override
  String get total => 'Wadarta:';

  @override
  String get transseqNo => 'TRANSSEQNO';

  @override
  String get reason => 'Sababta';

  @override
  String get selectAccount => 'Xulo Xisaab si aad u sii wadato';

  @override
  String get budgetTerm => 'Xulo muddada miisaaniyadda si aad u sii wadato';

  @override
  String get accountBalance => 'Hantida Xisaabta';

  @override
  String accountName(Object name) {
    return 'Magaca Xisaabta: $name';
  }

  @override
  String get checkAnother => 'Hubi Xisaab kale';

  @override
  String get done => 'La dhammeeyey';

  @override
  String get sortBy => 'Kala soo bax';

  @override
  String get dateFilter => 'Taariikhda';

  @override
  String get saleTransaction => 'Qaddarka Iibka';

  @override
  String get approved => 'La oggolaaday';

  @override
  String get declined => 'La diiday';

  @override
  String get pending => 'Xaalad sugitaan';

  @override
  String get cancelled => 'La joojiyey';

  @override
  String get refunded => 'La soo celiyey';

  @override
  String get settlementStatus => 'Xaaladda:';

  @override
  String get settled => 'La dhammeeyey';

  @override
  String get onboardingWelcome => 'Ku soo dhawoow Kazang Pay!';

  @override
  String get onboardingRegister =>
      'Hambalyo, waxaad ku jirtaa tillaabada ugu dambeysa ee dejinta Akhbaarta Kazang Pay.';

  @override
  String get onboardRegisterHelp =>
      'Fadlan u oggolow Wakiilka Kazang inuu kaa caawiyo tillaabada ugu dambeysa.';

  @override
  String get signIn => 'Fadlan gali xogtaada si aad ugu sii socoto:';

  @override
  String get standalone => 'Qaabka kaliya ee loo aqoonsaday.';

  @override
  String get onboard1 =>
      'Hadda waxaad aqbali kartaa lacag bixinta kaarka ee iib kasta ee qalabkaaga Kazang adigoo isticmaalaya qalabkaaga Kazang Pay.';

  @override
  String get onboard2 =>
      'Hadda waxaad ku dari kartaa lacag Kazang Wallet-kaaga adigoo isticmaalaya qalabkaaga Kazang Pay, ma jirto baahi loo qabo in aad tagto bangiyada iyo khatar yar ee ganacsigaaga.';

  @override
  String get onboard3 =>
      'Lacagaha kaarkaaga waxaa si toos ah ugu wareejin doona Kazang Wallet-kaaga.';

  @override
  String get registerDevice => 'Diiwaangeli Qalabka';

  @override
  String get accountNumber => 'Gali lambarka xisaabta:';

  @override
  String get password => 'Gali ereyga sirta ah:';

  @override
  String get enterSerialNumber => 'Gali lambarka serialka qalabka:';

  @override
  String get usernameError => 'Fadlan gali magaca isticmaale.';

  @override
  String get passwordError => 'Fadlan gali ereyga sirta ah.';

  @override
  String get submit => 'Gudbi';

  @override
  String get loading => 'Loading fadlan sug';

  @override
  String get initialized => 'La abuuray';

  @override
  String get enterPinAccessSettings => 'Geli PIN si aad u gasho Dejinta';

  @override
  String get pleaseProvideSupervisorPin =>
      'Fadlan gali PIN-kaaga ee Supervisor';

  @override
  String get noPinSet => 'Ma jiraan PIN la dejiyay';

  @override
  String get setPinToProceed => 'Fadlan dejiso PIN si aad u sii wadato';

  @override
  String get pinLengthError => 'PIN waa inuu ahaadaa 4 nambar';

  @override
  String get incorrectPin => 'PIN khalad ah';

  @override
  String get voidTransaction => 'Jooji Qaddarka';

  @override
  String get settlements => 'Habaynta';

  @override
  String get totalSettlementAmount => 'Wadarta Qaddarka Habaynta';

  @override
  String get viewMore => 'Muuji Dheeraad ah';

  @override
  String get noOfTransaction => 'Tirada Qaddarka';

  @override
  String get noOfSettlements => 'Tirada Habaynta';

  @override
  String settlementSummaryFor(Object date) {
    return 'Dulmar Habaynta ee $date';
  }

  @override
  String get totalPurchaseFees => 'Wadarta Kharashka Iibsiga:';

  @override
  String get totalPurchaseAmount => 'Wadarta Qaddarka Iibsiga:';

  @override
  String get totalCashbackAmount => 'Wadarta Qaddarka CashBack:';

  @override
  String get totalAmountProcessed => 'Wadarta Qaddarka La Hagaajiyay:';

  @override
  String get totalCashbackFees => 'Wadarta Kharashka CashBack:';

  @override
  String get totalFees => 'Wadarta Kharashka:';

  @override
  String settlementHistoryFor(Object date) {
    return 'Taariikhda Habaynta ee $date';
  }

  @override
  String get totalSettlementAmountCalc =>
      '* Wadarta Qaddarka Habaynta = Wadarta Qaddarka La Hagaajiyay - Wadarta Habaynta la dhammeeyey - Kharashka';

  @override
  String get proxySettings => 'Dejinta Proxy';

  @override
  String get sendDeviceLogs => 'U dir Diiwaanka Qalabka';

  @override
  String get connectPos => 'Xidhiidh POS';

  @override
  String get supervisorPinTitle => 'PIN ee Supervisor';

  @override
  String get profile => 'Hawlaha';

  @override
  String get language => 'Luqad';

  @override
  String get settlementDetails => 'Faahfaahinta Habaynta';

  @override
  String get timeColumn => 'Waqti:';

  @override
  String get amount => 'Qaddar:';

  @override
  String get printReceipt => 'Daabac Rasiidh';

  @override
  String get printing => 'Daabacaya';

  @override
  String get username => 'Magaca Isticmaale:';

  @override
  String get deviceSerial => 'Serialka Qalabka:';

  @override
  String get version => 'Nooca:';

  @override
  String get terminalIdTitle => 'Aqoonsiga Terminalka:';

  @override
  String get loadingSettlements => 'Loading Habaynta';

  @override
  String get profileInformation => 'Macluumaadka Profile-ka';

  @override
  String get serialNumberLengthMax =>
      'Hubi in boggan aanu ka badnayn 14 characters.';

  @override
  String get serialNumberLengthMin =>
      'Hubi in boggan uu leeyahay ugu yaraan 13 characters.';

  @override
  String get required => 'Boggan waa lagama maarmaan.';

  @override
  String get pinTooShort => 'PIN waa inuu ahaadaa ugu yaraan 4 nambar';

  @override
  String get manufacturer => 'Soosaaraha:';

  @override
  String get model => 'Qaabka:';

  @override
  String get voidConfirm => 'Waad xaqiijinaysaa inaad joojiso qaddarkan';

  @override
  String batteryLow(Object percentage) {
    return 'Bateriga ayaa aad u hooseeya si ammaan ah loogu sameeyo macaamil. Fadlan ku shid qalabkaaga. $percentage%';
  }

  @override
  String get printerError =>
      'Khalad daabacaadda ayaa dhacay, fadlan hubi warqadda oo isku day mar kale.';

  @override
  String get usernameMin =>
      'Hubi in boggan uu leeyahay ugu yaraan 10 characters.';

  @override
  String get usernameMax => 'Hubi in boggan aanu ka badnayn 10 characters.';

  @override
  String get connectionError =>
      'Khalad xiriir ayaa dhacay, fadlan isku day mar kale.';

  @override
  String get transType => 'Nooca Qaddarka:';

  @override
  String get noTransactionsFound => 'Ma jiro qaddar la helay';

  @override
  String get noSettlementsFound => 'Ma jiro habayn la helay';

  @override
  String get resetPin => 'Reset PIN';

  @override
  String get pinResetSuccess =>
      'PIN-ka Supervisor si guul leh ayaa loo hagaajiyay';

  @override
  String get retry => 'Isku day mar kale';

  @override
  String get switchTitle => 'Beddel';

  @override
  String get updateKeys => 'Updating Keys...';

  @override
  String get osUpdateRequired => 'OS Update Required';
}
