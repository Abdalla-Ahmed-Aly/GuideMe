import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/tourist_booking_cubit/tourist_booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/screens/tourist_booking_screen.dart';
import 'package:guide_me/features/chat/presentation/screens/conversations_screen.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';
import 'package:guide_me/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:guide_me/features/home/presentation/screens/home_screen.dart';
import 'package:guide_me/features/home/presentation/widgets/welcome_avatar.dart';
import 'package:guide_me/features/profile/presentation/screens/profile_screen.dart';

class TouristNavigationBarScreen extends StatefulWidget {
  const TouristNavigationBarScreen({super.key});

  @override
  State<TouristNavigationBarScreen> createState() =>
      _TouristNavigationBarScreenState();
}

class _TouristNavigationBarScreenState
    extends State<TouristNavigationBarScreen> {
  late PageController _pageController;

  final List<Widget> pages = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => getIt<TouristBookingCubit>()..getBookings(),
      child: const BookingScreen(),
    ),

    const ConversationsScreen(),

    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUser();
    context.read<ConversationCubit>().getAllConversations();
    _socketConnection();
    _pageController = PageController(
      initialPage: context.read<TouristNavBarCubit>().state.index,
    );
  }

  Future<void> _socketConnection() async {
    final token = await getIt<TokenService>().getToken();
    if (token != null) {
      getIt<SocketManager>().connect(token);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onChangeScreen(int index) {
    context.read<TouristNavBarCubit>().changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        // home
        Scaffold(
          body: BlocConsumer<TouristNavBarCubit, TouristNavBarState>(
            listener: (context, state) {
              _pageController.jumpToPage(state.index);
            },
            builder: (context, state) {
              return PageView(
                controller: _pageController,
                onPageChanged: onChangeScreen,
                children: pages,
              );
            },
          ),
          bottomNavigationBar:
              BlocBuilder<TouristNavBarCubit, TouristNavBarState>(
                builder: (context, state) {
                  return BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: state.index,
                    onTap: onChangeScreen,
                    backgroundColor: Colors.white,
                    selectedItemColor: AppColors.primary,
                    unselectedItemColor: Colors.black,
                    unselectedLabelStyle: AppTextStyles.interRegular14.copyWith(
                      color: Colors.black,
                    ),
                    selectedLabelStyle: AppTextStyles.interRegular14.copyWith(
                      color: AppColors.primary,
                    ),
                    iconSize: 28,
                    items: [
                      // Icons
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.layers_outlined),
                        label: context.l10n.myTours,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.event_available_outlined),
                        label: context.l10n.bookings,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.chat_outlined),
                        label: context.l10n.chat,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.person_outline),
                        label: context.l10n.profile,
                      ),
                    ],
                  );
                },
              ),
        ),

        // Welcome Avatar
        if (context.watch<TouristNavBarCubit>().state.showWelcomeAvatar)
          WelcomeAvatar(
            onTap: () async {
              await context.read<TouristNavBarCubit>().hideWelcomeAvatar();
            },
          ),
      ],
    );
  }
}
