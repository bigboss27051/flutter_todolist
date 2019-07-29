import 'app_state.dart';
import 'todoListReducer.dart';

AppState appReducer(AppState state, action) =>
    AppState(toDoListReducer(state.todoList, action));
