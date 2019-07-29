import 'package:flutter/material.dart';
import 'todo_model.dart';
import 'redux/app_state.dart';
import 'redux/todoAction.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, TodoListViewModel>(
        converter: (store) {
      return TodoListViewModel(
        state: store.state,
        onDeleteTask: (indexToDelete) =>
            store.dispatch(DeleteTodoAction(indexToDelete)),
        onCompleteTask:  (indexToComplete) => 
            store.dispatch(CompleteTodoAction(indexToComplete)),
      );
    },
    builder: (BuildContext context, TodoListViewModel vm) {
     return new Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: vm.state.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(children: <Widget>[
            new FlatButton(
              onPressed: () {
               vm.onCompleteTask(index);
              },
              child: Text(
                 vm.state.todoList[index].todo,
                style:  vm.state.todoList[index].isComplete
                    ? TextStyle(
                        color: Colors.green.withOpacity(1.0), fontSize: 22)
                    : TextStyle(
                        color: Colors.black.withOpacity(1.0), fontSize: 22),
              ),
            ),
            new RaisedButton(
              onPressed: () {
               vm.onDeleteTask(index);
              },
              textColor: Colors.white,
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Delete Task",
              ),
            )
          ]);
        },
      ),
    );
    }
    );
}
}

class TodoListViewModel {
  final AppState state;
  final void Function(int indexToDelete) onDeleteTask;
  final void Function(int indexToComplete) onCompleteTask;

  TodoListViewModel({this.state, this.onDeleteTask, this.onCompleteTask});
}
