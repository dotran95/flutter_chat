import 'package:demo/pages/chat_room/chat_room_router.dart';
import 'package:demo/pages/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocProvider(
        create: (_) => HomeBloc(),
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(ChatRoomRouter.goToChatRoom("conversationId"));
        },
        child: Text("Goto chat room"),
      ),
    );
  }
}
