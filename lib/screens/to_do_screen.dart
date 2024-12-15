import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_crud/models/todo.dart';
import 'package:riverpod_api_crud/provider/to_do_list_provider.dart';

class ToDoScreen extends ConsumerStatefulWidget {
  const ToDoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends ConsumerState<ToDoScreen> {
  late AsyncValue<List<Todo>> _todoList;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD To-Do List'),
      ),
      body: getBody(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(todoListProvider.notifier).addTodo(
                            Todo(description: _descriptionController.text));
                        _descriptionController.clear();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 30.0),
                      ),
                      child: const Text('Add'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getBody(BuildContext context) {
    _todoList = ref.watch(todoListProvider);

    if (_todoList.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_todoList.hasError) {
      return Center(
        child: Card(
          elevation: 3,
          color: Theme.of(context).colorScheme.errorContainer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ops! algo de errado não está certo",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                _todoList.error.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )
            ],
          ),
        ),
      );
    } else {
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
