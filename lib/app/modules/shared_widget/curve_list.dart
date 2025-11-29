import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dialog.dart';
import '../home/controllers/home_controller.dart';

class CurvedListItem extends StatelessWidget {
  final int id;
  final String? title;
  final String time;
  final IconData? icon;
  final String? people;
  final Color color;
  final Color? nextColor;
  final bool status;
  const CurvedListItem({
    super.key,
    this.title,
    required this.time,
    this.people,
    required this.color,
    this.nextColor,
    this.icon,
    required this.status,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        if (!status) {
          AppDialog.dialog(
            icon: Icons.warning,
            color: Colors.orange,
            title: "Selesai?",
            message: "Apakah anda yakin tugas $title sudah selesai.?",
            confirmText: "Ya, Selesaikan",
            cancelText: "Batal",
            onTap: () => c.updateTodo(id, true),
          );
        } else {
          AppDialog.dialog(
            color: Colors.green,
            icon: Icons.check_circle,
            title: "Tugas ini sudah selesai",
            message: "Tugas berhasil diselesaikan. Tidak ada aksi lanjutan yang diperlukan..",
            confirmText: "Oke",
            cancelText: "",
          );
        }
      },
      child: Container(
        color: nextColor,
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.04),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff9cadce), color, color], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80.0)),
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 20, offset: Offset(-4, 6))],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 20,
                child: Icon(icon, size: Get.height * 0.08, color: Colors.white.withValues(alpha: 0.2)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(time, style: TextStyle(color: Colors.white, fontSize: 12)),
                  const SizedBox(height: 2),
                  SizedBox(
                    height: 50,
                    child: Text(
                      title!.length > 30 ? "${title!.substring(0, 30)}..." : title!,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
  }
}
