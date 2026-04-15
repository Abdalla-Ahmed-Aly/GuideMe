// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:guide_me/core/app_assets/app_icons.dart';
// import 'package:guide_me/core/app_assets/app_images.dart';
// import 'package:guide_me/core/extentions/context_extentions.dart';
// import 'package:guide_me/core/styles/app_text_styles.dart';
// import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
// import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

// class ProfilePhotoSection extends StatelessWidget {
//   const ProfilePhotoSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const UploadPhoto(),

//         const SizedBox(
//           height: 8,
//         ),

//         Text(
//           context.l10n.profilePhoto,
//           style: AppTextStyles.poppinsSemiBold18,
//         ),
//         Text(
//           context.l10n.uploadProfessionalHeadshot,
//           style: AppTextStyles.poppinsRegular14.copyWith(
//             color: const Color(0xffA38354),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class UploadPhoto extends StatelessWidget {
//   const UploadPhoto({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.read<GuideRegistrationSharedCubit>().pickProfilePhoto();
//       },
//       child: Stack(
//         children: [
//           BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
//             builder: (context, state) {
//               if (state is GuideRegistrationFormData) {
//                 return Container(
//                   width: 150,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 10,
//                     ),
//                     image: state.model.profilePhoto != null
//                         ? DecorationImage(
//                             image: FileImage(File(state.model.profilePhoto!.path!)),
//                             fit: BoxFit.cover,
//                           )
//                         : const DecorationImage(
//                             image: AssetImage(AppImages.profileImageTest),
//                           ),
//                   ),
//                 );
//               }
//               return const SizedBox.shrink();
//             },
//           ),

//           Positioned(
//             bottom: 0,
//             right: 4,
//             child: Container(
//               width: 46,
//               height: 46,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color(0xffF2930D),
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 4,
//                 ),
//               ),
//               child: Center(
//                 child: SvgPicture.asset(
//                   AppIcons.cameraOutline,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
