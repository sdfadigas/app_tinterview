import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  late File _image;

  Future<File?> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      return _image;
    }
    return null;
  }
}
