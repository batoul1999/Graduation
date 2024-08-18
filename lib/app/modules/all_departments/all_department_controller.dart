import 'package:graduation/app/core/data/models/apis/departments_models/get_department_by_id_model.dart';
import 'package:graduation/app/core/data/repositories/departments_repository.dart';
import 'package:graduation/app/core/enums/message_type.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:graduation/global/custom_widgets/custom_toast.dart';

class AllDepartmentController extends BaseController {
  GetDepartmentByIdModel departmentModel = GetDepartmentByIdModel();
  @override
  void onInit() {
    getAllDepartments();
    super.onInit();
  }

  bool get isAllDepartmentsLoading =>
      requestStatus.value == RequestStatus.loading &&
      listType.contains(OperationType.getAllDepartments);

  Future<void> loadDepartments() async {
    await runLoadingFutureFunction(
        type: OperationType.getAllDepartments, function: getAllDepartments());
  }

  Future<void> getDepartmentById({required int id}) async {
    await runFullLoadingFutureFunction(
        function:
            DepartmentsRepository().getDepartmentById(id: id).then((value) {
      if (value.$1 != null) {
        CustomToast.showMessage(
            message: value.$1!, messagetype: MessageType.rejected);
      } else if (value.$2 != null) {
        departmentModel = value.$2!;
      }
    }));
  }
}
