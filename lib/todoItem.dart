import 'package:flutter/material.dart';
import 'package:flutter_vet/toDo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  // final ondelete;

  const ToDoItem({super.key, required this.toDo, required this.onToDoChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(toDo, toDo.id);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box_outline_blank),
        iconColor: Colors.blue,
        title: Text(
          toDo.todoText!,
        ),
      ),
    );
  }
}
