import 'package:learning_flutter/todo_model.dart';

class AddTodoAction {
  final Todo todoItem;

  AddTodoAction(this.todoItem);
}

class DeleteTodoAction {
  final int indexTodelete;

  DeleteTodoAction(this.indexTodelete);
}

class CompleteTodoAction {
  final int indexToComplete;

  CompleteTodoAction(this.indexToComplete);
}