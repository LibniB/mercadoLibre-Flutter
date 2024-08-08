import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controllers/ConsultarUsuario.dart';
import 'package:mercadolibre/src/controllers/Users.dart';

class ModalConsultarUsuarios extends StatefulWidget {
  @override
  _ModalConsultarUsuariosState createState() => _ModalConsultarUsuariosState();
}

class _ModalConsultarUsuariosState extends State<ModalConsultarUsuarios> {
  dynamic _fetchOperarios;

  @override
  void initState() {
    super.initState();
    consultarUsuarios().then((consultarUsuarios) {
      setState(() {
        _fetchOperarios = consultarUsuarios;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: _fetchOperarios != null
          ? ListView.builder(
              itemCount: _fetchOperarios.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_fetchOperarios[index].nombreCompleto),
                  subtitle: Text(_fetchOperarios[index].email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.deepPurpleAccent[200],
                        ),
                        onPressed: () {
                          
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[200],
                        ),
                        onPressed: () {
                        _showEliminarUsuario(
                          context,
                          _fetchOperarios[index].id,
                          () {
                            deleteUsers(_fetchOperarios[index].id)
                                .then((value) {
                              setState(() {
                                _fetchOperarios.removeAt(index);
                              });
                            }).catchError((error) {
                              print("Error al eliminar usuario: $error ");
                            });
                          },
                        );
                      },
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

void _showEliminarUsuario(BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmar eliminación"),
        content: Text("¿Está seguro de que desea eliminar este usuario?"),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Eliminar"),
            onPressed: () {
              Navigator.of(context).pop();
              onDeleteConfirmed();
            },
          ),
        ],
      );
    },
  );
}


