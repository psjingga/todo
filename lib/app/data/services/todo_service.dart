import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../modules/shared_widget/dialog.dart';

import '../models/todos_model.dart';

class TodoService {
  Future<List<Todo>> fetchTodos() async {
    final url = Uri.parse("https://dummyjson.com/todos");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final body = json.decode(res.body);
      List data = body['todos']; // ambil list sebenarnya
      print(data);
      return data.map((e) => Todo.fromJson(e)).toList();
    }
    throw Exception("Gagal ambil data");
  }

  Future<void> updateTodo(int id, bool completed) async {
    final url = Uri.parse("https://dummyjson.com/todos/$id");
    final response = await http.put(url, headers: {"Content-Type": "application/json"}, body: jsonEncode({"completed": completed}));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Get.back();
      AppDialog.dialog(
        icon: Icons.update,
        title: "Update tugas",
        message: "Tugas berhasil diperbarui..",
        confirmText: "Oke",
        cancelText: "",
        color: Colors.blueAccent,
      );
      print("Update sukses: $data");
    } else {
      print("Gagal update: ${response.statusCode}");
    }
  }
}
