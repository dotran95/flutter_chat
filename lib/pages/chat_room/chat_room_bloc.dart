import 'dart:math';
import 'package:demo/models/index.dart';
import 'package:demo/pages/chat_room/chat_room_event.dart';
import 'package:demo/pages/chat_room/chat_room_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo/extension/index.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc() : super(ChatRoomState(items: [])) {
    on<ChatRoomFetchMessage>(_onFetchMessage);
    on<ChatRoomSendEvent>(_onSendMessage);
  }

  _onFetchMessage(
      ChatRoomFetchMessage event, Emitter<ChatRoomState> emit) async {
    try {
      final items = await _loadMessages(1);
      emit(state.copyWith(items: items));
    } catch (e) {
      print(e);
      emit(state.copyWith(items: []));
    }
  }

  _onSendMessage(ChatRoomSendEvent event, Emitter<ChatRoomState> emit) async {
    final List<Message> items = state.items;
    try {
      final item = Message(
          messageId: 101,
          conversationId: 1,
          text: event.message.trim(),
          type: MessageType.text,
          ownUser: User.guestUser,
          createdAt: DateTime.now().toIso8601String(),
          isOwner: true);
      if (items.length > 0) {
        item.isMessageSameMinuteFromUser =
            _isMessageFromSameUserInOneMinute(item, items[items.length - 1]);
      }
      items.add(item);
      emit(state.copyWith(items: items));
    } catch (e) {
      print(e);
    }
  }

  Future<List<Message>> _loadMessages(int page) {
    return Future.delayed(
        const Duration(seconds: 2), () => _fakeDataListChat(page));
  }

  List<Message> _fakeDataListChat(int page) {
    var fromUser = User.guestUser;
    var toUsser = User.guestUser2;

    List<Message> items = [];
    int currentIndex = max((page - 1) * 30, 0);
    int maxIndex = page * 30;
    for (int i = currentIndex; i < maxIndex; i++) {
      bool isImage = i % 3 == 0;
      var createdAt = DateTime.utc(2021, DateTime.december, 28, 11, i);
      bool isMessageFromSameUserInOneMinute = false;
      Message message;
      if (isImage) {
        message = Message(
            messageId: i,
            conversationId: i,
            type: MessageType.image,
            imageUrl:
                "https://goldseasonnguyentuan.com/wp-content/uploads/2021/08/aragaki-yui-phim-va-chuong-trinh-truyen-hinh-2.jpg",
            isOwner: i % 2 == 0,
            size: ImageSize(width: 640, height: 797),
            ownUser: i % 2 == 0 ? fromUser : toUsser,
            isMessageSameMinuteFromUser: isMessageFromSameUserInOneMinute,
            createdAt: createdAt.toIso8601String());
      } else {
        message = Message(
            messageId: i,
            conversationId: i,
            type: MessageType.text,
            text: "das " + i.toString(),
            isOwner: i % 2 == 0,
            ownUser: i % 2 == 0 ? fromUser : toUsser,
            isMessageSameMinuteFromUser: isMessageFromSameUserInOneMinute,
            createdAt: createdAt.toIso8601String());
      }

      if (items.length > 0) {
        message.isMessageSameMinuteFromUser =
            _isMessageFromSameUserInOneMinute(message, items[items.length - 1]);
      }
      items.add(message);
    }
    return items;
  }

  bool _isMessageFromSameUserInOneMinute(
      Message message, Message lastMessage) {
    if (message.ownUser.userId == lastMessage.ownUser.userId) {
      return message.createdAt.formatDate("YYYYMddHHmm") ==
          lastMessage.createdAt.formatDate("YYYYMddHHmm");
    }
    return false;
  }
}
