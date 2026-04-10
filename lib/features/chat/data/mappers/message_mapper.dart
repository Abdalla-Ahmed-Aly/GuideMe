import 'package:guide_me/core/shared/mapper/user_info_mapper.dart';
import 'package:guide_me/features/chat/data/models/message_model.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';

class MessageMapper {
  static MessageEntity mapToEntity(MessageModel model) {
    return MessageEntity(
      id: model.id,
      booking: model.booking,
      conversationId: model.conversationId,
      sender: UserInfoMapper.toEntity(model.sender),
      receiver: model.receiver ?? "",
      message: model.message ?? "",
      type: model.type ?? "",
      isSeen: model.isSeen,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      isMine: model.isMine ?? true,
    );
  }
}