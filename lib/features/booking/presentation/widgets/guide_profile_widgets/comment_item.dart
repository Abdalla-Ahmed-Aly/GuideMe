
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';


class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  radius: 30,
                  backgroundImage: AssetImage(AppImages.profileImageTest),
                ),

                Padding(
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppIcons.star1),
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(AppIcons.star1),
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(AppIcons.star1),
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(AppIcons.star1),
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(AppIcons.star1),
                ],
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
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.like,
                    width: 24.w,
                    height: 24.h,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '15',
                    style: AppTextStyles.poppinsRegular16.copyWith(
                      color: const Color(0xffB59A64),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SvgPicture.asset(
                    AppIcons.dislike,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
