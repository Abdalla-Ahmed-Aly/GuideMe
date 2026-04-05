import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/screens/conversations_screen.dart';
import 'package:guide_me/features/dashboard/presentation/cubit/guide_navigation_bar_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/analysis_screen.dart';
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
    const DashboardScreen(),
    const GuideBookingScreen(),
    const ConversationsScreen(),
    const AnalysisScreen(),
  ];
  void changedscreen(int index) {
    context.read<GuideNavigationBarCubit>().changeIndex(index);
  }

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUser();
    _socketConnection();
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
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Dashboard",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "Booking",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: "Chat",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.analytics),
                    label: "Analysis",
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
