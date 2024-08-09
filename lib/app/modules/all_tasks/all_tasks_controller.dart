import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_departments_model/get_all_departments_model.dart';
import 'package:graduation/app/core/data/models/apis/get_all_tasks_moel/get_all_tasks_model.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/shared/maps_data.dart';

class AllTasksController extends BaseController {
  @override
  onInit() async {
    await loadTasks();
    await loadDepartments();
    super.onInit();
  }

  bool get isTasksLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllTasks);

  bool get isDepartmentsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllDepartments);

  Future<void> loadTasks() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllTasks,
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => getAllTasks()));
  }

  Future<void> loadDepartments() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllDepartments,
        function: Future.delayed(const Duration(seconds: 5))
            .then((value) => getAllDepartments()));
  }

  RxList<Tasks> tasksList = <Tasks>[].obs;
  RxList<Tasks> filteredTasksList = <Tasks>[].obs;
  RxBool isFiltered = false.obs;
  void getAllTasks() {
    tasksList.clear();
    tasksList.addAll(GetAllTasksModel.fromJson(MapsData.tasksMap).tasks!);
    success.value = true;
  }

  RxList<Departments> departmentsList = <Departments>[].obs;
  void getAllDepartments() {
    departmentsList.clear();
    departmentsList.addAll(
        GetAllDepartmentsModel.fromJson(MapsData.departmentsMap).departments!);
    success.value = true;
  }

  void filterTasksByDepartment({required String department}) {
    filteredTasksList.clear();
    filteredTasksList.addAll(
        tasksList.where((task) => task.currentDepartment == department));
  }
}
