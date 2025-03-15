class Gallery {
  final int id;
  final String userId;
  final String albumId;
  final String fileName;
  final String s3Url;
  final DateTime uploadedAt;
  final String country;
  final int size;
  final String? mimeType;
  final int width;
  final int height;

  Gallery({
    required this.id,
    required this.userId,
    required this.albumId,
    required this.fileName,
    required this.s3Url,
    required this.uploadedAt,
    required this.country,
    required this.size,
    this.mimeType,
    required this.width,
    required this.height,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['id'],
      userId: json['user_id'],
      albumId: json['album_id'],
      fileName: json['file_name'],
      s3Url: json['s3_url'],
      uploadedAt: DateTime.parse(json['uploaded_at']),
      country: json['country'],
      size: json['size'],
      mimeType: json['mime_type'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'album_id': albumId,
      'file_name': fileName,
      's3_url': s3Url,
      'uploaded_at': uploadedAt.toIso8601String(),
      'country': country,
      'size': size,
      'mime_type': mimeType,
      'width': width,
      'height': height,
    };
  }
}
