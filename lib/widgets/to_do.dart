import 'package:bloc_task5/models/to_do.dart';
import 'package:flutter/material.dart';

class TodosWidget extends StatelessWidget {
  final List<ToDoItem> toDoItems;
  const TodosWidget({super.key, required this.toDoItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: toDoItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(toDoItems[index].id.toString()),
            ),
            title: Text(toDoItems[index].title),
            trailing: toDoItems[index].completed
                ? const Icon(Icons.done, color: Colors.green)
                : null,
          ),
        );
      },
    );
  }
}
