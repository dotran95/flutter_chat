import 'package:demo/modules/chat_detail/bloc/chat_detail.dart';
import 'package:demo/modules/chat_detail/views/bottom_view.dart';
import 'package:demo/modules/chat_detail/views/chat_detail_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Chat Room",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => ChatDetailBloc()..add(ChatDetailLoaded()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: ChatDetailList()),
              BottomView()
            ],
          ),
        ),
      ),
    );
  }
}