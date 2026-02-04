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
/// import 'generated/app_localizations.dart';
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

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'hello'**
  String get hello;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @exploreApp.
  ///
  /// In en, this message translates to:
  /// **'Explore the App'**
  String get exploreApp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @askAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get askAccount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @massage.
  ///
  /// In en, this message translates to:
  /// **'By creating an account or signing you agree to our'**
  String get massage;

  /// No description provided for @massage1.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get massage1;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'forgot Password?'**
  String get forgotPassword;

  /// No description provided for @haveIt.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get haveIt;

  /// No description provided for @messege3.
  ///
  /// In en, this message translates to:
  /// **'Don’t worry! It happens. Please enter the email associated with your account.'**
  String get messege3;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get request;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get send;

  /// No description provided for @remember.
  ///
  /// In en, this message translates to:
  /// **'Remember password? '**
  String get remember;

  /// No description provided for @check.
  ///
  /// In en, this message translates to:
  /// **'Please check your email'**
  String get check;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'We’ve sent a code to'**
  String get sent;

  /// No description provided for @email1.
  ///
  /// In en, this message translates to:
  /// **'helloworld@gmail.com'**
  String get email1;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Send code again'**
  String get code;

  /// No description provided for @request2.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get request2;

  /// No description provided for @request3.
  ///
  /// In en, this message translates to:
  /// **'Please type something you’ll remember'**
  String get request3;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm;

  /// No description provided for @request4.
  ///
  /// In en, this message translates to:
  /// **'repeat password'**
  String get request4;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Password changed'**
  String get success;

  /// No description provided for @success1.
  ///
  /// In en, this message translates to:
  /// **'Your password has been changed succesfully'**
  String get success1;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get back;

  /// No description provided for @chooseNationality.
  ///
  /// In en, this message translates to:
  /// **'Select Your Nationality'**
  String get chooseNationality;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @enablePreciseLocation.
  ///
  /// In en, this message translates to:
  /// **'Enable precise location'**
  String get enablePreciseLocation;

  /// No description provided for @locationDescription.
  ///
  /// In en, this message translates to:
  /// **'Your location will be used to show people near you.'**
  String get locationDescription;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @securityNote.
  ///
  /// In en, this message translates to:
  /// **'🔒Magical secured text to make all security concerns go away.'**
  String get securityNote;

  /// No description provided for @chooseYourRole.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Role'**
  String get chooseYourRole;

  /// No description provided for @tourist.
  ///
  /// In en, this message translates to:
  /// **'Tourist'**
  String get tourist;

  /// No description provided for @tourGuide.
  ///
  /// In en, this message translates to:
  /// **'Tour Guide'**
  String get tourGuide;

  /// No description provided for @onboardingOne.
  ///
  /// In en, this message translates to:
  /// **'Your trip to Egypt is easier than you imagine'**
  String get onboardingOne;

  /// No description provided for @onboardingTwo.
  ///
  /// In en, this message translates to:
  /// **'We are here to help you book tours with locals on-the-go and experience a wonderful, unforgettable trip in Egypt.'**
  String get onboardingTwo;

  /// No description provided for @onboardingThree.
  ///
  /// In en, this message translates to:
  /// **'Easily organize your tours and reach thousands of tourists. Grow your business and increase your income with us.'**
  String get onboardingThree;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @exploreWorld.
  ///
  /// In en, this message translates to:
  /// **'Explore the world today'**
  String get exploreWorld;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @takeYourTravelToNextLevel.
  ///
  /// In en, this message translates to:
  /// **'take your travel to next level'**
  String get takeYourTravelToNextLevel;

  /// No description provided for @searchDestination.
  ///
  /// In en, this message translates to:
  /// **'Search destination'**
  String get searchDestination;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @mostFamousTrip.
  ///
  /// In en, this message translates to:
  /// **'The most famous trip'**
  String get mostFamousTrip;

  /// No description provided for @travelBeyondBoundary.
  ///
  /// In en, this message translates to:
  /// **'Travel beyond the boundary'**
  String get travelBeyondBoundary;

  /// No description provided for @popularCities.
  ///
  /// In en, this message translates to:
  /// **'Popular Cities'**
  String get popularCities;

  /// No description provided for @selectYourInterests.
  ///
  /// In en, this message translates to:
  /// **'Select your interests:'**
  String get selectYourInterests;

  /// No description provided for @historical.
  ///
  /// In en, this message translates to:
  /// **'Historical'**
  String get historical;

  /// No description provided for @adventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get adventure;

  /// No description provided for @museums.
  ///
  /// In en, this message translates to:
  /// **'Museums'**
  String get museums;

  /// No description provided for @islamic.
  ///
  /// In en, this message translates to:
  /// **'Islamic'**
  String get islamic;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @best.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get best;

  /// No description provided for @cheap.
  ///
  /// In en, this message translates to:
  /// **'Cheap'**
  String get cheap;

  /// No description provided for @reviewSummary.
  ///
  /// In en, this message translates to:
  /// **'Review summary'**
  String get reviewSummary;

  /// No description provided for @bookNow.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// No description provided for @tripDetails.
  ///
  /// In en, this message translates to:
  /// **'Trip Details'**
  String get tripDetails;

  /// No description provided for @forTrip.
  ///
  /// In en, this message translates to:
  /// **'For Trip'**
  String get forTrip;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;
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
