import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

  mostrarAlerta(BuildContext context, String titulo, String subTitulo)
  {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(subTitulo),
        actions: [
          MaterialButton(
            child: Text('OK'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed: () => Navigator.pop(context)
            )
        ],
      )
      );
  }