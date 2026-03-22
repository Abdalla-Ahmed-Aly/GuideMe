import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/show_elegant_snackbar.dart';
import 'package:guide_me/features/home/presentation/cubits/get_catogry_copy/get_catogry_copy_cubit.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/intersests_card.dart';

class InterestsGridView extends StatefulWidget {
  const InterestsGridView({
    super.key,
  });

  @override
  State<InterestsGridView> createState() => _InterestsGridViewState();
}

class _InterestsGridViewState extends State<InterestsGridView> {
  List<String> selectedCategories = [];
  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetCatogryCopyCubit, GetCatogryCopyState>(
      listener: (context, state) {
        if (state is GetCatogryCopyFailure) {
          showElegantSnackbar(
            context,
            state.failure.message ?? 'Something went wrong',
          );
        }
      },
      child: BlocBuilder<GetCatogryCopyCubit, GetCatogryCopyState>(
        builder: (context, state) {
          if (state is GetCatogryCopyLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCatogryCopySuccess) {
            final categories = state.categories;

            return Column(
              children: [
                Expanded(
                
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 70.p,
                      vertical: 20.p,
                    ),
                    physics: const ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 50,
                      childAspectRatio: context.isPortrait ? 2 / 2.5 : 2.5 / 2,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return IntersestsCard(
                        isSelected: selectedCategories.contains(category.id),
                        onTap: () {
                          setState(() {
                            if (selectedCategories.contains(category.id)) {
                              selectedCategories.remove(category.id);
                            } else {
                              selectedCategories.add(category.id);
                            }
                          });
                        },
                        image: category.image,
                        title: category.name,
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.p,
                    vertical: 20.p,
                  ),
                  child: AppButton(
                    onPressed: selectedCategories.isNotEmpty
                        ? () {
                            context.go(AppRoutes.touristNavigationBarScreen);
                          }
                        : null,
                    text: 'Continue',
                  ),
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
