import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/screens/booking_screen.dart';
import 'package:guide_me/features/dashboard/presentation/cubit/navigation_bottom_bar_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:guide_me/features/dashboard/presentation/screens/analysis_screen.dart';

class MainNavigationBottombar extends StatefulWidget {
  const MainNavigationBottombar({super.key});

  @override
  State<MainNavigationBottombar> createState() =>
      _MainNavigationBottombarState();
}

class _MainNavigationBottombarState extends State<MainNavigationBottombar> {
  final PageController pageController = PageController();
  final List<Widget> pages = [
    const DashboardScreen(),
    BlocProvider(
      create: (context) => BookingCubit(),
      child: const BookingScreen(),
    ),
    const Scaffold(
      body: Center(child: Text("Chat Screen")),
    ),
    const AnalysisScreen(),
  ];
  void changedscreen(int index) {
    context.read<NavigationBottomBarCubitCubit>().changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBottomBarCubitCubit, int>(
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
          bottomNavigationBar: BlocBuilder<NavigationBottomBarCubitCubit, int>(
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
                    icon: Icon(FontAwesomeIcons.chartBar),
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
