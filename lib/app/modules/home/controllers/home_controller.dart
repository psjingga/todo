import 'package:get/get.dart';

import '../../../data/models/todos_model.dart';
import '../../../data/services/todo_service.dart';

class HomeController extends GetxController {
  List todos = <Todo>[].obs;
  List done = <Todo>[].obs;
  List onprogress = <Todo>[].obs;
  var filteredTodos = <Todo>[].obs;

  var selectedStatus = "all".obs; // default → TO DO

  final service = TodoService();

  @override
  void onInit() {
    loadTodos();
    super.onInit();
  }

  Future<void> loadTodos() async {
    final data = await service.fetchTodos();
    todos.assignAll(data);
    done.assignAll(todos.where((t) => t.completed == true).toList());
    onprogress.assignAll(todos.where((t) => t.completed == false).toList());
  }

  Future<void> updateTodo(int id, bool status) async {
    await service.updateTodo(id, status);
    // await loadTodos(); /// Dimatikan karena data sama saja
  }
}
