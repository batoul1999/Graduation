
import 'package:file_picker/file_picker.dart';
import 'package:get/state_manager.dart';
import 'package:graduation/core/data/enum/file_type_enum.dart';
import 'package:image_picker/image_picker.dart';

class BaseController extends GetxController{
  RxString errorMessage ="".obs;
  final ImagePicker picker = ImagePicker();

  FileModel? selectedFile;

  get imageUrlController => null;

  Future<FileModel> pickFile(FileTypeEnum type) async {
    List<String> paths = [];
    switch (type) {
      case FileTypeEnum.CAMERA:
        final image = await picker.pickImage(source: ImageSource.camera);
        image != null ? paths.add(image.path) : null;

        break;
      case FileTypeEnum.GALLERY:
        final image = await picker.pickImage(source: ImageSource.gallery);
        image != null ? paths.add(image.path) : null;

        break;
      case FileTypeEnum.FILE:
        final files = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['pdf', 'png', 'jpeg', 'jpg', 'webp'],
        );
        files != null
            ? files.files.forEach((file) {
                if (file.extension == 'pdf' ||
                    file.extension == 'png' ||
                    file.extension == 'jpeg' ||
                    file.extension == 'jpg' ||
                    file.extension == 'webp') {
                  paths.add(file.path!);
                }
              })
            : null;
        break;
    }
    return paths.isNotEmpty
        ? FileModel(
            paths.isNotEmpty ? paths : selectedFile!.path,
            paths.isNotEmpty ? type : selectedFile!.type,
          )
        : FileModel([], type);
  }
}
class FileModel {
  FileTypeEnum type;
  List<String> path;

  FileModel(this.path, this.type);
}