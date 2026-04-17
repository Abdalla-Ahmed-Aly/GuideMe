import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/error_dailog.dart';
import 'package:guide_me/core/widgets/success_dialog.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/earnings_summary_card.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/tourist_profile_image.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/pacakge_request_widgets/accept_package_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/pacakge_request_widgets/package_itinerary_list_view.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/pacakge_request_widgets/professional_nfo_grid_view.dart';

class PackageRequestDetailsScreen extends StatelessWidget {
  const PackageRequestDetailsScreen({super.key, required this.requestEntity});
  final RequestEntity requestEntity;

  double totalPrice(RequestEntity request) {
    double totalPrice = 0;
    for (var booking in request.bookings!) {
      totalPrice += booking.totalPrice.toDouble();
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final package = requestEntity;
    return BlocListener<PackageActionsCubit, PackageActionsState>(
      listener: (context, state) {
        if (state is PackageActionsSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return SuccessDialog(
                title: "${context.l10n.packageAccepted}!",
                message: context.l10n.packageAcceptedMessage,
              );
            },
          ).then((value) {
            context.read<DashboardCubit>().removePackageFromList(package.packageId!);
            context.pop();
          });
        }
        if (state is PackageActionsFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                title: "${context.l10n.error}!",
                message: error.message,
              );
            },
          ).then((value) {
            context.pop();
          });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF8F7F5),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F7F5),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            context.l10n.packageDetails,
            style: AppTextStyles.poppinsSemiBold20,
          ),
        ),

        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    Center(
                      child: TouristProfileImage(
                        imageUrl: package.bookings?[0].user.photo?.url,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: Text(
                        package.bookings?[0].user.name ??
                            context.l10n.unknownName,
                        style: AppTextStyles.poppinsRegular18,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.p),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.l10n.professionalInformation,
                          style: AppTextStyles.poppinsSemiBold20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    ProfessionalInfoGridView(request: package),

                    const SizedBox(height: 24),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.p),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.l10n.packageItinerary,
                          style: AppTextStyles.poppinsSemiBold20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    PackageItineraryListView(request: package),

                    const SizedBox(height: 24),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.p),
                      child: EarningsSummaryCard(
                        totalAmount: totalPrice(package),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            AcceptPackageSection(packageId: package.packageId!),
          ],
        ),
      ),
    );
  }
}
