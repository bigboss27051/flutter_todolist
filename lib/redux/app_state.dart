import 'package:learning_flutter/todo_model.dart';

class AppState {
  final List<Todo> todoList;

  AppState(this.todoList);

  factory AppState.initial() => AppState(List.unmodifiable([]));
}
