import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/package_images_preview.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/user_info.dart';
import 'package:intl/intl.dart';

class PackageRequestItem extends StatefulWidget {
  const PackageRequestItem({super.key, required this.request});
  final RequestEntity request;

  @override
  State<PackageRequestItem> createState() => _PackageRequestItemState();
}

class _PackageRequestItemState extends State<PackageRequestItem> {
  double totalPrice() {
    double totalPrice = 0;
    for (var booking in widget.request.bookings!) {
      totalPrice += booking.totalPrice.toDouble();
    }
    return totalPrice;
  }

  List<String> getImages() {
    final List<String> images = [];
    for (var booking in widget.request.bookings!) {
      images.add(booking.place.images.first);
    }
    return images;
  }

  List<Widget> generatePlacesTitles() {
    return widget.request.bookings!
        .map(
          (booking) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Text(
              booking.place.title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.poppinsMedium14,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.packageRequestDetailsScreen,
          extra: widget.request,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: const Color(0xffFFE5BA)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // user info
            Row(
              children: [
                UserInfo(widget.request.bookings?[0].user.photo?.url),

                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.request.bookings?[0].user.name ??
                            context.l10n.unknownName,
                        style: AppTextStyles.poppinsMedium18,
                      ),

                      const SizedBox(height: 2),

                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: AppColors.primary2,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateFormat(
                              "MMM dd, yyyy",
                            ).format(widget.request.bookings![0].bookingDate),
                            style: AppTextStyles.poppinsMedium14.copyWith(
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        context.l10n.package,
                        style: AppTextStyles.poppinsMedium14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      '\$${totalPrice()}',
                      style: AppTextStyles.poppinsSemiBold20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              height: 100.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: PackageImagesPreview(images: getImages()),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xffF6F2EB),
                border: Border.all(color: const Color(0xffF6F2EB)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    size: 20,
                    color: AppColors.primary2,
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: generatePlacesTitles(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            BlocBuilder<PackageActionsCubit, PackageActionsState>(
              builder: (context, state) {
                return AppButton(
                  isLoading:
                      state is PackageActionsLoading &&
                      state.packageId == widget.request.packageId,
                  onPressed: () {
                    context.read<PackageActionsCubit>().acceptPackage(
                      widget.request.packageId!,
                    );
                  },
                  text: context.l10n.accept,
                  textStyle: AppTextStyles.poppinsMedium14.copyWith(
                    color: AppColors.white,
                  ),
                  height: 44,
                  radius: 12,
                  backgroundColor: AppColors.primary2,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
