enum SocketAppEvents {
  newBooking,
  bookingAccepted,
  bookingLive,
  bookingCompleted,
  chatMessage,
  messagesSeen,
  conversationUpdated,
  bookingTaken,
  userTyping;

  String get value {
    switch (this) {
      case SocketAppEvents.newBooking : return "newBooking";
      case SocketAppEvents.bookingAccepted : return "bookingAccepted";
      case SocketAppEvents.bookingLive : return "bookingLive";
      case SocketAppEvents.bookingCompleted : return "bookingCompleted";
      case SocketAppEvents.chatMessage : return "chatMessage";
      case SocketAppEvents.messagesSeen : return "messagesSeen";
      case SocketAppEvents.conversationUpdated : return "conversationUpdated";
      case SocketAppEvents.bookingTaken : return "bookingTaken";
      case SocketAppEvents.userTyping : return "userTyping";
    }
  }
}
