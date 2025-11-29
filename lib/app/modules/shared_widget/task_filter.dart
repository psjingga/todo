import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../task/controllers/task_controller.dart';

class FilterTask extends StatefulWidget {
  const FilterTask({super.key});

  @override
  State<FilterTask> createState() => _FilterTaskState();
}

class _FilterTaskState extends State<FilterTask> {
  final TaskController c = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.height * 0.02, right: Get.height * 0.02),
      child: Row(
        children: [
          Text('Filtered By:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: Get.width * 0.05),
          Expanded(
            child: Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButton<SortType>(
                  isExpanded: true,
                  value: c.selectedSort.value,
                  onChanged: (value) {
                    if (value != null) c.changeSort(value);
                  },
                  items: [
                    DropdownMenuItem(value: SortType.titleAsc, child: Text('Title A-Z')),
                    DropdownMenuItem(value: SortType.titleDesc, child: Text('Title Z-A')),
                    // DropdownMenuItem(value: SortType.statusAsc, child: Text('Status A-Z')),
                    // DropdownMenuItem(value: SortType.statusDesc, child: Text('Status Z-A')),
                    DropdownMenuItem(value: SortType.dateNewest, child: Text('Newest First')),
                    DropdownMenuItem(value: SortType.dateOldest, child: Text('Oldest First')),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
