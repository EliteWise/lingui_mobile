// app_database.dart
import 'dart:io';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:lingui_mobile/features/chat/data/discussion.dart';
import 'package:lingui_mobile/features/chat/data/message.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_service.g.dart';

@DriftDatabase(tables: [Discussions, Messages])
class IsarService extends _$IsarService {
  IsarService() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ─── DISCUSSIONS ───────────────────────────────────────────

  Future<List<Discussion>> getAllDiscussions() =>
      select(discussions).get();

  Future<Discussion?> getDiscussion(int id) =>
      (select(discussions)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertDiscussion(DiscussionsCompanion entry) =>
      into(discussions).insert(entry);

  Future<bool> updateDiscussion(DiscussionsCompanion entry) =>
      update(discussions).replace(entry);

  Future<int> deleteDiscussion(int id) =>
      (delete(discussions)..where((t) => t.id.equals(id))).go();

  // ─── MESSAGES ──────────────────────────────────────────────

  Future<List<Message>> getAllMessages() =>
      select(messages).get();

  Future<List<Message>> getMessagesBySender(String senderId) =>
      (select(messages)..where((t) => t.senderId.equals(senderId))).get();

  Future<int> insertMessage(MessagesCompanion entry) =>
      into(messages).insert(entry);

  Future<bool> updateMessage(MessagesCompanion entry) =>
      update(messages).replace(entry);

  Future<int> deleteMessage(int id) =>
      (delete(messages)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}