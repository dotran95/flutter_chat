import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:demo/modules/chat_detail/bloc/chat_detail_event.dart';
import 'package:demo/modules/chat_detail/bloc/chat_detail_state.dart';
import 'package:demo/modules/chat_detail/models/models.dart';
import 'package:demo/extension/string_extension.dart';

class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  ChatDetailBloc() : super(ChatDetailInProgress()) {
    on<ChatDetailLoaded>(_onMessagesFetched);
    on<ChatDetailSent>(_onSentMessage);
  }

  _onMessagesFetched(
      ChatDetailLoaded event, Emitter<ChatDetailState> emit) async {
    try {
      final items = await _loadMessages(1);
      emit(ChatDetailSuccess(items));
    } catch (e) {
      print(e);
      emit(ChatDetailLoadFailure());
    }
  }

  _onSentMessage(ChatDetailSent event, Emitter<ChatDetailState> emit) async {
    try {
      final item = MessageItem(
          messageId: 101,
          conversationId: 1,
          text: event.message.trim(),
          type: MessageType.text,
          ownUser: MessageUser.guestUser,
          createdAt: DateTime.now().toIso8601String(),
          isOwner: true);
      final List<MessageItem> items =
          List.from((state as ChatDetailSuccess).items);
      if (items.length > 0) {
        item.isMessageSameMinuteFromUser =
            _isMessageFromSameUserInOneMinute(item, items[items.length - 1]);
      }
      items.add(item);
      emit(ChatDetailSuccess(items));
    } catch (e) {
      print(e);
      emit(ChatDetailLoadFailure());
    }
  }

  Future<List<MessageItem>> _loadMessages(int page) {
    return Future.delayed(
        const Duration(seconds: 2), () => _fakeDataListChat(page));
  }

  List<MessageItem> _fakeDataListChat(int page) {
    var guestUser = MessageUser.guestUser;
    var guestUser2 = MessageUser.guestUser2;

    List<MessageItem> items = [];
    int currentIndex = max((page - 1) * 30, 0);
    int maxIndex = page * 30;
    for (int i = currentIndex; i < maxIndex; i++) {
      bool isImage = i % 3 == 0;
      var createdAt = DateTime.utc(2021, DateTime.december, 28, 11, i);
      bool isMessageFromSameUserInOneMinute = false;
      MessageItem message;
      if (isImage) {
        message = MessageItem(
            messageId: i,
            conversationId: i,
            type: MessageType.image,
            imageUrl:
                "https://goldseasonnguyentuan.com/wp-content/uploads/2021/08/aragaki-yui-phim-va-chuong-trinh-truyen-hinh-2.jpg",
            isOwner: i % 2 == 0,
            size: ImageSize(width: 640, height: 797),
            ownUser: i % 2 == 0 ? guestUser : guestUser2,
            isMessageSameMinuteFromUser: isMessageFromSameUserInOneMinute,
            createdAt: createdAt.toIso8601String());
      } else {
        message = MessageItem(
            messageId: i,
            conversationId: i,
            type: MessageType.text,
            text: "das " + i.toString(),
            isOwner: i % 2 == 0,
            ownUser: i % 2 == 0 ? guestUser : guestUser2,
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
      MessageItem message, MessageItem lastMessage) {
    if (message.ownUser.userId == lastMessage.ownUser.userId) {
      return message.createdAt.formatDate("YYYYMddHHmm") ==
          lastMessage.createdAt.formatDate("YYYYMddHHmm");
    }
    return false;
  }
}
