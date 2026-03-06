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

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price per Trips'**
  String get price;

  /// No description provided for @catogry.
  ///
  /// In en, this message translates to:
  /// **'Catogry'**
  String get catogry;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pick up location'**
  String get pickup;

  /// No description provided for @pharaohs.
  ///
  /// In en, this message translates to:
  /// **'Pharaohs'**
  String get pharaohs;

  /// No description provided for @fatimidera.
  ///
  /// In en, this message translates to:
  /// **'Fatimid era'**
  String get fatimidera;

  /// No description provided for @romanera.
  ///
  /// In en, this message translates to:
  /// **'Roman era'**
  String get romanera;

  /// No description provided for @mosques.
  ///
  /// In en, this message translates to:
  /// **'mosques'**
  String get mosques;

  /// No description provided for @numberofperson.
  ///
  /// In en, this message translates to:
  /// **'Number of Person'**
  String get numberofperson;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @addtional.
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get addtional;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Pyramids of '**
  String get address;

  /// No description provided for @address1.
  ///
  /// In en, this message translates to:
  /// **'Giza in Cairo'**
  String get address1;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get duration;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'RATING'**
  String get rate;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @success2.
  ///
  /// In en, this message translates to:
  /// **'Success for booked '**
  String get success2;

  /// No description provided for @confirm1.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm1;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Book a Tour'**
  String get book;

  /// No description provided for @mars.
  ///
  /// In en, this message translates to:
  /// **'Mars, Solar System'**
  String get mars;

  /// No description provided for @experienced.
  ///
  /// In en, this message translates to:
  /// **'Experienced guide with a deep knowledge'**
  String get experienced;

  /// No description provided for @pharaonic.
  ///
  /// In en, this message translates to:
  /// **'of pharaonic history and archaeology,passionate'**
  String get pharaonic;

  /// No description provided for @guideProfile1.
  ///
  /// In en, this message translates to:
  /// **'Guide Profile'**
  String get guideProfile1;

  /// No description provided for @bookaTour.
  ///
  /// In en, this message translates to:
  /// **'Book a Tour'**
  String get bookaTour;

  /// No description provided for @guideProfile.
  ///
  /// In en, this message translates to:
  /// **'Guide Profile'**
  String get guideProfile;

  /// No description provided for @experienced1.
  ///
  /// In en, this message translates to:
  /// **'Experienced Egyptologist & Licensed Tour'**
  String get experienced1;

  /// No description provided for @guideCairo.
  ///
  /// In en, this message translates to:
  /// **'Guide, Cairo'**
  String get guideCairo;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @professionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Professional Details'**
  String get professionalDetails;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @certifications.
  ///
  /// In en, this message translates to:
  /// **'Certifications'**
  String get certifications;

  /// No description provided for @certifiedEgyptologist.
  ///
  /// In en, this message translates to:
  /// **'Certified Egyptologist'**
  String get certifiedEgyptologist;

  /// No description provided for @egyptian.
  ///
  /// In en, this message translates to:
  /// **'Egyptian Ministry of Tourism & Antiquities'**
  String get egyptian;

  /// No description provided for @valid.
  ///
  /// In en, this message translates to:
  /// **'Valid until: December 2025'**
  String get valid;

  /// No description provided for @touristBookings.
  ///
  /// In en, this message translates to:
  /// **'Tourist Bookings'**
  String get touristBookings;

  /// No description provided for @upcomingBookings.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Bookings'**
  String get upcomingBookings;

  /// No description provided for @exploreWorld.
  ///
  /// In en, this message translates to:
  /// **'Explore the world today'**
  String get exploreWorld;

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

  /// No description provided for @pastBookings.
  ///
  /// In en, this message translates to:
  /// **'Past Bookings'**
  String get pastBookings;

  /// No description provided for @todayBookings.
  ///
  /// In en, this message translates to:
  /// **'Today’s Bookings'**
  String get todayBookings;

  /// No description provided for @santoriniIslnd.
  ///
  /// In en, this message translates to:
  /// **'Santorini Islnd'**
  String get santoriniIslnd;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

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

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @addPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Add a payment method'**
  String get addPaymentMethod;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get pushNotifications;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @successMsg.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successMsg;

  /// No description provided for @yourAccountSaved.
  ///
  /// In en, this message translates to:
  /// **'Your account has been saved'**
  String get yourAccountSaved;

  /// No description provided for @confirmMsg.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmMsg;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cardHolderName.
  ///
  /// In en, this message translates to:
  /// **'Card holder name'**
  String get cardHolderName;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDate;

  /// No description provided for @cardHolder.
  ///
  /// In en, this message translates to:
  /// **'Card Holder'**
  String get cardHolder;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Expiration date'**
  String get expirationDate;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @afterFilter.
  ///
  /// In en, this message translates to:
  /// **'After Filter'**
  String get afterFilter;

  /// No description provided for @cancelTrip.
  ///
  /// In en, this message translates to:
  /// **'Cancel Trip'**
  String get cancelTrip;

  /// No description provided for @areYouSureToCancel.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the trip?'**
  String get areYouSureToCancel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @backMsg.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backMsg;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @areYouSureToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure that you want to logout?'**
  String get areYouSureToLogout;

  /// No description provided for @bookingRequest.
  ///
  /// In en, this message translates to:
  /// **'Booking Request'**
  String get bookingRequest;

  /// No description provided for @viewbooking.
  ///
  /// In en, this message translates to:
  /// **'View booking'**
  String get viewbooking;

  /// No description provided for @declineBooking.
  ///
  /// In en, this message translates to:
  /// **'Decline Booking'**
  String get declineBooking;

  /// No description provided for @yesCancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel Request'**
  String get yesCancelRequest;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @chatwithtoUurist.
  ///
  /// In en, this message translates to:
  /// **'CHAT WITH TOURIST'**
  String get chatwithtoUurist;

  /// No description provided for @travelerFeedback.
  ///
  /// In en, this message translates to:
  /// **'Traveler Feedback'**
  String get travelerFeedback;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Marhaban!'**
  String get welcome;

  /// No description provided for @mySchedule.
  ///
  /// In en, this message translates to:
  /// **'My Schedule'**
  String get mySchedule;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get live;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed '**
  String get completed;

  /// No description provided for @liveNow.
  ///
  /// In en, this message translates to:
  /// **'LIVE NOW'**
  String get liveNow;

  /// No description provided for @trackLiveLocation.
  ///
  /// In en, this message translates to:
  /// **'Track Live Location'**
  String get trackLiveLocation;

  /// No description provided for @endTour.
  ///
  /// In en, this message translates to:
  /// **'End Tour'**
  String get endTour;

  /// No description provided for @confirmEndTour.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to end this tour?'**
  String get confirmEndTour;

  /// No description provided for @upcomingTour.
  ///
  /// In en, this message translates to:
  /// **'UPCOMING TOUR'**
  String get upcomingTour;

  /// No description provided for @estimatedEarnings.
  ///
  /// In en, this message translates to:
  /// **'Estimated Earnings'**
  String get estimatedEarnings;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @meetingPoint.
  ///
  /// In en, this message translates to:
  /// **'Meeting Point'**
  String get meetingPoint;

  /// No description provided for @cancelMassage.
  ///
  /// In en, this message translates to:
  /// **'Your request is still pending approval.Are you sure you want to cancel this  booking request?'**
  String get cancelMassage;

  /// No description provided for @cancelBookingRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking Request?'**
  String get cancelBookingRequest;

  /// No description provided for @bookingAccepted.
  ///
  /// In en, this message translates to:
  /// **'Booking Accepted'**
  String get bookingAccepted;

  /// No description provided for @successMassage.
  ///
  /// In en, this message translates to:
  /// **'Your booking has been successfully accepted. You can now communicate with  the tourist and prepare for the tour.'**
  String get successMassage;

  /// No description provided for @weeklySchedule.
  ///
  /// In en, this message translates to:
  /// **'Weekly Schedule'**
  String get weeklySchedule;

  /// No description provided for @selectdays.
  ///
  /// In en, this message translates to:
  /// **'Select days'**
  String get selectdays;

  /// No description provided for @workhours.
  ///
  /// In en, this message translates to:
  /// **'Work hours for selected days'**
  String get workhours;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @newRequests.
  ///
  /// In en, this message translates to:
  /// **'New Requests (2)'**
  String get newRequests;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @professionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Professional Information'**
  String get professionalInformation;

  /// No description provided for @dateTIME.
  ///
  /// In en, this message translates to:
  /// **'DATE & TIME'**
  String get dateTIME;

  /// No description provided for @dURATION.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get dURATION;

  /// No description provided for @groupsize.
  ///
  /// In en, this message translates to:
  /// **'GROUP SIZE'**
  String get groupsize;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'EXPERIENCE'**
  String get experience;

  /// No description provided for @mettingpoint.
  ///
  /// In en, this message translates to:
  /// **'MEETING POINT'**
  String get mettingpoint;

  /// No description provided for @directions.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// No description provided for @paymentSummary.
  ///
  /// In en, this message translates to:
  /// **'Payment Summary'**
  String get paymentSummary;

  /// No description provided for @yourEarnings.
  ///
  /// In en, this message translates to:
  /// **'Your Earnings'**
  String get yourEarnings;

  /// No description provided for @analysis.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get analysis;

  /// No description provided for @totalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get totalEarnings;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'verified'**
  String get verified;

  /// No description provided for @onboarding.
  ///
  /// In en, this message translates to:
  /// **'Onboarding'**
  String get onboarding;

  /// No description provided for @guideSetupStep.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total} ({percentage}%)'**
  String guideSetupStep(Object current, Object percentage, Object total);

  /// No description provided for @profilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get profilePhoto;

  /// No description provided for @uploadProfessionalHeadshot.
  ///
  /// In en, this message translates to:
  /// **'Upload professional headshot'**
  String get uploadProfessionalHeadshot;

  /// No description provided for @identityVerification.
  ///
  /// In en, this message translates to:
  /// **'Identity Verification'**
  String get identityVerification;

  /// No description provided for @nationalId.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalId;

  /// No description provided for @nationalIdHint.
  ///
  /// In en, this message translates to:
  /// **'Front and back required (JPEG, PNG, PDF)'**
  String get nationalIdHint;

  /// No description provided for @tourGuideLicense.
  ///
  /// In en, this message translates to:
  /// **'Tour Guide License'**
  String get tourGuideLicense;

  /// No description provided for @tourGuideLicenseHint.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Tourism issued License'**
  String get tourGuideLicenseHint;

  /// No description provided for @professionalHistory.
  ///
  /// In en, this message translates to:
  /// **'Professional History'**
  String get professionalHistory;

  /// No description provided for @yearsOfExperience.
  ///
  /// In en, this message translates to:
  /// **'Years of Experience'**
  String get yearsOfExperience;

  /// No description provided for @yearsOfExperienceHint.
  ///
  /// In en, this message translates to:
  /// **'How many years have you been a guide'**
  String get yearsOfExperienceHint;

  /// No description provided for @verificationNote.
  ///
  /// In en, this message translates to:
  /// **'Your professional documents are used for verification purposes only and are stored securely. Verified guides get 40% more bookings.'**
  String get verificationNote;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @expertiseSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Expertise Setup'**
  String get expertiseSetupTitle;

  /// No description provided for @expertiseLanguagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Expertise & Languages'**
  String get expertiseLanguagesTitle;

  /// No description provided for @expertiseDescription.
  ///
  /// In en, this message translates to:
  /// **'Tell us about your skills to help us match you with the right travelers exploring Egypt.'**
  String get expertiseDescription;

  /// No description provided for @spokenLanguages.
  ///
  /// In en, this message translates to:
  /// **'Spoken Languages'**
  String get spokenLanguages;

  /// No description provided for @addLanguage.
  ///
  /// In en, this message translates to:
  /// **'Add Language'**
  String get addLanguage;

  /// No description provided for @areasOfExpertise.
  ///
  /// In en, this message translates to:
  /// **'Areas of Expertise'**
  String get areasOfExpertise;

  /// No description provided for @selectLanguages.
  ///
  /// In en, this message translates to:
  /// **'Select Languages'**
  String get selectLanguages;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepOf(Object current, Object total);

  /// No description provided for @percentComplete.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Complete'**
  String percentComplete(Object percent);

  /// No description provided for @availabilityPricingTitle.
  ///
  /// In en, this message translates to:
  /// **'Availability & Pricing'**
  String get availabilityPricingTitle;

  /// No description provided for @availabilityPricingDescription.
  ///
  /// In en, this message translates to:
  /// **'Tell us when you\'re free and your preferred hourly rates for guiding tours in Egypt.'**
  String get availabilityPricingDescription;

  /// No description provided for @hourlyRate.
  ///
  /// In en, this message translates to:
  /// **'Hourly Rate'**
  String get hourlyRate;

  /// No description provided for @usd.
  ///
  /// In en, this message translates to:
  /// **'USD'**
  String get usd;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @whereDoYouGuide.
  ///
  /// In en, this message translates to:
  /// **'Where do you guide?'**
  String get whereDoYouGuide;

  /// No description provided for @selectMoreCities.
  ///
  /// In en, this message translates to:
  /// **'Select more cities...'**
  String get selectMoreCities;

  /// No description provided for @selectDays.
  ///
  /// In en, this message translates to:
  /// **'Select days'**
  String get selectDays;

  /// No description provided for @workHoursForSelectedDays.
  ///
  /// In en, this message translates to:
  /// **'Work hours for selected days'**
  String get workHoursForSelectedDays;

  /// No description provided for @saveAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Save & Continue'**
  String get saveAndContinue;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select time'**
  String get selectTime;

  /// No description provided for @pleaseSelectWorkHours.
  ///
  /// In en, this message translates to:
  /// **'Please select start and end time'**
  String get pleaseSelectWorkHours;

  /// No description provided for @onboardingProgress.
  ///
  /// In en, this message translates to:
  /// **'Onboarding Progress'**
  String get onboardingProgress;

  /// No description provided for @verificationInProgress.
  ///
  /// In en, this message translates to:
  /// **'Verification in Progress'**
  String get verificationInProgress;

  /// No description provided for @verificationDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'re reviewing your documents to verify your guide account. This usually takes up to 48 hours.'**
  String get verificationDescription;

  /// No description provided for @touristGuideLicence.
  ///
  /// In en, this message translates to:
  /// **'Tourist Guide Licence'**
  String get touristGuideLicence;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @submitted.
  ///
  /// In en, this message translates to:
  /// **'SUBMITTED'**
  String get submitted;

  /// No description provided for @verificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verificationTitle;

  /// No description provided for @actionRequired.
  ///
  /// In en, this message translates to:
  /// **'Action Required'**
  String get actionRequired;

  /// No description provided for @verificationFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t verify your documents yet. Please review the notes below and resubmit.'**
  String get verificationFailedMessage;

  /// No description provided for @issuesFound.
  ///
  /// In en, this message translates to:
  /// **'ISSUES FOUND'**
  String get issuesFound;

  /// No description provided for @imageTooBlurry.
  ///
  /// In en, this message translates to:
  /// **'Image is too blurry'**
  String get imageTooBlurry;

  /// No description provided for @notesFromAdmin.
  ///
  /// In en, this message translates to:
  /// **'Notes from Admin'**
  String get notesFromAdmin;

  /// No description provided for @adminNoteMessage.
  ///
  /// In en, this message translates to:
  /// **'Please ensure all text is legible and the photo is taken in good lighting. Use a flat surface and avoid camera flash reflection.'**
  String get adminNoteMessage;

  /// No description provided for @viewDocumentGuidelines.
  ///
  /// In en, this message translates to:
  /// **'View document guidelines'**
  String get viewDocumentGuidelines;

  /// No description provided for @updateDocuments.
  ///
  /// In en, this message translates to:
  /// **'Update Documents'**
  String get updateDocuments;

  /// No description provided for @verifiedBadge.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED BADGE'**
  String get verifiedBadge;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @verificationSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your guide account has been successfully verified. You\'re now ready to accept bookings and start your journey with GUID ME.'**
  String get verificationSuccessMessage;

  /// No description provided for @accountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get accountStatus;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get statusLabel;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'Member Since'**
  String get memberSince;

  /// No description provided for @identity.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get identity;

  /// No description provided for @fullAccess.
  ///
  /// In en, this message translates to:
  /// **'Full Access'**
  String get fullAccess;

  /// No description provided for @theTourwaswith.
  ///
  /// In en, this message translates to:
  /// **'The Tour was with  '**
  String get theTourwaswith;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @chat_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search tourists or tours'**
  String get chat_search_hint;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @chat_type_message_hint.
  ///
  /// In en, this message translates to:
  /// **'Type your message'**
  String get chat_type_message_hint;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'ONLINE'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE'**
  String get offline;

  /// No description provided for @tripAddress.
  ///
  /// In en, this message translates to:
  /// **'Trip Address'**
  String get tripAddress;

  /// No description provided for @arrivalTime.
  ///
  /// In en, this message translates to:
  /// **'Arrival Time'**
  String get arrivalTime;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @professional_details.
  ///
  /// In en, this message translates to:
  /// **'Professional Details'**
  String get professional_details;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @licenseId.
  ///
  /// In en, this message translates to:
  /// **'LICENSE ID'**
  String get licenseId;

  /// No description provided for @addCertification.
  ///
  /// In en, this message translates to:
  /// **'Add Certification'**
  String get addCertification;

  /// No description provided for @certificationName.
  ///
  /// In en, this message translates to:
  /// **'Certification Name'**
  String get certificationName;

  /// No description provided for @certificationNameHint.
  ///
  /// In en, this message translates to:
  /// **'Ex: Google UX Design Certificate'**
  String get certificationNameHint;

  /// No description provided for @issuingOrganization.
  ///
  /// In en, this message translates to:
  /// **'Issuing Organization'**
  String get issuingOrganization;

  /// No description provided for @issuingOrganizationHint.
  ///
  /// In en, this message translates to:
  /// **'Ex: Coursera'**
  String get issuingOrganizationHint;

  /// No description provided for @issueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get issueDate;

  /// No description provided for @expirationDateOptional.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date (Optional)'**
  String get expirationDateOptional;

  /// No description provided for @dateFormatHint.
  ///
  /// In en, this message translates to:
  /// **'MM/YYYY'**
  String get dateFormatHint;

  /// No description provided for @noExpirationCertification.
  ///
  /// In en, this message translates to:
  /// **'This certification does not expire'**
  String get noExpirationCertification;

  /// No description provided for @saveCertification.
  ///
  /// In en, this message translates to:
  /// **'Save Certification'**
  String get saveCertification;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select a language'**
  String get selectLanguage;

  /// No description provided for @uploadCertificate.
  ///
  /// In en, this message translates to:
  /// **'Upload Certificate'**
  String get uploadCertificate;

  /// No description provided for @uploadPdfOrImage.
  ///
  /// In en, this message translates to:
  /// **'Upload PDF or Image'**
  String get uploadPdfOrImage;

  /// No description provided for @supportedFormats.
  ///
  /// In en, this message translates to:
  /// **'Supported formats: PDF, JPG, PNG'**
  String get supportedFormats;
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
