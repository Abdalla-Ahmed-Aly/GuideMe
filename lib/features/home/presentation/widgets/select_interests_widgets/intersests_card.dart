import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class IntersestsCard extends StatelessWidget {
  const IntersestsCard({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.go(AppRoutes.mainNavigationScreen);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: AppTextStyles.poppinsRegular12,
          ),
        ],
      ),
    );
  }
}
