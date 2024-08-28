class ToDoItem {
  int id;
  String title;
  bool completed;

  ToDoItem({required this.id, required this.title, required this.completed});

  factory ToDoItem.fromJson(Map<String, dynamic> json) {
    return ToDoItem(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}