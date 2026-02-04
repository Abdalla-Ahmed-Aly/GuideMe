import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookTuristsDetailsPlace extends StatelessWidget {
  const BookTuristsDetailsPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: 430.w,
      height: 455.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Text(
                          context.l10n.address,
                          style: AppTextStyles.poppinsRegular28.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          context.l10n.address1,
                          style: AppTextStyles.poppinsRegular28.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100.p, bottom: 14.p),
                        child: Text(
                          r"$85/Day",
                          style: AppTextStyles.interSemiBold20.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 19.p,
                      top: 9.p,
                      right: 174.p,
                    ),
                    child: Text(
                      context.l10n.overview,
                      style: AppTextStyles.interSemiBold18.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                  SvgPicture.asset(AppIcons.calendar),
                  Padding(
                    padding: EdgeInsets.only(left: 5.p, right: 23.p),
                    child: Text(
                      '14 Nov-22Nov',
                      style: AppTextStyles.interRegular14.copyWith(
                        color: const Color(0xff7D848D),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.p, top: 15.p),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.vector,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.p),
                      child: Column(
                        children: [
                          Text(
                            context.l10n.duration,
                            style: AppTextStyles.interBold10.copyWith(
                              color: AppColors.natural4,
                            ),
                          ),
                          Text(
                            '3 hr',
                            style: TextStyle(
                              fontFamily: 'lato',
                              fontSize: 10.fs,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.p, bottom: 8.p),
                      child: SvgPicture.asset(AppIcons.star),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.p),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 40.p),
                            child: Text(
                              context.l10n.rate,
                              style: AppTextStyles.interBold10.copyWith(
                                color: AppColors.natural4,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Text(
                                  '5.0',
                                  style: TextStyle(
                                    fontFamily: 'lato',
                                    fontSize: 10.fs,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '(2.9k Reviews)',
                                style: AppTextStyles.interSemiBold10.copyWith(
                                  color: AppColors.natural4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.p,
                  right: 20.p,
                  bottom: 14.p,
                  top: 20.p,
                ),
                child: Text(
                  'Discover the Pyramids of Giza with a guided tour showcasing ancient history, the Great Pyramid, and the iconic Sphinx — all in one unforgettable experience.',
                  style: AppTextStyles.interRegular12.copyWith(
                    color: AppColors.natural4,
                  ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 18.p, right: 20.p, bottom: 13.p),
                child: Text(
                  'Discover the Pyramids of Giza with a guided tour showcasing ancient history, the Great Pyramid, and the iconic Sphinx — all in one unforgettable experience.',
                  style: AppTextStyles.interRegular12.copyWith(
                    color: AppColors.natural4,
                  ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 18.p, right: 20.p, bottom: 13.p),
                child: Text(
                  'Discover the Pyramids of Giza with a guided tour showcasing ancient history, the Great Pyramid, and the iconic Sphinx — all in one unforgettable experience.',
                  style: AppTextStyles.interRegular12.copyWith(
                    color: AppColors.natural4,
                  ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),

              SizedBox(
                height: size.height * 0.125,
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
