import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// home screen title
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// chat screen title
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// home screen title
  ///
  /// In en, this message translates to:
  /// **'Add Advertisement'**
  String get addAdvertisement;

  /// home screen title
  ///
  /// In en, this message translates to:
  /// **'My Advertisements'**
  String get myAdvertisements;

  /// home screen title
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// home screen title
  ///
  /// In en, this message translates to:
  /// **'Discover Offers'**
  String get discoverOffers;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Choose Your Packages'**
  String get chooseYourPackages;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Choose From Below Packages'**
  String get chooseFromBelowPackages;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'All Offers'**
  String get allOffers;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get freeDelivery;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'For any offer you order now!'**
  String get ifOrderNow;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Special Packages'**
  String get specialPackages;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get contactUs;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get sellingTeam;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Number of Views'**
  String get numberOfViews;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Filtering'**
  String get filtering;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Back to Default'**
  String get backToDefault;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'category'**
  String get category;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'location'**
  String get location;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Monthly Payments'**
  String get monthlyPayments;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'price'**
  String get price;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Minimum Price'**
  String get minimumPrice;

  /// all word
  ///
  /// In en, this message translates to:
  /// **'Maximum Price'**
  String get maximumPrice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
