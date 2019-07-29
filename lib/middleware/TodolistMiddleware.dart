import 'package:redux/redux.dart';
import 'package:learning_flutter/redux/todolist_state.dart';

class SearchMiddleware implements MiddlewareClass<TodoListState> {
  @override
  void call(Store<TodoListState> store, dynamic action, NextDispatcher next) {
    if (action is TodoListState) {

    }

    next(action);
  }
}