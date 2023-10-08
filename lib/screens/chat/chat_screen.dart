import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/chat/chat_viewmodel.dart';
import 'package:flashchat/widgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatViewModel viewModel = Get.put(ChatViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.message_rounded),
            onPressed: () {
              // viewModel.getMessages();
              viewModel.messageStreams();
            },
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              viewModel.auth.signOut();
            },
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStrem(viewModel: viewModel),
            Container(
              alignment: Alignment.center,
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Form(
                      key: viewModel.msgKey,
                      child: SizedBox(
                        height: 60,
                        child: CustomTextField13(
                          controller: viewModel.messagecontroller,
                          fillColor: Colors.grey.shade400.withOpacity(.7),
                          hintText: "Type your message here...",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.sendBtn();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 52,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Send",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStrem extends StatelessWidget {
  const MessageStrem({super.key, required this.viewModel});
  final ChatViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('message').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.docs.reversed;
          List<MessageBubble> messageWidgets = [];
          for (var message in data) {
            final sender = message.data()['sender'];
            final text = message.data()['text'];
            final curentLoggedIn = viewModel.user.email;
            final messagewidget = MessageBubble(
              sender: sender,
              text: text,
              isMe: curentLoggedIn == sender,
            );
            messageWidgets.add(messagewidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.all(8),
              children: messageWidgets,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
      required this.sender,
      required this.text,
      required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontSize: 10, color: Colors.black54),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(30),
              bottomLeft: isMe?const Radius.circular(30):const Radius.circular(0),
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
            ),
            color: isMe ? Colors.greenAccent : Colors.deepPurpleAccent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
