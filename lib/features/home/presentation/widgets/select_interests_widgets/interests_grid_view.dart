import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/features/home/presentation/cubits/interests_cubit/interests_cubit.dart';
import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_grid_factory.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/intersests_card.dart';

class InterestsGridView extends StatelessWidget {
  const InterestsGridView({
    super.key,
    required this.categories,
  });

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final interestsCubit = context.read<InterestsCubit>();
    final strategy = InterestsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 60.p,
        vertical: 8,
      ),
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 50,
        mainAxisSpacing: 20,
        childAspectRatio: strategy.getAspectRatio(),
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return IntersestsCard(
          isSelected: interestsCubit.state.data.selectedCategories.contains(
            category.id,
          ),
          onTap: () {
            interestsCubit.toggleCategory(category.id);
          },
          image: category.image ?? "",
          title: category.name,
        );
      },
    );
  }
}
