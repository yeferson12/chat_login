import 'package:chat_y_login/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuarioPage extends StatelessWidget {

   RefreshController _refreshController = RefreshController(initialRefresh: false);
  final usuario = [
    Usuario(uid: '1', nombre: 'maria', email: 'test1@gmail.com', online: true),
    Usuario(uid: '2', nombre: 'pablo', email: 'test2@gmail.com', online: false),
    Usuario(uid: '3', nombre: 'juan', email: 'test3@gmail.com', online: false),
    Usuario(uid: '4', nombre: 'deku', email: 'test4@gmail.com', online: false),
    Usuario(uid: '5', nombre: 'bakugo', email: 'test4@gmail.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi nombre', style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.exit_to_app, color: Colors.black87,),
         onPressed: (){}),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400],),
          )
        ], 
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400],),
          waterDropColor: Colors.blue[400],
        ),
        child: _listUsuarios(),
        )
   );
  }

  ListView _listUsuarios() {
    return ListView.separated(
      itemBuilder: (_, i) => _usuarioListTitle(usuario[i]), 
      separatorBuilder: (_, i) => Divider(), 
      itemCount: usuario.length
      );
  }

  ListTile _usuarioListTitle(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  _cargarUsuarios() async
  {
      await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}