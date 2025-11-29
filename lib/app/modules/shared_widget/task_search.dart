import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../task/controllers/task_controller.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TaskController c = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    TextEditingController searchC = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(left: Get.height * 0.02, right: Get.height * 0.02),
      child: Obx(() {
        return TextField(
          controller: searchC,
          onChanged: (value) => c.searchQuery.value = value,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: c.searchQuery.value.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      c.searchQuery.value = '';
                      searchC.clear();
                    },
                  )
                : null,
            hintText: 'Search tasks...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );
      }),
    );
  }
}
