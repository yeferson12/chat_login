import 'package:chat_y_login/helpers/mostrar_alerta.dart';
import 'package:chat_y_login/services/auth_services.dart';
import 'package:chat_y_login/widgets/boton_login.dart';
import 'package:chat_y_login/widgets/input.dart';
import 'package:chat_y_login/widgets/labels.dart';
import 'package:chat_y_login/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Logo(titulo: 'Messenger',),
                  _Form(),
                  Labels(
                    ruta: 'register',
                    titulo: 'No tienes Cuenta?',
                    subtitulo: 'Crear una ahora',
                    ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text('Terminaos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200),))
                   
              ],
            ),
          ),
        ),
      )
   );
  }
}


class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServices>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Input( 
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyBoarType: TextInputType.emailAddress,
            textController: emailCtrl,
            ),
            Input( 
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
            ),
            BotonLogin(
              texto: 'Ingrese',
              color: Colors.blue,
              alto: 55,
              ancho: double.infinity,
              press:authProvider.autenticando ? null : () async{
                
                FocusScope.of(context).unfocus();//quietar el teclado al presionar el boton
                
                final loginOk = await authProvider.login(emailCtrl.text.trim(), passCtrl.text.trim());
                  if (loginOk) {
                     Navigator.pushReplacementNamed(context, 'usuario');
                  }else{
                       mostrarAlerta(context, 'login incorrecto', 'revise sus credenciales nuevamente');
                  }
                },

            )
        ],
      ),
    );
  }
}