import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/args/filter_args.dart';
import 'package:guide_me/features/booking/presentation/widgets/suggested_packages_widgets/package_card.dart';

class PackagesListView extends StatelessWidget {
  const PackagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final filterArgs = GoRouterState.of(context).extra as FilterArgs;
    final packages = filterArgs.packages;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      itemCount: packages.length,
      itemBuilder: (context, index) {
        return PackageCard(package: packages[index]);
      },
    );
  }
}
