import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/success_dialog.dart';
import 'package:guide_me/core/widgets/error_dailog.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/data/models/review_trip_request.dart';
import 'package:guide_me/features/booking/presentation/cubits/review_cubit/review_cubit.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key, required this.booking});
  final BookingEntity booking;

  static void show(BuildContext context, {required BookingEntity booking}) {
    final cubit = getIt<ReviewCubit>();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: MediaQuery.removeViewInsets(
          context: context,
          removeBottom: true,
          removeTop: true,
          child: ReviewDialog(booking: booking),
        ),
      ),
    );
  }

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is ReviewTripSuccess) {
          context.pop();

          showDialog(
            context: context,
            builder: (context) => SuccessDialog(
              title: context.l10n.thankYou,
              message: context.l10n.thankYouForYourFeedback,
            ),
          );
        } else if (state is ReviewTripFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              title: context.l10n.error,
              message: error.message,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ReviewTripLoading;

        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                Container(
                  color: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: isLoading ? null : () => context.pop(),
                        ),
                      ),
                      Text(
                        context.l10n.feedback,
                        style: AppTextStyles.poppinsMedium20.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.howWasYourExperience,
                        style: AppTextStyles.poppinsMedium18.copyWith(
                          color: AppColors.natural1,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Interactive Rating Stars
                      Row(
                        children: List.generate(5, (index) {
                          final starIndex = index + 1;
                          final isSelected = starIndex <= _rating;
                          return GestureDetector(
                            onTap: isLoading
                                ? null
                                : () {
                                    setState(() {
                                      _rating = starIndex;
                                    });
                                  },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: Icon(
                                  key: ValueKey(isSelected),
                                  Icons.star_rounded,
                                  size: 40,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.natural2,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 12),

                      // Feedback TextField
                      TextFormField(
                        controller: _commentController,
                        maxLines: 4,
                        enabled: !isLoading,
                        onTapOutside: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return context.l10n.feedbackRequired;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: context.l10n.yourFeedback,
                          hintStyle: AppTextStyles.poppinsRegular14.copyWith(
                            color: AppColors.natural2,
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          border: _buildOutlineBorder(),
                          enabledBorder: _buildOutlineBorder(),
                          focusedBorder: _buildOutlineBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // See Trip Details Text Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: isLoading ? null : () => context.pop(),
                          child: Text(
                            context.l10n.seeTripDetails,
                            style: AppTextStyles.poppinsMedium14.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Submit Button
                      Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          isLoading: isLoading,
                          onPressed: _rating == 0
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    final request = ReviewTripRequest(
                                      bookingId: widget.booking.id,
                                      rating: _rating,
                                      comment: _commentController.text.trim(),
                                    );
                                    context.read<ReviewCubit>().reviewTrip(
                                      request: request,
                                    );
                                  } else {
                                    setState(() {
                                      _autoValidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                },
                          text: context.l10n.submit,
                          backgroundColor: AppColors.primary,
                          radius: 15,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: AppColors.natural2,
      ),
    );
  }
}
