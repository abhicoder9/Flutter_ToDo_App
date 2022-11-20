import 'package:flutter/material.dart';
import '../models/todoitem.dart';

class ToDoitem extends StatelessWidget {
  final ToDo todo;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final deleteToDoItem;

  const ToDoitem({
    Key? key,
    required this.deleteToDoItem,
    required this.onToDoChanged,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.blue),
          title: Text(todo.todoText,
              style: TextStyle(
                  decoration: todo.isDone ? TextDecoration.lineThrough : null)),
          trailing: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
            ),
            child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.white, size: 17),
                onPressed: () {
                  deleteToDoItem(todo.id);
                }),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
    );
  }
}
