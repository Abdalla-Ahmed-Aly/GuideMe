import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/presentation/widgets/ai_package_places_widgets/ai_package_places_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/ai_package_places_widgets/booking_ai_package_section.dart';

class AiPackagePlacesScreen extends StatelessWidget {
  const AiPackagePlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as PackageEntity;
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFCFC),
        toolbarHeight: 65,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              package.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.poppinsBold20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppColors.yellow,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  package.city.name,
                  style: AppTextStyles.poppinsRegular14,
                ),
              ],
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(
            color: AppColors.natural2,
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AiPackagePlacesListView(places: package.places),
          ),

          BookingAiPackageSection(package: package),
        ],
      ),
    );
  }
}
