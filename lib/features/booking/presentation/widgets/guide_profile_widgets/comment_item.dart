import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/dynamic_stars%20.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  // radius: 24,
                  backgroundImage: AssetImage(AppImages.profileImageTest),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sarah Jenkins',
                          style: AppTextStyles.poppinsRegular18,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(AppImages.earth),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'English(Uk) . 2 days ago',
                              style: AppTextStyles.poppinsRegular16.copyWith(
                                color: const Color(0xffB59A64),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.p,
                    vertical: 8.p,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFEF4E6),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    context.l10n.verified,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: const Color(0xffF2930D),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: DynamicStars(
                rating: 4,
                color: const Color(0xffDD7B03),
                size: 18.w,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              'An incredible tour of the Giza Plateau! Our guide was knowledgeable and very professional. He knew all the quiet spots for perfect photos away from the crowds. Highly recommended!',
              style: AppTextStyles.poppinsRegular12,
              softWrap: true,
            ),
            Divider(
              color: Colors.grey.withValues(alpha: .2),
              thickness: 1,
              height: 32,
              indent: 20, //  ب
              endIndent: 20, //
            ),
          ],
        ),
      ),
    );
  }
}
