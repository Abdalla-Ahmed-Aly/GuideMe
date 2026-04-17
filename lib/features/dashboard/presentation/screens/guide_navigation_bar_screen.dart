import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:guide_me/features/chat/presentation/screens/conversations_screen.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Toogle_Online_Status/toogle_online_status_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/guide_nav_bar_cubit/guide_navigation_bar_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Analysis_Cubit/analysis_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_and_decline_cubit/accept_booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/analysis_screen.dart';
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_action_cubit/guide_booking_actions_cubit.dart';
import 'package:guide_me/features/guide_booking/presentation/screens/guide_booking_screen.dart';

class GuideNavigationBarScreen extends StatefulWidget {
  const GuideNavigationBarScreen({super.key});

  @override
  State<GuideNavigationBarScreen> createState() =>
      _GuideNavigationBarScreenState();
}

class _GuideNavigationBarScreenState extends State<GuideNavigationBarScreen> {
  final PageController pageController = PageController();

  final List<Widget> pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AcceptBookingCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<PackageActionsCubit>(),
        ),
      ],
      child: const DashboardScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<GuideBookingActionsCubit>(),
      child: const GuideBookingScreen(),
    ),
    const ConversationsScreen(),
    BlocProvider(
      create: (context) => getIt<AnalysisCubit>()..getAnalysis(),
      child: const AnalysisScreen(),
    ),
  ];
  void changedscreen(int index) {
    context.read<GuideNavigationBarCubit>().changeIndex(index);
  }

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUser();
    context.read<ConversationCubit>().getAllConversations();
    _socketConnection();

    // Trigger initial dashboard requests check only once when the navigation shell is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final isOnline = context.read<ToggleOnlineStatusCubit>().isOnline;
        if (isOnline) {
          context.read<DashboardCubit>().getRequestsHistory();
        }
      }
    });
  }

  Future<void> _socketConnection() async {
    final token = await getIt<TokenService>().getToken();
    if (token != null) {
      getIt<SocketManager>().connect(token);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GuideNavigationBarCubit, int>(
      listener: (context, index) {
        pageController.jumpToPage(index);
      },
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: pageController,
            onPageChanged: changedscreen,
            children: pages,
          ),
          bottomNavigationBar: BlocBuilder<GuideNavigationBarCubit, int>(
            builder: (context, index) {
              return BottomNavigationBar(
                onTap: changedscreen,
                currentIndex: index,
                backgroundColor: const Color(0xffF8F7F5),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.black,
                selectedLabelStyle: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.primary,
                ),
                unselectedLabelStyle: AppTextStyles.interRegular14.copyWith(
                  color: Colors.black,
                ),
                iconSize: 28,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.dashboard_outlined),
                    label: context.l10n.dashboard,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.event_available_outlined),
                    label: context.l10n.booking,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.chat_outlined),
                    label: context.l10n.chat,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.bar_chart_rounded),
                    label: context.l10n.analysis,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
