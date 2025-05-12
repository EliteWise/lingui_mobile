import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageService {

  final Storage storage;

  ImageService({required this.storage});

  Future<String> uploadProfileImage(String imagePath) async {
    final file = await storage.createFile(
        bucketId: 'lingui_bucket',
        fileId: ID.unique(),
        file: InputFile.fromPath(path: imagePath)
    );

    final fileUrl = '${dotenv.env['APPWRITE_ENDPOINT']}/storage/buckets/${file.bucketId}/files/${file.$id}/view';

    return fileUrl;
  }
}