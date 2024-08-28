import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/to_do.dart';

class ToDoAPI {
  Future<List<ToDoItem>> getToDoItems() async {
    try {
      const String url = "https://jsonplaceholder.typicode.com/todos";

      var response = await http.get(Uri.parse(url));

      List<ToDoItem> todos = (json.decode(response.body))
          .map<ToDoItem>((jsonTodo) => ToDoItem.fromJson(jsonTodo))
          .toList();

      return todos;
    } catch (e) {
      rethrow;
    }
  }
}
