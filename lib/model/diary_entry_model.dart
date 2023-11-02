import 'package:hive/hive.dart';

part 'diary_entry_model.g.dart'; // This part file is generated by Hive

@HiveType(typeId: 0)
class DiaryEntry extends HiveObject {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final int rating;

  DiaryEntry({
    required this.date,
    required this.content,
    required this.rating,
  });
}
