import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ProfileImageStorage {
  Future<String> saveImage(String sourcePath, String accountId) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String safeId = _safeFileName(accountId);
    final File target = File('${directory.path}/profile_$safeId${_extensionOf(sourcePath)}');
    final File pathFile = File('${directory.path}/profile_${safeId}_path.txt');
    await File(sourcePath).copy(target.path);
    await pathFile.writeAsString(target.path);
    return target.path;
  }

  Future<String?> loadImagePath(String accountId) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String safeId = _safeFileName(accountId);
    final File pathFile = File('${directory.path}/profile_${safeId}_path.txt');
    if (!await pathFile.exists()) return null;
    final String savedPath = (await pathFile.readAsString()).trim();
    if (savedPath.isEmpty) return null;
    if (!await File(savedPath).exists()) return null;
    return savedPath;
  }

  String _safeFileName(String id) {
    return id.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
  }

  String _extensionOf(String path) {
    final int slash = path.lastIndexOf('/');
    final int backslash = path.lastIndexOf(r'\');
    final int separator = slash > backslash ? slash : backslash;
    final int dot = path.lastIndexOf('.');
    if (dot <= separator || dot == path.length - 1) return '.jpg';
    return path.substring(dot);
  }
}
