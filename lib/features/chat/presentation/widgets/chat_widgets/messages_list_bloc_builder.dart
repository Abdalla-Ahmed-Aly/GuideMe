import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/messages_list_view.dart';

class MessagesListBlocBuilder extends StatelessWidget {
  const MessagesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary2),
          );
        }
        if (state is ChatFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return FailureMessageWidget(error: error.message);
        }
        if (state is ChatSuccess) {
          final reversedMessages = state.messages.reversed.toList();
          return MessagesListView(messages: reversedMessages);
        }
        return const SizedBox();
      },
    );
  }
}
