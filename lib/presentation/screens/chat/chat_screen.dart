import 'package:flutter/material.dart';
import 'package:flutter_yes_no/domain/entities/message.dart';
import 'package:flutter_yes_no/presentation/providers/chat_provider.dart';
import 'package:flutter_yes_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:flutter_yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_yes_no/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

//stlesw - para crear la clase del widget
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          //Encierra el circleAvatar ppara manejar el tamaño del circulo
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            //Muestra un circulo donde podemos poner una imagen.
            backgroundImage: NetworkImage(
                //Permite poner la URL de una imagen dentro del circleAvatar
                'https://static.wikia.nocookie.net/doblaje/images/e/e6/Jennifer-Aniston_2019.jpg/revision/latest?cb=20190921233642&path-prefix=es'),
          ),
        ),
        title: const Text('Mi amor 🥰'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ?  HerMessageBubble(message: message,)
                          : MyMessageBubble(message: message,);
                    })),
            //caja de texto
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
              //onValue: chatProvider.sendMessage,// Esta es otra forma de hacerlo
            ),
          ],
        ),
      ),
    );
  }
}
