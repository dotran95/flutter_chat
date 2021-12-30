import 'package:camera/camera.dart';
import 'package:demo/modules/camera/camera_page.dart';
import 'package:demo/modules/chat_detail/bloc/chat_detail.dart';
import 'package:demo/extension/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  bool _isShowSendButton = false;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatDetailBloc, ChatDetailState>(
        builder: (context, state) {
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
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    context.present(TakePictureScreen(camera: firstCamera));
  }

  onPressSendMessage() {
    print("onPressSendMessage");
    BlocProvider.of<ChatDetailBloc>(context)
        .add(ChatDetailSent(_textController.text));
    _textController.clear();
    setState(() {
      _isShowSendButton = false;
    });
  }
}
