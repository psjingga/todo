import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/modules/task/controllers/task_controller.dart';

class ButtonTask extends StatefulWidget {
  const ButtonTask({super.key});

  @override
  State<ButtonTask> createState() => _ButtonTaskState();
}

class _ButtonTaskState extends State<ButtonTask> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final messageController = TextEditingController();

    final TaskController c = Get.put(TaskController());

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Get.dialog(
          Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Add Task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Message'),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => Get.back(),
                          child: Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            if (titleController.text.isNotEmpty) {
                              c.addTask(titleController.text, messageController.text);
                              titleController.clear();
                              messageController.clear();
                              Get.back();
                            }
                          },
                          child: Text("Add Task", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
