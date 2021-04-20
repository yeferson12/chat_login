import 'package:flutter/material.dart';

class BotonLogin extends StatelessWidget {

final String texto;
final double alto;
final double ancho;
final Color color;
final Function press;


 BotonLogin({ 
    @required this.press, 
    @required this.texto, 
    this.alto = 50, 
    this.ancho = 150, 
    this.color = Colors.orange,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.press,
      child: Container(
        alignment: Alignment.center,
        width: ancho,
        height: alto,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color
        ),
        child: Text(texto,style: TextStyle(color: Colors.white, fontSize: 17),)
      ),
    );
  }
}