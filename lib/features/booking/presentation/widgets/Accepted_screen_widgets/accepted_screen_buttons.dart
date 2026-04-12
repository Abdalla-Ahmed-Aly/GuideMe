import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/args/chat_args.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/app_outlined_button.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class AcceptedScreenButtons extends StatelessWidget {
  const AcceptedScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = GoRouterState.of(context).extra as BookingEntity;
    return Column(
      children: [
        AppButton(
          onPressed: () {
            context.pop();
          },
          text: context.l10n.viewSchedule,
          radius: 50,
          height: 48,
          backgroundColor: const Color(0xffF2930D),
        ),

        const SizedBox(height: 20),

        AppOutlinedButton(
          text: context.l10n.chatwithtoUurist,
          onPressed: () {
            final userCubit = context.read<UserCubit>();
            final user = (userCubit.state as UserSuccess).user;
            final args = ChatArgs(
              conversationId: ChatArgs.generateConversationId(
                guideId: booking.guider?.id ?? "",
                touristId: user.id,
              ),
              bookingId: booking.id,
              user: UserInfoEntity(
                id: booking.guider?.id ?? "",
                name: booking.guider?.name ?? "",
                location: null,
                lat: 0,
                long: 0,
                photo: booking.guider?.photo,
              ),
            );
            context.push(AppRoutes.chatScreen, extra: args);
          },
        ),
      ],
    );
  }
}
