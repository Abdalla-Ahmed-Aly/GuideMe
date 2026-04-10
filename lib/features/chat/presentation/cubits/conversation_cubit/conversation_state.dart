part of 'conversation_cubit.dart';

sealed class ConversationState {}

final class ConversationInitial extends ConversationState {}

final class ConversationLoading extends ConversationState {}

final class ConversationSuccess extends ConversationState {
  final List<ConversationEntity> conversations;
  ConversationSuccess(this.conversations);
}

final class ConversationFailure extends ConversationState {
  final Failure failure;
  ConversationFailure(this.failure);
}
