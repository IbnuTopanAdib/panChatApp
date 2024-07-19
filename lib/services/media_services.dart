import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MediaServices {
  final ImagePicker _picker = ImagePicker();
  MediaServices() {}

  Future<File?> getImageFromGallery() async {
    final XFile? _file = await _picker.pickImage(source: ImageSource.gallery);

    if (_file != null) {
      return File(_file!.path);
    }
    return null;
  }
}
