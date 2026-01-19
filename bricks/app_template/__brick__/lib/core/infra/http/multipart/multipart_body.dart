class MultipartFileData {
  MultipartFileData({
    required this.field,
    required this.bytes,
    required this.filename,
    this.contentType,
  });

  final String field;
  final List<int> bytes;
  final String filename;
  final String? contentType;
}

class MultipartBody {
  MultipartBody({this.fields = const {}, this.files = const []});

  final Map<String, String> fields;
  final List<MultipartFileData> files;
}
