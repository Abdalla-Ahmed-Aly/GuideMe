import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/args/chat_args.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:guide_me/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';

import 'package:guide_me/features/chat/presentation/cubits/tracking_details_cubit/tracking_details_cubit.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_input_section.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_trip_details_card.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/messages_list_bloc_builder.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/quick_replies_section.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.args});

  final ChatArgs args;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      getIt<ConversationCubit>().setActiveConversation(
        widget.args.conversationId,
      );
      getIt<ConversationCubit>().markConversationAsSeen(
        widget.args.conversationId,
      );
      context.read<ChatCubit>().getAllChatMessages(
        conversationId: widget.args.conversationId,
        bookingId: widget.args.bookingId,
      );
    });
  }

  @override
  void dispose() {
    getIt<ConversationCubit>().clearActiveConversation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          widget.args.user.name,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.poppinsSemiBold20,
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
