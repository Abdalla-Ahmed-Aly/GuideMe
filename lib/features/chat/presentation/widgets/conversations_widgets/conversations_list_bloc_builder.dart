import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/conversations_list_view.dart';

class ConversationsListBlocBuilder extends StatelessWidget {
  const ConversationsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationCubit, ConversationState>(
      builder: (context, state) {
        if (state is ConversationLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary2,
            ),
          );
        }
        if (state is ConversationFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return FailureMessageWidget(error: error.message);
        }
        if (state is ConversationSuccess) {
          if (state.conversations.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noConversations,
                style: AppTextStyles.interSemiBold18,
              ),
            );
          }
          return ConversationsListView(conversations: state.conversations);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
