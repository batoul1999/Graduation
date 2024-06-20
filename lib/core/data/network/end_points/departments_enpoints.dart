import 'package:graduation/core/data/network/Network_Config.dart';

class DepartmentsEndpoints {
  static String createDepartment =
      NetworkConfig.getFulApiUrl('admin/departments');
  static String updateDepartment =
      NetworkConfig.getFulApiUrl('admin/departments/');
  static String deleteDepartment =
      NetworkConfig.getFulApiUrl('admin/departments/');
  static String getAllDepartments =
      NetworkConfig.getFulApiUrl('admin/departments');
}