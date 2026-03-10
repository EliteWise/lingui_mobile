import 'package:drift/drift.dart';

class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get senderId => text()();
  TextColumn get receiverId => text()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  TextColumn get type => text().withDefault(const Constant('text'))();
  TextColumn? get attachments => text().nullable()(); // JSON encoded List<String>
}