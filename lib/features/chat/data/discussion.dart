import 'package:drift/drift.dart';

class Discussions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get participants => text()(); // JSON encoded List<String>
  TextColumn get lastMessage => text()();
  DateTimeColumn get lastMessageTime => dateTime()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  TextColumn get type => text().withDefault(const Constant('individual'))();
  TextColumn? get imageUrl => text().nullable()();
}