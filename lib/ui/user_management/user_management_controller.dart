import 'package:get/get.dart';
import 'package:graduation/core/data/models/admin/get_all_users_model.dart';
import 'package:graduation/core/data/repositories/users_repository.dart';
import 'package:image_picker/image_picker.dart';

class UserManagementController extends GetxController {
  RxList<GetAllUsersModel> usersList =<GetAllUsersModel>[].obs;

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }

  

  void getAllUsers(){
    usersList.clear();
      UsersRepository().getAllUsers().then((value){
      if(value.$1!= null ){
        print(value.$1);
      }else if(value.$2!= null){
        usersList.addAll(value.$2!);
        print('success');
        
      }
    });
     }

      void deleteUser({required int userId}){
      UsersRepository().deleteUser(userId: userId).then((value){
      if(value.$1!= null ){
        print(value.$1);
      }else if(value.$2!= null){
        print(value.$2!.message);
        getAllUsers();
      }
    });
     }

 XFile? image;

  Future<void> getImage({required bool isCamera}) async {
    if (isCamera) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
  }

} 

