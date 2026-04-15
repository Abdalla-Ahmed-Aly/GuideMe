import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/add_certification_cubit/add_certification_cubit.dart';

class UploadCertificationFile extends StatefulWidget {
  const UploadCertificationFile({super.key});

  @override
  State<UploadCertificationFile> createState() =>
      _UploadCertificationFileState();
}

class _UploadCertificationFileState extends State<UploadCertificationFile> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddCertificationCubit>();
    final hasCertificationName = cubit.certificationFile != null;
    return BlocBuilder<AddCertificationCubit, AddCertificationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await cubit.pickCertificationFile();
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            padding: hasCertificationName ? null : const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: hasCertificationName
                  ? Colors.transparent
                  : const Color(0xffF9FAFB),
              borderRadius: BorderRadius.circular(10),
              border: hasCertificationName
                  ? null
                  : Border.all(
                      color: const Color(0xffD1D5DC),
                      width: 2,
                    ),
            ),
            child: hasCertificationName
                ? Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xffD1D5DC),
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: FileImage(
                              File(cubit.certificationFile!.path!),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 8,
                        right: context.isEnglish ? 8 : null,
                        left: context.isEnglish ? null : 8,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary2.withValues(alpha: 0.1),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              cubit.removeCertificationFile();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFFEDD4),
                        ),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.primary2,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        context.l10n.uploadPdfOrImage,
                        style: AppTextStyles.interSemiBold16,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        context.l10n.supportedFormats,
                        style: AppTextStyles.interRegular16.copyWith(
                          color: const Color(0xff6A7282),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
