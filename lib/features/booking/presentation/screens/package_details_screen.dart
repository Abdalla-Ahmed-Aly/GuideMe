import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_details_widgets/confirm_package_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_details_widgets/package_places_list_view.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFCFC),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.packageDetails,
          style: AppTextStyles.poppinsBold22,
        ),
        leadingWidth: 65,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: const Color(0xffE2E8F0),
          ),
        ),
      ),

      body: const Column(
        children: [
          Expanded(
            child: PackagePlacesListView(),
          ),

          ConfirmPackageSection(),
        ],
      ),
    );
  }
}
