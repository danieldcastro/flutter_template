class ApiPath {
  ApiPath._();

  static String join(
    String base, [
    List<String> segments = const [],
  ]) {
    final clean = <String>[
      ...base.split('/').where((e) => e.isNotEmpty),
      ...segments.map((e) => e.trim()).where((e) => e.isNotEmpty),
    ];

    return '/${clean.join('/')}';
  }
}
