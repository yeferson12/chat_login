import 'package:chat_y_login/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: chekLoginstate(context),
        builder: (context,snapshot){
           return Center(
             child: Text('espere...'),
           );
        }),
    );
  }

  Future chekLoginstate( BuildContext context) async {
    final authServices = Provider.of<AuthServices>(context, listen: false);

    final autenticado = await authServices.isLoggendIn();

    if (autenticado) {
      Navigator.pushReplacementNamed(context, 'usuario');
    }else{
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}