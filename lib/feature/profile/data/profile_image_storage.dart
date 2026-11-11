import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ProfileImageStorage {
  static const String _fileName = 'profile_image';
  static const String _pathFileName = 'profile_image_path.txt';

  Future<String> saveImage(String sourcePath) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File target = File('${directory.path}/$_fileName${_extensionOf(sourcePath)}');
    final File pathFile = File('${directory.path}/$_pathFileName');
    if (await pathFile.exists()) {
      final String oldPath = (await pathFile.readAsString()).trim();
      if (oldPath.isNotEmpty && oldPath != target.path) {
        final File oldFile = File(oldPath);
        if (await oldFile.exists()) {
          await oldFile.delete();
        }
      }
    }
    await File(sourcePath).copy(target.path);
    await pathFile.writeAsString(target.path);
    return target.path;
  }

  Future<String?> loadImagePath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File pathFile = File('${directory.path}/$_pathFileName');
    if (!await pathFile.exists()) return null;
    final String savedPath = (await pathFile.readAsString()).trim();
    if (savedPath.isEmpty) return null;
    if (!await File(savedPath).exists()) return null;
    return savedPath;
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
