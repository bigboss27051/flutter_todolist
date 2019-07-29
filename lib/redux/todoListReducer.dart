import 'package:redux/redux.dart';
import 'todoAction.dart';
import 'package:learning_flutter/todo_model.dart';

final Reducer<List<Todo>> toDoListReducer = combineReducers([
  TypedReducer<List<Todo>, AddTodoAction>(_addTask),
  TypedReducer<List<Todo>, DeleteTodoAction>(_delTask),
  TypedReducer<List<Todo>, CompleteTodoAction>(_completeTask)
]);

List<Todo> _addTask(List<Todo> todoList, AddTodoAction action) =>
    List.unmodifiable(List.from(todoList)..add(action.todoItem));

List<Todo> _delTask(List<Todo> todoList, DeleteTodoAction action) => [
      ...todoList.sublist(0, action.indexTodelete),
      ...todoList.sublist(action.indexTodelete + 1)
    ];

List<Todo> _completeTask(List<Todo> todoList, CompleteTodoAction action) {
  Todo todoUpdate = todoList[action.indexToComplete];
  todoUpdate.isComplete = !todoUpdate.isComplete;
  return [
    ...todoList.sublist(0, action.indexToComplete),
    todoUpdate,
    ...todoList.sublist(action.indexToComplete + 1)
  ];
}
