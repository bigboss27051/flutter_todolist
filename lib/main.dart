import 'package:flutter/material.dart';
import 'package:learning_flutter/redux/app_state.dart';
import 'package:learning_flutter/redux/todoAction.dart';
import 'package:learning_flutter/redux/todolist_state.dart';
import 'todolist.dart';
import 'todo_model.dart';
import 'redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final store =
      new Store<AppState>(appReducer, initialState: AppState.initial());

  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Todo App',
        theme: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, MyHomePageViewModel>(
        converter: (store) {
      return MyHomePageViewModel(
        state: store.state,
        onAddTask: (todo) =>
            store.dispatch(AddTodoAction(Todo(todo: todo, isComplete: false))),
      );
    }, builder: (BuildContext context, MyHomePageViewModel vm) {
      return new Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Center(
          child: Center(
            child: TodoList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new Scaffold(
                  appBar: new AppBar(title: new Text('Add a new task')),
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      vm.onAddTask(val);
                      Navigator.pop(context); // Close the add todo screen
                    },
                    decoration: new InputDecoration(
                        hintText: 'Enter something to do...',
                        contentPadding: const EdgeInsets.all(16.0)),
                  ));
            }))
          },
          tooltip: 'Add Task',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}

class MyHomePageViewModel {
  final AppState state;
  final void Function(String todo) onAddTask;

  MyHomePageViewModel({this.state, this.onAddTask});
}
