import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/add_certification_cubit/add_certification_cubit.dart';

class DeleteCertificateDialog extends StatefulWidget {
  const DeleteCertificateDialog({
    super.key,
    required this.userId,
    required this.certificationId,
  });
  final String userId;
  final String certificationId;

  @override
  State<DeleteCertificateDialog> createState() =>
      _DeleteCertificateDialogState();
}

class _DeleteCertificateDialogState extends State<DeleteCertificateDialog> {
  bool isRunning = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        context.l10n.deleteCertificate,
        style: AppTextStyles.interBold18,
      ),
      content: Text(
        context.l10n.areYouSureYouWantToDeleteThisCertificate,
        style: AppTextStyles.interMedium16,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: isRunning ? null : () => context.pop(),
                child: Text(
                  context.l10n.cancel,
                  style: AppTextStyles.interMedium16.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<AddCertificationCubit, AddCertificationState>(
                listener: (context, state) {
                  if (state is AddCertificationSuccess) {
                    context.read<UserCubit>().updateUser(state.user);
                    context.showSuccessSnakbar(
                      message: context.l10n.certificateDeletedSuccessfully,
                    );
                    setState(() {
                      isRunning = false;
                    });
                    context.pop();
                  } else if (state is AddCertificationFailure) {
                    final error = FailureUiMapper.map(
                      context: context,
                      failure: state.failure,
                    );
                    context.showErrorSnakbar(message: error.message);
                    setState(() {
                      isRunning = false;
                    });
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    isLoading: state is AddCertificationLoading,
                    loadWidth: context.screenWidth,
                    onPressed: () {
                      setState(() {
                        isRunning = true;
                      });
                      context.read<AddCertificationCubit>().deleteCertification(
                        userId: widget.userId,
                        certificationId: widget.certificationId,
                      );
                    },
                    text: context.l10n.delete,
                    height: 40,
                    radius: 20,
                    backgroundColor: Colors.red,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
