import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/models/task_model.dart';

enum SortType { titleAsc, titleDesc, statusAsc, statusDesc, dateNewest, dateOldest }

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var filterStatus = 'all'.obs;
  var searchQuery = ''.obs;
  var selectedSort = SortType.dateNewest.obs;

  late Box<Task> box;

  @override
  void onInit() {
    super.onInit();
    initHiveAsync();
  }

  Future<void> initHiveAsync() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    box = await Hive.openBox<Task>('tasks');
    tasks.assignAll(box.values.toList());
    sortData();
  }

  List<Task> get filteredTasks {
    List<Task> list = tasks.toList();

    // filter status
    if (filterStatus.value != 'all') {
      list = list.where((t) => t.statusHive == filterStatus.value).toList();
    }

    // search
    if (searchQuery.value.isNotEmpty) {
      list = list
          .where(
            (t) =>
                t.titleHive.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
                t.messageHive.toLowerCase().contains(searchQuery.value.toLowerCase()),
          )
          .toList();
    }

    return list;
  }

  void addTask(String title, String message) async {
    final task = Task(
      idHive: DateTime.now().millisecondsSinceEpoch,
      titleHive: title,
      messageHive: message,
      statusHive: "pending",
      createdAtHive: DateTime.now(),
    );
    await box.add(task);
    tasks.add(task);
    sortData();
  }

  void updateStatus(Task task, String status) {
    task.statusHive = status;
    task.save();
    tasks.refresh();
    sortData();
  }

  void deleteTask(Task task) {
    task.delete();
    tasks.remove(task);
  }

  void changeFilter(String status) {
    filterStatus.value = status;
  }

  void changeSort(SortType type) {
    selectedSort.value = type;
    sortData();
  }

  void sortData() {
    List<Task> data = tasks.toList();

    switch (selectedSort.value) {
      case SortType.titleAsc:
        data.sort((a, b) => a.titleHive.compareTo(b.titleHive));
        break;
      case SortType.titleDesc:
        data.sort((a, b) => b.titleHive.compareTo(a.titleHive));
        break;
      case SortType.statusAsc:
        data.sort((a, b) => a.statusHive.compareTo(b.statusHive));
        break;
      case SortType.statusDesc:
        data.sort((a, b) => b.statusHive.compareTo(a.statusHive));
        break;
      case SortType.dateNewest:
        data.sort((a, b) => b.createdAtHive.compareTo(a.createdAtHive));
        break;
      case SortType.dateOldest:
        data.sort((a, b) => a.createdAtHive.compareTo(b.createdAtHive));
        break;
    }

    tasks.assignAll(data);
  }
}
