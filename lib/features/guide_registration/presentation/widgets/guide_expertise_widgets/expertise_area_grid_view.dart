import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/get_categories/get_categories_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/strategies/grid_veiw_strategy/grid_view_factory.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:shimmer/shimmer.dart';

class ExpertiseAreaGridView extends StatelessWidget {
  const ExpertiseAreaGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetCategoriesCubit(getIt<HomeRepo>())..getCategories(),
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
            return _buildShimmer(context);
          } else if (state is GetCategoriesError) {
            return Center(child: Text(state.message));
          } else if (state is GetCategoriesSuccess) {
            final categories = state.categories;
            final strategy = GridViewFactory.getGridViewStrategy(
              context.screenWidth,
            );

            return GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: strategy.getCrossAxisCount(),
                crossAxisSpacing: 34,
                mainAxisSpacing: 22,
                childAspectRatio: strategy.getChildAspectRatio(),
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ExpertiseAreaCard(
                  id: category.id ?? '',
                  title: category.name ?? '',
                  imageUrl: category.image ?? '',
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    final strategy = GridViewFactory.getGridViewStrategy(context.screenWidth);
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: strategy.getCrossAxisCount(),
          crossAxisSpacing: 34,
          mainAxisSpacing: 22,
          childAspectRatio: strategy.getChildAspectRatio(),
        ),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class ExpertiseAreaCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ExpertiseAreaCard({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GuideRegistrationSharedCubit,
      GuideRegistrationSharedState
    >(
      builder: (context, state) {
        bool isSelected = false;
        if (state is GuideRegistrationFormData) {
          isSelected = state.model.expertise.contains(id);
        }

        return GestureDetector(
          onTap: () {
            context.read<GuideRegistrationSharedCubit>().toggleExpertise(id);
          },
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: imageUrl.startsWith('http')
                          ? Image.network(
                              imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(color: Colors.grey),
                            )
                          : Container(color: Colors.grey),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isSelected
                          ? Container(
                              key: ValueKey(id),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black.withValues(alpha: 0.5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(
                              key: ValueKey("empty"),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: AppTextStyles.poppinsMedium16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
