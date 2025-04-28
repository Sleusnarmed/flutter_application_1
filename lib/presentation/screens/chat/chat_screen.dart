import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno_app/presentation/Widgets/chat/her_message_bubble.dart';
import 'package:yesno_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yesno_app/presentation/Widgets/shared/message_field_box.dart';
import 'package:yesno_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/1200px-GitHub_Invertocat_Logo.svg.png'),
          ),
        ),
        title: Text("Terminator"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Le pide que esté pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? HerMessageBubble()
                    : MyMessageBubble();
              },
            )),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
