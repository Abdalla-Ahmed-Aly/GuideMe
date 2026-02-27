import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/strategies/grid_veiw_strategy/grid_view_factory.dart';

class ExpertiseAreaGridView extends StatelessWidget {
  const ExpertiseAreaGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strategy = GridViewFactory.getGridViewStrategy(context.screenWidth);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 34,
        mainAxisSpacing: 22,
        childAspectRatio: strategy.getChildAspectRatio(),
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ExpertiseAreaCard();
      },
    );
  }
}

class ExpertiseAreaCard extends StatefulWidget {
  const ExpertiseAreaCard({
    super.key,
  });

  @override
  State<ExpertiseAreaCard> createState() => _ExpertiseAreaCardState();
}

class _ExpertiseAreaCardState extends State<ExpertiseAreaCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.historical,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isSelected
                      ? Container(
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
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.historical,
            style: AppTextStyles.poppinsMedium16,
          ),
        ],
      ),
    );
  }
}
