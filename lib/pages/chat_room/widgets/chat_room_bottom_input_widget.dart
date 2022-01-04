import 'package:demo/pages/came_take_picture/index.dart';
import 'package:demo/pages/chat_room/chat_room_bloc.dart';
import 'package:demo/pages/chat_room/chat_room_event.dart';
import 'package:demo/pages/chat_room/chat_room_router.dart';
import 'package:demo/pages/chat_room/chat_room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo/extension/index.dart';

class ChatRoomBottomView extends StatefulWidget {
  const ChatRoomBottomView({Key? key}) : super(key: key);

  @override
  _ChatRoomBottomViewState createState() => _ChatRoomBottomViewState();
}

class _ChatRoomBottomViewState extends State<ChatRoomBottomView> {
  bool _isShowSendButton = false;
  final _textController = TextEditingController();

  ChatRoomBloc get bloc {
    return BlocProvider.of<ChatRoomBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            _buildButton("assets/images/plus.png", onPressPlusButton),
            Expanded(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: TextField(
                controller: _textController,
                maxLines: 5,
                minLines: 1,
                decoration:
                    new InputDecoration.collapsed(hintText: 'Nhập tin nhắn'),
                onChanged: onChangeMessage,
              ),
            )),
            _buildButton(
                _isShowSendButton
                    ? "assets/images/send.png"
                    : "assets/images/camera.png",
                _isShowSendButton ? onPressSendMessage : onPressCameraButton)
          ],
        ),
      );
    });
  }

  Widget _buildButton(String name, VoidCallback onPress) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          name,
          width: 24,
          height: 24,
        ),
        height: 40,
        width: 40,
      ),
      onTap: onPress,
    );
  }

  onChangeMessage(String value) {
    setState(() {
      _isShowSendButton = value.length > 0;
    });
  }

  onPressPlusButton() {
    print("onPressPlusButton");
  }

  onPressCameraButton() async {
    print("onPressCameraButton");
    final _ = await TakePictureRouter.present(
        context: context, fromRouteName: ChatRoomRouter.name);
    final args = ModalRoute.of(context)!.settings.arguments;
    final image = await TakePictureRouter.getImage(args);
    if (image != null) {
      bloc.add(ChatRoomSendEvent(image: image));
    }
  }

  onPressSendMessage() {
    print("onPressSendMessage");
    bloc.add(ChatRoomSendEvent(message: _textController.text));
    _textController.clear();
    setState(() {
      _isShowSendButton = false;
    });
  }
}
