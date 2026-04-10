import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_conversations_use_case.dart';
import 'package:injectable/injectable.dart';

part 'conversation_state.dart';

@injectable
class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._getAllConversationsUseCase)
    : super(ConversationInitial());
  final GetAllConversationsUseCase _getAllConversationsUseCase;

  void safeEmit(ConversationState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllConversations() async {
    safeEmit(ConversationLoading());
    final result = await _getAllConversationsUseCase();
    result.fold(
      (failure) => safeEmit(ConversationFailure(failure)),
      (conversations) => safeEmit(ConversationSuccess(conversations)),
    );
  }
}
