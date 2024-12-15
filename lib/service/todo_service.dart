import 'package:dio/dio.dart';
import 'package:riverpod_api_crud/models/todo.dart';

class TodoService {
  Dio dio = Dio();
  String baseUrl = 'http://localhost:8080/todo';

  Future<List<Todo>> fetchTodoList() async {
    try {
      Response response = await dio.request(
        baseUrl,
        options: Options(
          method: 'GET',
        ),
      );
      return List<Todo>.from(response.data.map((e) => Todo.fromJson(e)));
    } catch (e) {
      throw Exception("Erro ao carregar a lista de dados;\n\t$e");
    }
  }

  Future<Todo> addTodo(Todo todo) async {
    try {
      Response response = await dio.request(baseUrl,
          options: Options(
            method: 'POST',
          ),
          data: todo.toJson());

      return Todo.fromJson(response.data);
    } catch (e) {
      throw Exception("Erro ao adicionar um usuário;\n\t$e");
    }
  }
}
