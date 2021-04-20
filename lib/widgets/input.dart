import 'package:flutter/material.dart';

class Input extends StatelessWidget {

  final IconData              icon;
  final String                placeholder;
  final TextEditingController textController; //me va a decir lo que dijiten en el input 
  final TextInputType         keyBoarType;
  final bool                  isPassword;

  const Input({Key key, 
  @required this.icon, 
  @required this.placeholder, 
  @required this.textController, 
  this.keyBoarType = TextInputType.text,
  this.isPassword = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0,5),
                  blurRadius: 5
                )
              ]
            ),
            child: TextField(
              controller: this.textController,
              autocorrect: false,// para que no autocomplete
              keyboardType: this.keyBoarType,// el teclado se configura a email
              obscureText: this.isPassword, // para contraseña
              decoration: InputDecoration(
                prefixIcon: Icon(this.icon),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: this.placeholder
              ),
            )
            );
  }
}