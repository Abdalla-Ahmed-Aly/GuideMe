import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/chat/data/mappers/conversation_mapper.dart';
import 'package:guide_me/features/chat/data/models/conversation_model.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_conversations_use_case.dart';
part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._getAllConversationsUseCase, this._socketEventBus)
    : super(ConversationInitial()) {
    _listenToConversationUpdates();
  }
  final GetAllConversationsUseCase _getAllConversationsUseCase;
  final SocketEventBus _socketEventBus;

  StreamSubscription? _conversationSubscription;

  List<ConversationEntity> conversations = [];
  List<ConversationEntity> filteredConversations = [];
  String _lastQuery = "";
  String? _activeConversationId;

  void safeEmit(ConversationState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllConversations() async {
    safeEmit(ConversationLoading());

    final result = await _getAllConversationsUseCase();
    result.fold(
      (failure) => safeEmit(ConversationFailure(failure)),
      (conversations) {
        this.conversations = conversations;
        filteredConversations = conversations;
        safeEmit(ConversationSuccess(conversations));
      },
    );
  }

  void _listenToConversationUpdates() {
    _conversationSubscription?.cancel();
    _conversationSubscription = _socketEventBus
        .listenTo(SocketAppEvents.conversationUpdated.value)
        .listen(
          (data) {
            if (data is! Map<String, dynamic> && data is! String) return;
            final Map<String, dynamic> json = data is String
                ? jsonDecode(data) as Map<String, dynamic>
                : data as Map<String, dynamic>;

            final conversation = ConversationModel.fromJson(
              json['data']['conversation'],
            );
            _updateConversation(ConversationMapper.toEntity(conversation));
          },
        );
  }

  void reset() {
    _conversationSubscription?.cancel();
    _conversationSubscription = null;
    conversations = [];
    filteredConversations = [];
    _lastQuery = "";
    _activeConversationId = null;
    safeEmit(ConversationInitial());
  }

  void _updateConversation(ConversationEntity conversation) {
    if (state is! ConversationSuccess && state is! ConversationInitial) return;

    final isActive = _activeConversationId == conversation.conversationId;
    final lastMessage = isActive && conversation.lastMessage != null
        ? conversation.lastMessage!.copyWith(isSeen: true)
        : conversation.lastMessage;

    final index = conversations.indexWhere(
      (c) => c.conversationId == conversation.conversationId,
    );
    if (index != -1) {
      conversations[index] = conversations[index].copyWith(
        lastMessage: lastMessage,
        createdAt: conversation.createdAt,
      );
      final item = conversations.removeAt(index);
      conversations.insert(0, item);
    } else {
      conversations.insert(0, conversation.copyWith(lastMessage: lastMessage));
    }

    search(_lastQuery);
  }

  /// Call this when the user opens a chat screen.
  void setActiveConversation(String conversationId) {
    _activeConversationId = conversationId;
  }

  /// Call this when the user leaves a chat screen.
  void clearActiveConversation() {
    _activeConversationId = null;
  }

  void search(String query) {
    _lastQuery = query;
    if (query.isEmpty) {
      safeEmit(ConversationSuccess(List.from(conversations)));
      return;
    }
    if (state is ConversationSuccess) {
      filteredConversations = conversations.where((c) {
        return c.user.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      safeEmit(ConversationSuccess(List.from(filteredConversations)));
    }
  }

  void markConversationAsSeen(String conversationId) {
    final index = conversations.indexWhere(
      (c) => c.conversationId == conversationId,
    );
    if (index != -1) {
      if (conversations[index].lastMessage?.isMine == false) {
        final updatedMsg = conversations[index].lastMessage!.copyWith(isSeen: true);
        conversations[index] = conversations[index].copyWith(lastMessage: updatedMsg);
      }
      safeEmit(ConversationSuccess(List.from(conversations)));
    }
  }

  @override
  Future<void> close() async {
    _conversationSubscription?.cancel();
    _conversationSubscription = null;
    return super.close();
  }
}
