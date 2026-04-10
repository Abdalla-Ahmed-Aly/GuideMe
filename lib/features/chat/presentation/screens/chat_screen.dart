import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/presentation/cubits/tracking_details_cubit/tracking_details_cubit.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_input_section.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_trip_details_card.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/messages_list_bloc_builder.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/quick_replies_section.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conversation = GoRouterState.of(context).extra as ConversationEntity;
    return Scaffold(
      backgroundColor: const Color(0xffFCFAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFAF8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Column(
          children: [
            Text(
              conversation.user.name ?? context.l10n.unknownName,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.poppinsSemiBold20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: conversation.user.isOnline ?? false
                        ? Colors.green
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  conversation.user.isOnline ?? false
                      ? context.l10n.online
                      : context.l10n.offline,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.poppinsSemiBold14.copyWith(
                    color: const Color(0xff9C7A49),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          BlocBuilder<TrackingDetailsCubit, TrackingDetailsState>(
            builder: (context, state) {
              if (!state.showTrakingDetials) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.read<TrackingDetailsCubit>().showTrackingCard();
                  },
                  child: Hero(
                    tag: "tracking_details",
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xffFEF4E6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.explore,
                        color: const Color(0xffF2930D),
                        size: 26.ic,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),

          const SizedBox(width: 4),

          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const MessagesListBlocBuilder(),

                BlocBuilder<TrackingDetailsCubit, TrackingDetailsState>(
                  builder: (context, state) {
                    return Positioned(
                      top: 16,
                      left: 24.p,
                      right: 24.p,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInOut,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(0, -0.5),
                            end: Offset.zero,
                          ).animate(animation);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        child: state.showTrakingDetials
                            ? const ChatTripDetailsCard(
                                key: ValueKey("trackingCard"),
                              )
                            : const SizedBox(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const QuickRepliesSection(),

          const ChatInputSection(),
        ],
      ),
    );
  }
}
