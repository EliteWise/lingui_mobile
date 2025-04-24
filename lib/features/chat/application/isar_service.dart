import 'package:isar/isar.dart';
import 'package:lingui_mobile/features/chat/data/discussion.dart';
import 'package:path_provider/path_provider.dart';

import '../data/message.dart';

class IsarService {
  late Isar isar;

  Future<void> openIsarDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([DiscussionSchema, MessageSchema], directory: dir.path, inspector: true);
  }

  Future<void> putObject<T>(T object) async {
    isar.writeTxn(() async {
      isar.collection<T>().put(object);
    });
  }

  Future<void> deleteObject<T>(T object, id) async {
    isar.writeTxn(() async {
      isar.collection<T>().delete(id);
    });
  }

  Future<T?> getObject<T>(Id id) async {
    return await isar.collection<T>().get(id);
  }

  Future<List<T>> getAllObjects<T>() async {
    return await isar.collection<T>().where().findAll();
  }
}