import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_crud/models/todo.dart';
import 'package:riverpod_api_crud/provider/to_do_list_provider.dart';
import 'package:riverpod_api_crud/widgets/error_card.dart';

class ToDoScreen extends ConsumerStatefulWidget {
  const ToDoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends ConsumerState<ToDoScreen> {
  late AsyncValue<List<Todo>> _todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD To-Do List'),
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    //Inicia o provider
    //O primeiro get vai ser feito aqui
    _todoList = ref.watch(todoListProvider);

    if (_todoList.isLoading) {
      //Aqui é caso a requisicao esteja carregando
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_todoList.hasError) {
      //Caso tenha erro
      return ErrorCard(
              title: 'Ops! algo de errado não está certo',
              message: _todoList.error.toString(),
              onRetry: () {
      ref.invalidate(todoListProvider);
              },
            );
    } else {
      //caso tudo tenha dado certo e a requisicao não esteja mais carregando
      List<Todo> todoList = _todoList.value!;
      return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (ctx, i) {
          Todo todo = todoList[i];

          return ListTile(
            trailing: const Icon(Icons.check_circle_outline_outlined),
            title: Text(todo.description),
          );
        },
      );
    }
  }
}
