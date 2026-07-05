# GuideMe (Robert) — Full Project Documentation

## 1. Project Overview

| Field | Value |
|-------|-------|
| **Name** | GuideMe (branded as **Robert**) |
| **Package** | `guide_me` |
| **Version** | `1.0.1+4` |
| **Platforms** | Android, iOS, Web, Windows, macOS, Linux |
| **Description** | Smart tourism application connecting tourists with local tour guides in Egypt |
| **SDK** | Dart `^3.9.2` |

---

## 2. Architecture

### Pattern: Clean Architecture + Feature-first Modular Structure

```
lib/
├── core/               # Shared across all features
│   ├── di/             # Dependency injection
│   ├── network/        # HTTP client & interceptors
│   ├── socket/         # Real-time communication
│   ├── localization/   # i18n (English & Arabic)
│   ├── theme/          # App theme & colors
│   ├── errors/         # Error handling & failures
│   ├── routes/         # GoRouter configuration
│   ├── helpers/        # Connectivity helper
│   ├── services/       # Shared services (token, Hive, media picker)
│   ├── styles/         # Colors & text styles
│   ├── widgets/        # Shared UI components
│   ├── constants/      # API constants, countries, languages, cities
│   ├── responsive/     # Responsive scaling utilities
│   └── shared/         # Shared cubits, entities, models, repos, use cases
│
└── features/           # Feature modules (each with data/domain/presentation)
    ├── splash/
    ├── auth/
    ├── home/
    ├── booking/
    ├── chat/
    ├── profile/
    ├── dashboard/
    ├── guide_booking/
    ├── guide_profile/
    ├── guide_registration/
    └── core/location_core/
```

Each feature follows **Clean Architecture** with 3 layers:

```
feature/
├── data/              # Data sources, models, repository implementations
├── domain/            # Entities, repository interfaces, use cases
└── presentation/      # Screens, cubits, widgets, strategies
```

---

## 3. State Management

**flutter_bloc** (Cubit pattern) — ~45 cubits across the app.

| Feature | Cubits |
|---------|--------|
| **Shared** | `FavoritesCubit`, `LocaleCubit`, `UserCubit` |
| **Auth** | `LoginCubit`, `LoginwithGoogleCubit`, `RegisterCubit`, `SendForgetPasswordCubit`, `VerifyPasswordCubit`, `ResendForgetPasswordCubit`, `ResetPasswordCubit`, `SelectNationalityCubit`, `LocationAccessCubit` |
| **Home** | `GetHomeCubit`, `GetAiPackageCubit`, `PlaceByCategoryCubit`, `PlaceByCityCubit`, `InterestsCubit`, `TouristNavBarCubit` |
| **Booking** | `AddBookingCubit`, `BookAiPackageCubit`, `BookPackageCubit`, `CancelBookingCubit`, `FilterCubit`, `GuideDataCubit`, `ReservationCubit`, `ReviewCubit` |
| **Chat** | `ChatCubit`, `ConversationCubit` |
| **Dashboard** | `DashboardCubit`, `AnalysisCubit`, `ToggleOnlineStatusCubit`, `AcceptBookingCubit`, `AcceptPackageCubit`, `GuideNavigationBarCubit` |
| **Guide Booking** | `GuideBookingCubit`, `GuideBookingActionsCubit` |
| **Guide Profile** | `GuideProfileCubit`, `AddCertificationCubit` |
| **Guide Registration** | `GuideRegistrationSharedCubit`, `ProfessionalInfoCubit`, `SpokenLanguagesCubit`, `GetCategoriesCubit`, `GetCitiesCubit`, `SelectGuideCitiesCubit`, `WorkHoursCubit`, `VerificationStatusCubit` |
| **Profile** | `LogoutCubit`, `UpdateProfileCubit` |
| **Splash** | `SplashCubit` |
| **Location** | `PickLocationCubit` |

---

## 4. Dependency Injection

**get_it** + **injectable** (code-generated).

- `core/di/injectable.dart` — Global DI setup
- `core/di/user_scope.dart` — User-scoped registrations (socket, chat, dashboard)
- Annotation-based registration (`@singleton`, `@lazySingleton`, `@factoryParam`)
- Generated config: `injectable.config.dart`

---

## 5. Routing

**go_router** with 60+ named routes, auth redirect guard, and per-route BLoC providers.

- `core/routes/app_routes.dart` — Route name constants
- `core/routes/router.dart` — GoRouter config with auth redirect
- Public routes bypass auth (splash, onboarding, login)
- Data passed via `extra` parameter (typed objects like `PlaceEntity`, `ChatArgs`)

---

## 6. Networking

| Layer | Technology |
|-------|-----------|
| **HTTP Client** | Dio 5 |
| **Base URL** | `https://guideme-pjss.onrender.com/api` |
| **OTP URL** | `https://guide-me-back-end.vercel.app` |
| **Auth** | Bearer JWT via `AuthorizationInterceptor` |
| **Caching** | `dio_cache_interceptor` + file store |
| **Logging** | `LoggerInterceptor` |
| **Error Handling** | Centralized `ErrorHandler` → typed `Failure` objects |
| **Connectivity** | `connectivity_plus` wrapper |

### ApiService (`core/network/api_service.dart`)
Generic HTTP wrapper with GET, POST, PUT, PATCH, DELETE — all with connectivity checks and error mapping.

---

## 7. Local Storage

| Storage | Purpose |
|---------|---------|
| **Hive CE** (`hive_ce`) | Local NoSQL database — favorites, cached user, guide registration drafts |
| **FlutterSecureStorage** | Encrypted JWT token storage |
| **Dio Cache File Store** | HTTP response caching |

---

## 8. Real-Time Communication (Socket.IO)

- **Socket service abstraction** — `SocketService` interface
- **Implementation** — `SocketIOService` with auto-reconnect
- **Event bus** — `SocketEventBus` wraps socket events as Dart streams
- **Room manager** — `SocketManager` handles room join/leave lifecycle
- **Events**: `newBooking`, `bookingAccepted`, `bookingLive`, `bookingCompleted`, `chatMessage`, `messagesSeen`, `conversationUpdated`, `userTyping`

---

## 9. Localization

| Detail | Value |
|--------|-------|
| **Framework** | Flutter built-in + `intl` |
| **Languages** | English (`app_en.arb`), Arabic (`app_ar.arb`) |
| **Total Keys** | 517 translation keys |
| **Config** | `l10n.yaml` → `lib/core/localization/l10n/` |
| **Generated** | `lib/core/localization/generated/` |
| **Usage** | `context.l10n.someKey` |

---

## 10. Theming & Styling

- **Theme**: Material 3 light theme
- **Primary Color**: Orange (`#DD7B03`)
- **Fonts**:
  - **Inter** — English UI (Light, Regular, Medium, SemiBold, Bold)
  - **Poppins** — Arabic/secondary (same weights)
  - **Montserrat** — Third family (same weights)
- **Text Styles**: 1000+ lines of predefined styles
- **Responsive**: Design-based scaling on 430x932 base

---

## 11. Features & Screens

### Splash & Onboarding
| Screen | Purpose |
|--------|---------|
| `SplashScreen` | App loading with native splash |
| `OnboardingScreen` | 3-page intro with skip/next navigation |

### Authentication
| Screen | Purpose |
|--------|---------|
| `SignupAndLoginScreen` | Role-based landing page |
| `CreateAccountScreen` | Registration form |
| `LogInScreen` | Login (email/password + Google) |
| `ForgetPasswordScreen` | Email input for password reset |
| `VerificationCodeScreen` | OTP verification |
| `ResetPasswordScreen` | New password creation |
| `SucessPasswordScreen` | Password reset success |
| `ChooseNationalityScreen` | Nationality selection |
| `AllowLocationAccessScreen` | Location permission prompt |
| `ChooseRoleScreen` | Tourist vs. Tour Guide selection |

### Home (Tourist)
| Screen | Purpose |
|--------|---------|
| `TouristNavigationBarScreen` | Main tab shell (Home, Tours, Bookings, Chat, Profile) |
| `HomeScreen` | Dashboard with categories, trips, cities, AI suggestions |
| `ExplorePlacesScreen` | Grid/list of places by category/city |
| `PlaceDetailsScreen` | Full place details with images, reviews, map |
| `SelectInterestsScreen` | Interest/category selection for AI |
| `AiPackagePlacesScreen` | AI-suggested package itinerary |

### Booking
| Screen | Purpose |
|--------|---------|
| `FilterScreen` | Filter by category, price, persons |
| `ReservationScreen` | Book a place with date/time/persons |
| `BookingConfirmationScreen` | Confirm booking details |
| `PandingApprovalScreen` | Booking sent, waiting for guide approval |
| `AcceptedScreen` | Booking accepted by guide |
| `TripDetailsScreen` | Trip info + review submission |
| `GuideProfileScreen` | Public guide profile (tourist view) |
| `SuggestedPackagesScreen` | Curated tour packages |
| `PackageDetailsScreen` | Package itinerary details |
| `PackagePlaceDetailsScreen` | Individual place in a package |
| `BookPackageScreen` | Book a full package |
| `BookAiPackageScreen` | Book AI-suggested package |
| `PackageBookingSuccessScreen` | Booking success confirmation |

### Chat
| Screen | Purpose |
|--------|---------|
| `ChatScreen` | Real-time messaging via Socket.IO |

### Profile (Tourist)
| Screen | Purpose |
|--------|---------|
| `ProfileScreen` | User profile display |
| `SettingsScreen` | App settings (language, notifications, logout) |
| `EditProfileScreen` | Edit profile info |
| `AddPaymentMethodScreen` | Credit card entry |
| `FavoritesScreen` | Saved/liked places |

### Guide Dashboard
| Screen | Purpose |
|--------|---------|
| `GuideNavigationBarScreen` | Guide tab shell (Dashboard, Schedule, Chat, Profile) |
| `DashboardScreen` | Booking requests list |
| `BookingRequestScreen` | Detailed booking request view |
| `AnalysisScreen` | Earnings/performance analytics |
| `PackageRequestDetailsScreen` | Package booking request details |

### Guide Booking Schedule
| Screen | Purpose |
|--------|---------|
| `GuideBookingScreen` | Guide's schedule with live/upcoming/completed trips |

### Guide Profile
| Screen | Purpose |
|--------|---------|
| `TourGuideProfileScreen` | Guide's own profile with editing |
| `AddCertificationScreen` | Add/edit certifications |

### Guide Registration (Onboarding Wizard)
| Screen | Purpose |
|--------|---------|
| `GuideProfessionalInfoScreen` | Step 1: Experience, languages, rate, cities |
| `GuideExpertiseScreen` | Step 2: Expertise categories |
| `GuideAvailabilityAndPricingScreen` | Step 3: Work hours, pricing, document upload |
| `GuideVerificationScreen` | Submission & verification status |
| `GuideVerificationSuccessScreen` | Verification approved |
| `VerificationFailedScreen` | Verification rejected with admin notes |

### Location
| Screen | Purpose |
|--------|---------|
| `PickLocationScreen` | Pick location from map |
| `ViewLocationOnMap` | View a location on OpenStreetMap |

---

## 12. Domain Models (Entities)

| Entity | Key Fields |
|--------|------------|
| **UserEntity** | id, name, email, phone, role, status, bio, nationality, location, lat, lng, photoUrl, nationalIdImages, tourGuideLicense, availability, languages, interests, expertise, guideCities, certificates, reviews, completedTours, yearsOfExperience, hourlyRate, currency, isOnline, isVerified, verificationStatus, totalEarnings |
| **PlaceEntity** | id, title, description, category, price, images, location, rating, reviewsCount, city, minPersons, maxPersons, durationMinutes, isPopular, isBest, isCheap |
| **CategoryEntity** | id, name, image, slug |
| **CityEntity** | id, name, image, isPopular |
| **LocationEntity** | name, lat, lng |
| **ReviewEntity** | id, touristName, touristPhoto, rating, comment, createdAt |
| **BookingEntity** | id, tourist, guide, place, date, time, status, persons |
| **GuiderEntity** | id, name, photo |
| **AvailabilityEntity** | days, from, to |
| **CertificateEntity** | id, name, organization, issueDate, expirationDate, fileUrl |
| **RequestEntity** | type (booking/package), packageId, bookings, booking |

---

## 13. Dependencies Summary

| Category | Packages |
|----------|----------|
| **State Management** | flutter_bloc |
| **Routing** | go_router |
| **DI** | get_it, injectable |
| **Networking** | dio, dio_cache_interceptor, dio_cache_interceptor_file_store |
| **Auth** | firebase_core, firebase_auth, google_sign_in |
| **Storage** | hive_ce, hive_ce_flutter, flutter_secure_storage, path_provider |
| **Real-time** | socket_io_client |
| **Maps/Location** | flutter_map (OpenStreetMap), geolocator, latlong2 |
| **UI** | flutter_svg, lottie, shimmer, cached_network_image, percent_indicator, flutter_credit_card, pinput, dotted_border, dropdown_search, syncfusion_flutter_sliders, syncfusion_flutter_datepicker, linear_date_picker |
| **Media** | image_picker, file_picker |
| **Other** | connectivity_plus, dartz, intl, logger, url_launcher, async |
| **Dev** | flutter_lints, injectable_generator, build_runner, hive_ce_generator, flutter_launcher_icons |

---

## 14. Design Patterns Used

| Pattern | Implementation |
|---------|---------------|
| **Clean Architecture** | data/domain/presentation layers per feature |
| **Repository Pattern** | Abstract repo interfaces → concrete implementations |
| **Use Case Pattern** | Single-responsibility use cases per operation |
| **Cubit (BLoC)** | Simple state management without events |
| **Strategy Pattern** | Responsive layouts (Desktop/Mobile/Tablet strategies) |
| **Service Locator** | get_it for DI |
| **Mapper Pattern** | Separate mappers between Models <-> Entities |
| **Observer Pattern** | BlocObserver for debugging, socket event bus |
| **Singleton** | DioService, ConnectivityHelper, socket services |

---

## 15. Error Handling

- **Custom exceptions**: `NoInternetException`, `LocationPermissionException`, server exceptions
- **Failure codes**: 30+ enum values covering auth, network, server, cache, permission errors
- **Error → Failure mapping**: Centralized `ErrorHandler` converts exceptions to typed `Failure` objects
- **UI mapping**: `FailureUiMapper` maps failures to localized error models with images
- **SnackBar extensions**: Success/Error SnackBar builders via `snake_bar_extentions.dart`

---

## 16. Assets

| Category | Count | Format |
|----------|-------|--------|
| Icons | 65+ | SVG |
| Images | 50+ | PNG |
| Lottie Animations | 6 | JSON |
| Fonts | 3 families (Inter, Poppins, Montserrat) | TTF |

---

## 17. Backend (External)

| Component | Technology |
|-----------|------------|
| Server | Node.js (Express) |
| Database | MongoDB |
| Auth | JWT |
| Real-time | Socket.io |
| Maps | Google Maps API (app uses OpenStreetMap via flutter_map) |
| Notifications | Firebase Cloud Messaging |
| Admin Panel | React.js |

---

## 18. Configuration Files

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Project metadata, dependencies, assets, fonts |
| `analysis_options.yaml` | Lint rules (flutter_lints) |
| `l10n.yaml` | Localization config |
| `flutter_native_splash.yaml` | Native splash screen |
| `devtools_options.yaml` | Flutter DevTools settings |

---

## 19. Testing

No tests are currently implemented. The `test/` directory is empty.

---

## 20. Setup & Running

```bash
# Get dependencies
flutter pub get

# Run code generation (for injectable & hive adapters)
dart run build_runner build --delete-conflicting-outputs

# Generate localizations
flutter gen-l10n

# Run the app
flutter run
```
