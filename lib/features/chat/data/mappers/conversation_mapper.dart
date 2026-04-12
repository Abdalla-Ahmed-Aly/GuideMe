import 'package:guide_me/core/shared/mapper/user_info_mapper.dart';
import 'package:guide_me/features/chat/data/models/conversation_model.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';

class ConversationMapper {
  static ConversationEntity toEntity(ConversationModel model) {
    return ConversationEntity(
      conversationId: model.conversationId ?? "",
      bookingId: model.bookingId ?? "",
      lastMessage: model.lastMessage ?? "",
      createdAt: model.createdAt ?? "",
      user: UserInfoMapper.toEntity(model.userModel),
    );
  }
}
