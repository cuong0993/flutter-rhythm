import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'firebase_http_file_service.dart';

class FirebaseCacheManager extends CacheManager {
  factory FirebaseCacheManager.getInstance() => _instance;

  FirebaseCacheManager._()
      : super(Config('firebaseCache', fileService: FirebaseHttpFileService()));

  static final FirebaseCacheManager _instance = FirebaseCacheManager._();
}
