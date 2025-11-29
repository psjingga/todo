import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  late int idHive;

  @HiveField(1)
  late String titleHive;

  @HiveField(2)
  late String messageHive;

  @HiveField(3)
  late String statusHive;

  @HiveField(4)
  late DateTime createdAtHive;

  Task({required this.idHive, required this.titleHive, required this.messageHive, required this.statusHive, required this.createdAtHive});
}
