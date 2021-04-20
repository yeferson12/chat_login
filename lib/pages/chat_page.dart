import 'package:chat_y_login/widgets/chat_mesage.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage>  with TickerProviderStateMixin{

  final _textController = new TextEditingController();
final _focusNode = new FocusNode();

List<ChatMessage> _message =[
];

bool _iconoEnviar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('YM',style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),

            SizedBox(height: 3,),
            Text('Yeferson Monsalve',style: TextStyle(fontSize: 12, color: Colors.black87))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [

            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _message.length,
                itemBuilder: (_, i) => _message[i],
                reverse: true,
              ),
            ),

            Divider(height: 1,),
            
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
     ),
   );
  }

 Widget _inputChat(){
    
    return SafeArea(
       child: Container(
         margin: EdgeInsets.symmetric(horizontal: 8),
         child: Row(
           children: [
             Flexible(
               child: TextField(
                 controller: _textController,
                 onSubmitted: _handleSubmi,
                 onChanged: ( texto){
                    setState(() {
                      if (texto.trim().length > 0) {
                        _iconoEnviar = true;
                      }else{
                        _iconoEnviar = false;
                      }
                    });
                 },// ayuda a sabe que esta escribiendo para poder mandar a pantalla
                 decoration: InputDecoration.collapsed(
                   hintText: 'Escribe'),
                 focusNode: _focusNode,  
               )
             ),

             Container(
               margin: EdgeInsets.symmetric(horizontal: 4),
               child: IconTheme(
                 data: IconThemeData(color: Colors.blue[400]),
                 child: IconButton(
                   highlightColor: Colors.transparent,
                   splashColor: Colors.transparent,
                   icon: Icon(Icons.send,),
                   onPressed: _iconoEnviar
                   ? () => _handleSubmi(_textController.text.trim())
                   : null,
                 ),
               ),
             )
           ],
         ),
       ),
    );
    
  }

  _handleSubmi(String texto)
  {
    if (texto.length == 0)  return;
     print(texto);
     _textController.clear();
     _focusNode.requestFocus();

     final newMessage = new ChatMessage(
       uid: '123',
       texto: texto, 
       animationController:AnimationController(vsync: this,duration: Duration(milliseconds: 400)));
     _message.insert(0, newMessage);
     newMessage.animationController.forward();

     setState(() {
       _iconoEnviar = false;
     });
  }
  @override
     void dispose() { 
       for( ChatMessage message in _message){
         message.animationController.dispose();
       }
       super.dispose();
     }
}