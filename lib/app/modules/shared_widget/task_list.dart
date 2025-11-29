import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/modules/shared_widget/task_update_dialog.dart';
import '../task/controllers/task_controller.dart';

class ListTask extends StatefulWidget {
  final int id;
  final String? title;
  final String? message;
  final String time;
  final IconData? icon;
  final Color color;
  final Color? nextColor;
  final String status;
  final Function()? onTap;

  const ListTask({
    super.key,
    this.title,
    this.message,
    required this.time,
    required this.color,
    this.nextColor,
    this.icon,
    required this.status,
    required this.id,
    this.onTap,
  });

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  final TaskController c = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = c.filteredTasks;
      if (list.isEmpty) {
        return Center(child: Text('No tasks found.'));
      }
      return GestureDetector(
        onTap: () {
          print(widget.message);
          AppUpdateDialog.dialog(
            icon: Icons.info,
            color: Colors.deepOrange,
            title: 'Update Task?',
            message: widget.status == 'pending'
                ? "Task akan diubah menjadi On Progress"
                : widget.status == 'inprogress'
                ? "Apakah anda yakin task ini sudah selesai.?"
                : "Task ini sudah selesai.",
            confirmText: widget.status == 'pending' || widget.status == 'inprogress' ? 'Ya, Update' : "Oke",
            cancelText: 'Cancel',
            onTap: widget.onTap,
          );
        },
        child: Container(
          color: widget.nextColor,
          child: Container(
            padding: EdgeInsets.all(Get.height * 0.04),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff9cadce), widget.color, widget.color], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80.0)),
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 20, offset: Offset(-4, 6))],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 20,
                  child: Icon(widget.icon, size: Get.height * 0.08, color: Colors.white.withValues(alpha: 0.2)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.time, style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(
                      widget.title!.length > 30 ? "${widget.title!.substring(0, 30)}..." : widget.title!,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      child: Text(
                        widget.message!.length > 30 ? "${widget.message!.substring(0, 30)}..." : widget.message!,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(radius: 12, backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5")),
                        const CircleAvatar(radius: 12, backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12")),
                        SizedBox(width: 10),
                        Text("join Marie, John & 10 others", style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
