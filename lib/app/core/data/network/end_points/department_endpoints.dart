import 'package:graduation/app/core/data/network/network_config.dart';

class DepartmentEndpoints{
static  String getAll =NetworkConfig.getFulApiUrl('/department');
static  String create =NetworkConfig.getFulApiUrl('/department');
static  String getDepartmentById =NetworkConfig.getFulApiUrl('/department/');
}