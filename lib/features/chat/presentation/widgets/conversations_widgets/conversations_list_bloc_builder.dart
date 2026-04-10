import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
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
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ConversationFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return FailureMessageWidget(error: error.message);
        }
        if (state is ConversationSuccess) {
          return ConversationsListView(conversations: state.conversations);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
