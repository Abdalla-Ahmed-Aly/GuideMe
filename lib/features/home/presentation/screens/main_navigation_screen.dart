import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/home/presentation/screens/home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> pages = const [
    HomeScreen(),
    Scaffold(
      body: Center(child: Text("Bookings Screen")),
    ),
    Scaffold(
      body: Center(child: Text("Chat Screen")),
    ),
    Scaffold(
      body: Center(child: Text("Profile Screen")),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
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
        items: const [
          // Icons
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: 'My Tours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),

          // Svg Icons
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(AppIcons.tours),
          //   label: 'My Tours',
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(AppIcons.booking),
          //   label: 'Bookings',
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(AppIcons.chat),
          //   label: 'Chat',
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(AppIcons.profile),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
