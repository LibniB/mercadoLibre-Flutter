import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controllers/ConsultarUsuario.dart';
import 'package:mercadolibre/src/controllers/Users.dart';


ModalconsultarUsuarios(BuildContext context){
  dynamic fetchOperarios;
  consultarUsuarios().then((consultarUsuarios){
    fetchOperarios = consultarUsuarios;

    showModalBottomSheet(
      context: context, 
      builder: (context){
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.event),
                )
            ],
            backgroundColor: Colors.deepPurpleAccent[200],
            title: Text("Usuarios"),
          ),
          body: ListView.builder(
            itemCount: fetchOperarios.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(fetchOperarios[index].nombreCompleto),
                subtitle: Text(fetchOperarios[index].email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.deepPurpleAccent[200],
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[200],
                      ),
                      onPressed: () {
                        _showEliminarUsuario(
                          context,
                          fetchOperarios[index].id,
                          (){
                            deleteUsers(fetchOperarios[index].id).then((value){
                              setState((){
                                fetchOperarios.removeAt(index);
                              });
                            }).catchError((error){
                              print("Error al eliminar usuario: $error ");
                            });
                          });
                      },
                    ),
                  ],
                )
              );
            },
          ),
        );
      });
  });
}

void _showEliminarUsuario(BuildContext context, String userId, VoidCallback onDeleteConfirmed){
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("confirmar eliminacion"),
        content: Text("Está seguro de que desea eliminar este usuario"),
        actions: [
          TextButton(
            child:Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
            ),
            TextButton(
            child:Text("Eliminar"),
            onPressed: () {
              Navigator.of(context).pop();
              onDeleteConfirmed();
            },
            ),
        ],
      );
    });
}