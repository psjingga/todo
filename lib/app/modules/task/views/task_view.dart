import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/modules/shared_widget/task_button.dart';

import '../../shared_widget/task_list.dart';
import '../../shared_widget/task_filter.dart';
import '../../shared_widget/task_search.dart';
import '../../shared_widget/top_circle.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  TaskView({super.key});

  final TaskController c = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopCircleMenu(),
            Search(),
            SizedBox(height: 8),
            FilterTask(),
            SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                final list = c.filteredTasks;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final task = list[index];
                    return ListTask(
                      time: task.createdAtHive.toString(),
                      color: task.statusHive == 'pending'
                          ? Colors.blue
                          : task.statusHive == 'inprogress'
                          ? Colors.orange
                          : Colors.green,
                      status: task.statusHive,
                      id: task.idHive,
                      message: task.messageHive,
                      icon: task.statusHive == 'pending'
                          ? Icons.pending_actions
                          : task.statusHive == 'inprogress'
                          ? Icons.hourglass_bottom
                          : Icons.check,
                      nextColor: Colors.black12,
                      title: task.titleHive,
                      onTap: () {
                        if (task.statusHive == 'pending') {
                          c.updateStatus(task, 'inprogress');
                        } else if (task.statusHive == 'inprogress') {
                          c.updateStatus(task, 'done');
                        }
                        Get.back();
                      },
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
      floatingActionButton: ButtonTask(),
    );
  }
}
