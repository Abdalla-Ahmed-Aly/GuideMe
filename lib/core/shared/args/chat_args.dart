import 'package:guide_me/core/shared/entities/user_info_entity.dart';

class ChatArgs {
  final String conversationId;
  final String bookingId;
  final UserInfoEntity user;

  ChatArgs({
    required this.conversationId,
    required this.bookingId,
    required this.user,
  });

  static String generateConversationId({
    required String touristId,
    required String guideId,
  }) {
    return "${guideId}_$touristId";
  }
}
