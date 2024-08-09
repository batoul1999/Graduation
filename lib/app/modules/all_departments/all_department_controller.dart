import 'dart:developer';

import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_departments_model/get_all_departments_model.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/shared/maps_data.dart';

class AllDepartmentController extends BaseController{
 RxList<AllDepartments> departmentsList=<AllDepartments>[].obs;
  @override
  void onInit() {
    getAllDepartment();
    super.onInit();
  }
Future<void> getAllDepartment()async{
  departmentsList.clear();
  departmentsList.addAll(GetAllDepartmentsModel.fromJson(MapsData.departmentsMap).departments!);
  log('bbb');

}
 bool get isAllDepartmentsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllDepartments);

  Future<void> loadDepartments() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllDepartments,
        function: Future.delayed(const Duration(seconds: 3))
            .then((value) => getAllDepartment()));
  }
}