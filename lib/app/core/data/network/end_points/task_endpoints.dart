import 'package:graduation/app/core/data/network/network_config.dart';

class TaskEndpoints{
static  String getAll =NetworkConfig.getFulApiUrl('/posts');
static  String getById =NetworkConfig.getFulApiUrl('/posts/');
static  String create =NetworkConfig.getFulApiUrl('/posts');
}