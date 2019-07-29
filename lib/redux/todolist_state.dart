import 'package:learning_flutter/todo_model.dart';

class TodoListState {
  List<Todo> todoList;

  TodoListState({this.todoList});

  factory TodoListState.initial() => new TodoListState(todoList: []);
}
