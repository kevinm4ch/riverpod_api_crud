import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_crud/models/todo.dart';
import 'package:riverpod_api_crud/service/todo_service.dart';

final todoListProvider =
    AsyncNotifierProvider.autoDispose<TodoList, List<Todo>>(
  TodoList.new,
);

class TodoList extends AutoDisposeAsyncNotifier<List<Todo>> {
  TodoService service = TodoService();

  @override
  FutureOr<List<Todo>> build() async {
    return await service.fetchTodoList();
  }

  Future<void> addTodo(Todo todo) async {
    //Faz um post que retorna um novo objeto que entao é adicionado ao estado atual
    //parece que esse é o jeito certi de fazer mas depende do que voce quer
    //var newTodo = await service.addTodo(todo);
    //var newData = [...state.value, newTodo];
    //state = AsyncData(newData);

    //Faz um post mas não retorna um objeto, ao invés disso marca o estado antigo como sujo fazendo uma nova requisicao get por meio do build
    await service.addTodo(todo);
    ref.invalidateSelf();
    //aguarda o novo get
    await future;
  }
}
