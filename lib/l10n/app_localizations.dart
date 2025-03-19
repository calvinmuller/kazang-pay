import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'ZA'),
    Locale('af'),
    Locale('en')
  ];

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'Kazang Pay'**
  String get app;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistory;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Good Day'**
  String get welcome;

  /// No description provided for @companyWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {name}'**
  String companyWelcome(Object name);

  /// No description provided for @newSale.
  ///
  /// In en, this message translates to:
  /// **'New Sale'**
  String get newSale;

  /// No description provided for @purchaseAmount.
  ///
  /// In en, this message translates to:
  /// **'Purchase Amount'**
  String get purchaseAmount;

  /// No description provided for @cashbackAmount.
  ///
  /// In en, this message translates to:
  /// **'Cashback Amount'**
  String get cashbackAmount;

  /// No description provided for @addCashback.
  ///
  /// In en, this message translates to:
  /// **'Add Cashback'**
  String get addCashback;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @insertOrTap.
  ///
  /// In en, this message translates to:
  /// **'Insert Or Tap Card'**
  String get insertOrTap;

  /// No description provided for @amountDue.
  ///
  /// In en, this message translates to:
  /// **'Amount Due'**
  String get amountDue;

  /// No description provided for @returnTo.
  ///
  /// In en, this message translates to:
  /// **'Return To Transaction'**
  String get returnTo;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel Transaction'**
  String get cancel;

  /// No description provided for @cancelTitle.
  ///
  /// In en, this message translates to:
  /// **'You are about to cancel this transaction'**
  String get cancelTitle;

  /// No description provided for @cancelMessage.
  ///
  /// In en, this message translates to:
  /// **'Your current transaction will be cancelled'**
  String get cancelMessage;

  /// No description provided for @checkBalance.
  ///
  /// In en, this message translates to:
  /// **'Check Balance'**
  String get checkBalance;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter Pin To Access Transaction History & Settlements'**
  String get enterPin;

  /// No description provided for @supervisorPin.
  ///
  /// In en, this message translates to:
  /// **'Please provide your supervisor pin'**
  String get supervisorPin;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @transactionHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction History & Settlements'**
  String get transactionHistoryTitle;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred, please try again.'**
  String get unexpectedError;

  /// No description provided for @removeCard.
  ///
  /// In en, this message translates to:
  /// **'Remove Card'**
  String get removeCard;

  /// No description provided for @merchantReceipt.
  ///
  /// In en, this message translates to:
  /// **'Merchant Receipt'**
  String get merchantReceipt;

  /// No description provided for @customerReceipt.
  ///
  /// In en, this message translates to:
  /// **'Customer Receipt'**
  String get customerReceipt;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @merchantId.
  ///
  /// In en, this message translates to:
  /// **'Merchant ID'**
  String get merchantId;

  /// No description provided for @merchantName.
  ///
  /// In en, this message translates to:
  /// **'Merchant Name'**
  String get merchantName;

  /// No description provided for @terminalId.
  ///
  /// In en, this message translates to:
  /// **'TERMINAL ID'**
  String get terminalId;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'DATE'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'TIME'**
  String get time;

  /// No description provided for @aid.
  ///
  /// In en, this message translates to:
  /// **'AID'**
  String get aid;

  /// No description provided for @pan.
  ///
  /// In en, this message translates to:
  /// **'PAN'**
  String get pan;

  /// No description provided for @rrn.
  ///
  /// In en, this message translates to:
  /// **'RRN'**
  String get rrn;

  /// No description provided for @appType.
  ///
  /// In en, this message translates to:
  /// **'APP'**
  String get appType;

  /// No description provided for @switchType.
  ///
  /// In en, this message translates to:
  /// **'SWITCH'**
  String get switchType;

  /// No description provided for @purchase.
  ///
  /// In en, this message translates to:
  /// **'PURCHASE'**
  String get purchase;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'TOTAL:'**
  String get total;

  /// No description provided for @transseqNo.
  ///
  /// In en, this message translates to:
  /// **'TRANSSEQNO'**
  String get transseqNo;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'REASON'**
  String get reason;

  /// No description provided for @selectAccount.
  ///
  /// In en, this message translates to:
  /// **'Select an account to continue'**
  String get selectAccount;

  /// No description provided for @budgetTerm.
  ///
  /// In en, this message translates to:
  /// **'Select a budget term to continue'**
  String get budgetTerm;

  /// No description provided for @accountBalance.
  ///
  /// In en, this message translates to:
  /// **'Account Balance'**
  String get accountBalance;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account Name: {name}'**
  String accountName(Object name);

  /// No description provided for @checkAnother.
  ///
  /// In en, this message translates to:
  /// **'Check Another Account'**
  String get checkAnother;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @dateFilter.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateFilter;

  /// No description provided for @saleTransaction.
  ///
  /// In en, this message translates to:
  /// **'Sale Transaction'**
  String get saleTransaction;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @declined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get declined;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @refunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get refunded;

  /// No description provided for @settlementStatus.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get settlementStatus;

  /// No description provided for @settled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get settled;

  /// No description provided for @onboardingWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Kazang Pay!'**
  String get onboardingWelcome;

  /// No description provided for @onboardingRegister.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, you are at the final step of setting up your Kazang Pay Card Reader.'**
  String get onboardingRegister;

  /// No description provided for @onboardRegisterHelp.
  ///
  /// In en, this message translates to:
  /// **'Please allow the Kazang Sales Agent to assist you with the final step.'**
  String get onboardRegisterHelp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Please provide your login credentials to continue:'**
  String get signIn;

  /// No description provided for @standalone.
  ///
  /// In en, this message translates to:
  /// **'Stand-Alone mode detected. '**
  String get standalone;

  /// No description provided for @onboard1.
  ///
  /// In en, this message translates to:
  /// **'You can now accept card payments for any sales on your Kazang device using your very own Kazang Pay device.'**
  String get onboard1;

  /// No description provided for @onboard2.
  ///
  /// In en, this message translates to:
  /// **'You can now top up your Kazang Wallet using your Kazang Pay device, no more trips to the banks and less risk for your business.'**
  String get onboard2;

  /// No description provided for @onboard3.
  ///
  /// In en, this message translates to:
  /// **'Your card payments will be transferred directly into your Kazang Wallet.'**
  String get onboard3;

  /// No description provided for @registerDevice.
  ///
  /// In en, this message translates to:
  /// **'Register Device'**
  String get registerDevice;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter account number:'**
  String get accountNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Enter Password:'**
  String get password;

  /// No description provided for @enterSerialNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Device Serial Number:'**
  String get enterSerialNumber;

  /// No description provided for @usernameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a username.'**
  String get usernameError;

  /// No description provided for @passwordError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password.'**
  String get passwordError;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading please wait'**
  String get loading;

  /// No description provided for @initialized.
  ///
  /// In en, this message translates to:
  /// **'Initialized'**
  String get initialized;

  /// No description provided for @enterPinAccessSettings.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN To Access Settings'**
  String get enterPinAccessSettings;

  /// No description provided for @pleaseProvideSupervisorPin.
  ///
  /// In en, this message translates to:
  /// **'Please provide your supervisor pin'**
  String get pleaseProvideSupervisorPin;

  /// No description provided for @noPinSet.
  ///
  /// In en, this message translates to:
  /// **'No PIN has been set'**
  String get noPinSet;

  /// No description provided for @setPinToProceed.
  ///
  /// In en, this message translates to:
  /// **'Please set a pin to proceed'**
  String get setPinToProceed;

  /// No description provided for @pinLengthError.
  ///
  /// In en, this message translates to:
  /// **'PIN must be 4 digits long'**
  String get pinLengthError;

  /// No description provided for @incorrectPin.
  ///
  /// In en, this message translates to:
  /// **'Invalid PIN'**
  String get incorrectPin;

  /// No description provided for @voidTransaction.
  ///
  /// In en, this message translates to:
  /// **'Void Transaction'**
  String get voidTransaction;

  /// No description provided for @settlements.
  ///
  /// In en, this message translates to:
  /// **'Settlements'**
  String get settlements;

  /// No description provided for @totalSettlementAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Settlement Amount'**
  String get totalSettlementAmount;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get viewMore;

  /// No description provided for @noOfTransaction.
  ///
  /// In en, this message translates to:
  /// **'Number of Transactions'**
  String get noOfTransaction;

  /// No description provided for @noOfSettlements.
  ///
  /// In en, this message translates to:
  /// **'Number of Settlements'**
  String get noOfSettlements;

  /// No description provided for @settlementSummaryFor.
  ///
  /// In en, this message translates to:
  /// **'Settlement Summary for {date}'**
  String settlementSummaryFor(Object date);

  /// No description provided for @totalPurchaseFees.
  ///
  /// In en, this message translates to:
  /// **'Total Purchase Fees:'**
  String get totalPurchaseFees;

  /// No description provided for @totalPurchaseAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Purchase Amount:'**
  String get totalPurchaseAmount;

  /// No description provided for @totalCashbackAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Cashback Amount:'**
  String get totalCashbackAmount;

  /// No description provided for @totalAmountProcessed.
  ///
  /// In en, this message translates to:
  /// **'Total Amount Processed:'**
  String get totalAmountProcessed;

  /// No description provided for @totalCashbackFees.
  ///
  /// In en, this message translates to:
  /// **'Total Cashback Fees:'**
  String get totalCashbackFees;

  /// No description provided for @totalFees.
  ///
  /// In en, this message translates to:
  /// **'Total Fees:'**
  String get totalFees;

  /// No description provided for @settlementHistoryFor.
  ///
  /// In en, this message translates to:
  /// **'Settlement History for {date}'**
  String settlementHistoryFor(Object date);

  /// No description provided for @totalSettlementAmountCalc.
  ///
  /// In en, this message translates to:
  /// **'* Total Settlement Amount = Total Amount Processed - Total Settlements completed - Fees'**
  String get totalSettlementAmountCalc;

  /// No description provided for @proxySettings.
  ///
  /// In en, this message translates to:
  /// **'Proxy Settings'**
  String get proxySettings;

  /// No description provided for @sendDeviceLogs.
  ///
  /// In en, this message translates to:
  /// **'Send Device Logs'**
  String get sendDeviceLogs;

  /// No description provided for @connectPos.
  ///
  /// In en, this message translates to:
  /// **'Connect POS'**
  String get connectPos;

  /// No description provided for @supervisorPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Supervisor PIN'**
  String get supervisorPinTitle;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @settlementDetails.
  ///
  /// In en, this message translates to:
  /// **'Settlement Details'**
  String get settlementDetails;

  /// No description provided for @timeColumn.
  ///
  /// In en, this message translates to:
  /// **'Time:'**
  String get timeColumn;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount:'**
  String get amount;

  /// No description provided for @printReceipt.
  ///
  /// In en, this message translates to:
  /// **'Print Receipt'**
  String get printReceipt;

  /// No description provided for @printing.
  ///
  /// In en, this message translates to:
  /// **'Printing'**
  String get printing;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username:'**
  String get username;

  /// No description provided for @deviceSerial.
  ///
  /// In en, this message translates to:
  /// **'Device Serial:'**
  String get deviceSerial;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version:'**
  String get version;

  /// No description provided for @terminalIdTitle.
  ///
  /// In en, this message translates to:
  /// **'Terminal ID:'**
  String get terminalIdTitle;

  /// No description provided for @loadingSettlements.
  ///
  /// In en, this message translates to:
  /// **'Loading Settlements'**
  String get loadingSettlements;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @serialNumberLengthMax.
  ///
  /// In en, this message translates to:
  /// **'Ensure this field has no more than 14 characters.'**
  String get serialNumberLengthMax;

  /// No description provided for @serialNumberLengthMin.
  ///
  /// In en, this message translates to:
  /// **'Ensure this field has at least 13 characters.'**
  String get serialNumberLengthMin;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get required;

  /// No description provided for @pinTooShort.
  ///
  /// In en, this message translates to:
  /// **'PIN must be at least 4 digits long'**
  String get pinTooShort;

  /// No description provided for @manufacturer.
  ///
  /// In en, this message translates to:
  /// **'Manufacturer:'**
  String get manufacturer;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model:'**
  String get model;

  /// No description provided for @voidConfirm.
  ///
  /// In en, this message translates to:
  /// **'You are about to Void this transaction'**
  String get voidConfirm;

  /// No description provided for @batteryLow.
  ///
  /// In en, this message translates to:
  /// **'Battery is too low to transact safely. Please charge your device. {percentage}%'**
  String batteryLow(Object percentage);

  /// No description provided for @printerError.
  ///
  /// In en, this message translates to:
  /// **'Printer error occurred, please check paper and try again.'**
  String get printerError;

  /// No description provided for @usernameMin.
  ///
  /// In en, this message translates to:
  /// **'Ensure this field has at least 10 characters.'**
  String get usernameMin;

  /// No description provided for @usernameMax.
  ///
  /// In en, this message translates to:
  /// **'Ensure this field has no more than 10 characters.'**
  String get usernameMax;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error occurred, please try again.'**
  String get connectionError;

  /// No description provided for @transType.
  ///
  /// In en, this message translates to:
  /// **'TRANTYPE:'**
  String get transType;

  /// No description provided for @noTransactionsFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get noTransactionsFound;

  /// No description provided for @noSettlementsFound.
  ///
  /// In en, this message translates to:
  /// **'No settlements found'**
  String get noSettlementsFound;

  /// No description provided for @resetPin.
  ///
  /// In en, this message translates to:
  /// **'Reset PIN'**
  String get resetPin;

  /// No description provided for @pinResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Supervisor PIN reset successfully'**
  String get pinResetSuccess;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['af', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en': {
  switch (locale.countryCode) {
    case 'ZA': return AppLocalizationsEnZa();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af': return AppLocalizationsAf();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
