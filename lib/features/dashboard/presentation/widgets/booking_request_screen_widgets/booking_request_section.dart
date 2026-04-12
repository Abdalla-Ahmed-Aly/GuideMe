import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_details_%20request_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/earnings_summary_card.dart';

class BookingRequestSection extends StatelessWidget {
  const BookingRequestSection({super.key, required this.requestEntity});
final RequestCardEntity requestEntity;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          Center(child: ProfileTouirsts(imageUrl: requestEntity.userImage,)),

          const SizedBox(height: 4),

          Center(
            child: Text(
              requestEntity.userName,
              style: AppTextStyles.poppinsRegular18.copyWith(
                color: AppColors.black,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.professionalInformation,
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child:  BookingDetailsRequestSection(requestEntity: requestEntity,),
          ),

          const SizedBox(height: 20),

          // Padding(  // TODO:: add meeting point section
          //   padding: EdgeInsets.symmetric(horizontal: 22.p),
          //   child: const MeetingPointSection(),
          // ),

          const SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.paymentSummary,
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child:  EarningsSummaryCard(requestEntity:requestEntity ,),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ProfileTouirsts extends StatelessWidget {
  const ProfileTouirsts({
    super.key, required this.imageUrl,
  });
    final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageUrl.isNotEmpty 
            ? NetworkImage(imageUrl) 
            : const AssetImage(AppImages.profileImageTest) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 1,
          right: 8,
          child: Container(
            width: 42,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(AppImages.correcting),
          ),
        ),
      ],
    );
  }
}
