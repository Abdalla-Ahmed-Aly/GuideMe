import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';

class ChangeImageSection extends StatelessWidget {
  const ChangeImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<UserCubit>().state as UserSuccess).user;

    return GestureDetector(
      onTap: () async {
        await context.read<UpdateProfileCubit>().pickProfilePhoto();
      },
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: 110,
                width: 110,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  shape: BoxShape.circle,
                ),
                child: _buildProfileImage(
                  pickedImage: state.selectedPhoto,
                  userUrlPhoto: state.networkPhotoUrl,
                ),
              ),

              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    AppIcons.camera,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileImage({
    PickedFileModel? pickedImage,
    String? userUrlPhoto,
  }) {
    if (pickedImage != null) {
      return Image.file(
        File(pickedImage.path!),
        fit: BoxFit.cover,
      );
    } else if (userUrlPhoto != null) {
      return CustomNetworkImage(
        imageUrl: userUrlPhoto,
        fit: BoxFit.cover,
      );
    }
    return const Icon(
      Icons.person_outline,
      size: 50,
    );
  }
}
