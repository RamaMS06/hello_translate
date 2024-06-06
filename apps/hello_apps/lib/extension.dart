import 'dart:convert';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

/// Combines the results of multiple loaders.
class MultiAssetLoader extends AssetLoader {
  /// The loaders. Results from latter loaders get merged or overwrite
  /// the results from the earlier ones.
  // https://github.com/aissat/easy_localization/issues/524
  final List<dynamic> loaders;

  const MultiAssetLoader(this.loaders);

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final futures = <Future<Map<String, dynamic>?>>[];
    final result = <String, dynamic>{};

    for (final loader in loaders) {
      // ignore: avoid_dynamic_calls
      futures.add(loader.load(path, locale));
    }

    final maps = await Future.wait(futures);

    maps.whereNotNull().forEach(result.addAllRecursive);
    return result;
  }
}

/// Loads a YAML file.
class JsonCustomAssetLoader extends AssetLoader {
  /// The package name, null for non-package assets.
  final String? package;

  /// The directory for YAML files, from the [package] or app root.
  final String directory;

  // ignore: public_member_api_docs
  const JsonCustomAssetLoader({
    required this.directory,
    this.package,
  });

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Map<String, dynamic>> load(String basePath, Locale locale) async {
    final localePath = getFilePath(locale, basePath: basePath);
    return jsonDecode(await rootBundle.loadString(localePath));
  }

  /// Returns the file path for the locale.
  String getFilePath(Locale locale, {required String basePath}) {
    if (package == null) {
      return '$directory/$locale.json';
    }
    return 'packages/$package/$directory/$locale.json';
  }
}