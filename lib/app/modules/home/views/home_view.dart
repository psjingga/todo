import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../shared_widget/curve_list.dart';
import '../../shared_widget/top_circle.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopCircleMenu(),
            Expanded(
              child: Obx(() {
                if (c.todos.isEmpty) {
                  return const Center(child: Text("Tidak ada data"));
                } else {
                  var value;
                  if (c.selectedStatus == 'all') {
                    value = c.todos;
                  }
                  if (c.selectedStatus == 'done') {
                    value = c.done;
                  }
                  if (c.selectedStatus == 'onprogress') {
                    value = c.onprogress;
                  }
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (_, i) {
                      final t = value[i];
                      return CurvedListItem(
                        title: t.title,
                        time: 'TODAY 5:30 PM',
                        color: t.completed ? Colors.green : Colors.orange,
                        nextColor: Colors.black26,
                        icon: t.completed ? Icons.check : Icons.hourglass_bottom,
                        status: t.completed,
                        id: t.id,
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
