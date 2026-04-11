import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/booking_action_buttons.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/dashboard_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/tour_detail_card.dart';

class RequestsItem extends StatelessWidget {
  const RequestsItem({
    super.key, required this.requestModel,
  });
  final RequestCardEntity requestModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserInfo(
                 requestModel.userImage
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(requestModel.userName, style: AppTextStyles.poppinsMedium18),
                    Row(
                      children: [
                        Image.asset(
                          AppImages.world,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'English(Uk)',
                          style: AppTextStyles.poppinsMedium16.copyWith(
                            color: const Color(0xff936B24),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${requestModel.price}',
                    style: AppTextStyles.poppinsMedium20.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'ESTIMATE',
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: const Color(0xff936B24),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.p),
            child:  TourDetailCard(
              requestModel: requestModel, 
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const BookingActionButtons(),
        ],
      ),
    );
  }
}
