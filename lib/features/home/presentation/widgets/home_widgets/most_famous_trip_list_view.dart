import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_state.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_shimmers.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/most_famous_trip_card.dart';

class MostFamousTripListView extends StatelessWidget {
  const MostFamousTripListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAiPackageCubit, GetAiPackageState>(
      builder: (context, state) {
        if (state is GetAiPackageLoading) {
          return ListView.builder(
            padding: EdgeInsets.only(left: 20.p),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => const PlaceShimmer(),
          );
        } else if (state is GetAiPackageFailure) {
          return Center(child: Text(state.message));
        } else if (state is GetAiPackageSuccess) {
          return ListView.builder(
            padding: EdgeInsets.only(left: 20.p),
            scrollDirection: Axis.horizontal,
            itemCount: state.packages.length,
            itemBuilder: (context, index) {
              return MostFamousTripCard(
                package: state.packages[index],
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
