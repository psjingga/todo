import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/modules/home/controllers/home_controller.dart';

class TopCircleMenu extends StatefulWidget {
  const TopCircleMenu({super.key});

  @override
  State<TopCircleMenu> createState() => _TopCircleMenuState();
}

class _TopCircleMenuState extends State<TopCircleMenu> {
  int selectedIndex = 0; // trending default

  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50), // radius seperti gambar
      ),
      margin: EdgeInsets.only(top: Get.height * 0.02),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _avatarMenu(),
          _menuItem(Icons.pending_actions, "TO DO", 0, Colors.blueAccent),
          _menuItem(Icons.hourglass_bottom, "ON PROGRESS", 1, Colors.orange),
          _menuItem(Icons.check, "DONE", 2, Colors.green),
        ],
      ),
    );
  }

  // Avatar + badge
  Widget _avatarMenu() {
    return Column(
      children: [
        Stack(
          children: [
            // Avatar
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.pink, width: 3),
              ),
              child: CircleAvatar(radius: 25, backgroundColor: Colors.grey[300], backgroundImage: const AssetImage("assets/images/avatar.png")),
            ),

            // Badge
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: const Text("12", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "YOU",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }

  // Circle icon + label
  Widget _menuItem(IconData icon, String title, int index, Color color) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        switch (index) {
          case 0:
            c.selectedStatus.value = 'all';
            break;
          case 1:
            c.selectedStatus.value = 'onprogress';
            break;
          case 2:
            c.selectedStatus.value = 'done';
            break;
          default:
            c.selectedStatus.value = 'all';
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isActive ? color : Colors.grey[300]!, width: 2),
              color: isActive ? color : Colors.white,
            ),
            child: Icon(icon, size: 26, color: isActive ? Colors.white : Colors.grey),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: isActive ? FontWeight.w900 : FontWeight.w400, color: isActive ? color : Colors.grey),
          ),
        ],
      ),
    );
  }
}
