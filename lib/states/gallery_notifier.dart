import 'package:flutter_riverpod/flutter_riverpod.dart';

final galleryNotifier = StateNotifierProvider<GalleryNotifier, String>((ref) {
  return GalleryNotifier();
});

class GalleryNotifier extends StateNotifier<String> {
  GalleryNotifier() : super('');

  void setView(String view) {
    state = view;
  }
}