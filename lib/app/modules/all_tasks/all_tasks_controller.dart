import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/departments_models/get_all_departments_model.dart';
import 'package:graduation/app/core/data/models/apis/task_models/get_all_tasks_model.dart';
import 'package:graduation/app/core/data/models/apis/task_models/get_task_by_id.dart';
import 'package:graduation/app/core/data/repositories/task_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class AllTasksController extends BaseController {
  @override
  onInit() async {
    await getAllTasks();
    await getAllDepartments();
    super.onInit();
  }

  RxBool isFiltered =false.obs;

  bool get isTasksLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllTasks);

  bool get isDepartmentsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllDepartments);

  RxList<Task> filteredTasksList = <Task>[].obs;
  RxList<Task> tasksList = <Task>[].obs;
  void filterTasksByDepartment({required Departments department}) {
    filteredTasksList.clear();
    filteredTasksList
        .addAll(tasksList.where((task) => task.id == department.id));
  }

  Future<void> getAllTasks() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllTasks,
        function: TaskRepository().getAllTasks().then((value) {
          if (value.$1 != null) {
            CustomToast.showMessage(
                message: value.$1!, messagetype: MessageType.rejected);
          } else if (value.$2 != null) {
            tasksList.clear();
            tasksList.addAll(value.$2!.data!);
          }
        }));
  }
   GetTaskByIdModel taskModel=GetTaskByIdModel();
   Future<void> getDepartmentById({required int id}) async{
    await runFullLoadingFutureFunction(
      function: TaskRepository().getTaskById(id: id).then((value){
       if(value.$1!=null){
        CustomToast.showMessage(message: value.$1!,messagetype:MessageType.rejected);
       }else if(value.$2!=null){
       taskModel = value.$2!;
       }
      }
    ));
  
}
}
