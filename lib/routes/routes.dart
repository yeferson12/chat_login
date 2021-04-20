

import 'package:chat_y_login/pages/chat_page.dart';
import 'package:chat_y_login/pages/loading_page.dart';
import 'package:chat_y_login/pages/login_page.dart';
import 'package:chat_y_login/pages/registre_page.dart';
import 'package:chat_y_login/pages/usuario_pages.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  'usuario': (_)  => UsuarioPage(),
  'chat': (_)     => ChatPage(),
  'login': (_)    => LoginPage(),
  'register': (_) => RegistrePage(),
  'loading': (_)  => LoadingPage(),
};