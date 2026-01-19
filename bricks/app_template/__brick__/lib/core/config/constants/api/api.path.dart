import 'external_uris.dart';

class ApiPath {
  ApiPath._();

  static Uri _joinUri(Uri base, Iterable<String> segments) =>
      base.replace(pathSegments: [...base.pathSegments, ...segments]);

  static final Uri posts = _joinUri(ExternalUris.jsonPlaceHolder, ['posts']);
}
