import 'dart:developer';

import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/core/socket/socket_io_service.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:guide_me/core/socket/socket_service.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_chat_messages.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_conversations_use_case.dart';
import 'package:guide_me/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:guide_me/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:guide_me/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';
import 'package:guide_me/features/dashboard/domain/use_case/get_requests_history_use_case.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/guide_booking/domain/use_cases/get_guide_booking_use_case.dart';
import 'package:guide_me/features/guide_booking/domain/use_cases/guide_booking_filter_use_case.dart';
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_cubit/guide_booking_cubit.dart';

class UserScope {
  static Future<void> initUserScope() async {
    getIt.pushNewScope();

    getIt.registerLazySingleton<SocketService>(() => SocketIOService());
    getIt.registerLazySingleton<SocketEventBus>(
      () => SocketEventBus(getIt<SocketService>()),
    );
    getIt.registerLazySingleton<SocketManager>(
      () => SocketManager(getIt<SocketService>()),
    );

    // Lazy Singletons
    getIt.registerLazySingleton<DashboardCubit>(
      () => DashboardCubit(
        getIt<GetRequestsHistoryUseCase>(),
        getIt<SocketEventBus>(),
      ),
    );

    // Injectable Factory
    getIt.registerFactory<GuideBookingCubit>(
      () => GuideBookingCubit(
        getIt<GetGuideBookingUseCase>(),
        getIt<GuideBookingFilterUseCase>(),
        getIt<SocketEventBus>(),
      ),
    );

    // Lazy Singleton
    getIt.registerLazySingleton<ConversationCubit>(
      () => ConversationCubit(
        getIt<GetAllConversationsUseCase>(),
        getIt<SocketEventBus>(),
      ),
    );

    // Injectable Factory
    getIt.registerFactory<ChatCubit>(
      () => ChatCubit(
        getIt<GetAllChatMessagesUseCase>(),
        getIt<SendMessageUseCase>(),
        getIt<SocketEventBus>(),
        getIt<SocketManager>(),
      ),
    );
  }

  static Future<void> disposeUserScope() async {
    // Disconnect the socket first to stop incoming events,
    // then pop the scope which disposes all lazySingleton services.
    try {
      getIt<SocketService>().disconnect();
      log("Socket Disconnected Successfully");
    } catch (_) {
      log("Socket Disconnected error");
      // Socket may already be gone; ignore.
    }
    await getIt.popScope();
  }
}
