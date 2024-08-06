import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_departments_model/get_all_departments_model.dart';
import 'package:graduation/app/core/data/models/apis/get_all_tasks_moel/get_all_tasks_model.dart';
import 'package:graduation/app/core/enums/operation_type.dart';
import 'package:graduation/app/core/enums/request_status.dart';
import 'package:graduation/app/core/services/base_controller.dart';

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
    tasksList.addAll(GetAllTasksModel.fromJson(tasksMap).tasks!);
    success.value = true;
  }

  RxList<Departments> departmentsList = <Departments>[].obs;
  void getAllDepartments() {
    departmentsList.clear();
    departmentsList
        .addAll(GetAllDepartmentsModel.fromJson(departmentsMap).departments!);
    success.value = true;
  }

  void filterTasksByDepartment({required String department}) {
    filteredTasksList.clear();
    filteredTasksList.addAll(
        tasksList.where((task) => task.currentDepartment == department));
  }

  Map<String, dynamic> departmentsMap = {
    "departments": [
      {
        "id": 1,
        "name": "الديوان",
        "description":
            "هذا القسم مسؤول عن جدولة وتأريخ الطلبات المتقدمة الى الكلية",
        "pending_tasks_count": 10,
        "finished_tasks_count": 6,
        "rejected_tasks_count": 3,
        "employess": [
          {"name": "علي حاتم", "id": 1},
          {"name": "محمد احمد", "id": 2}
        ]
      },
      {
        "id": 2,
        "name": "الامتحانات",
        "description": "هذا القسم مسؤول عن إدارة جميع الامتحانات في الكلية",
        "pending_tasks_count": 5,
        "finished_tasks_count": 12,
        "rejected_tasks_count": 1,
        "employess": [
          {"name": "سارة علي", "id": 3},
          {"name": "احمد خالد", "id": 4}
        ]
      },
      {
        "id": 3,
        "name": "الشؤون",
        "description": "هذا القسم مسؤول عن جميع الأمور الإدارية للطلبة",
        "pending_tasks_count": 8,
        "finished_tasks_count": 9,
        "rejected_tasks_count": 2,
        "employess": [
          {"name": "محمد احمد", "id": 2},
          {"name": "علي حاتم", "id": 1}
        ]
      },
      {
        "id": 4,
        "name": "مكتب العمادة",
        "description": "هذا القسم مسؤول عن جميع الأمور الأكاديمية للكلية",
        "pending_tasks_count": 3,
        "finished_tasks_count": 7,
        "rejected_tasks_count": 0,
        "employess": [
          {"name": "سارة علي", "id": 3},
          {"name": "احمد خالد", "id": 4}
        ]
      },
      {
        "id": 5,
        "name": "الامن",
        "description": "هذا القسم مسؤول عن أمن الكلية",
        "pending_tasks_count": 1,
        "finished_tasks_count": 3,
        "rejected_tasks_count": 0,
        "employess": [
          {"name": "علي حاتم", "id": 1},
          {"name": "محمد احمد", "id": 2}
        ]
      },
      {
        "id": 6,
        "name": "مكتب العلاقات العامة",
        "description": "هذا القسم مسؤول عن العلاقات العامة للكلية",
        "pending_tasks_count": 0,
        "finished_tasks_count": 2,
        "rejected_tasks_count": 0,
        "employess": [
          {"name": "سارة علي", "id": 3},
          {"name": "احمد خالد", "id": 4}
        ]
      }
    ]
  };

  Map<String, dynamic> tasksMap = {
    "tasks": [
      {
        "id": 1,
        "name": "طلب مصدقة تأجيل",
        "description":
            "هذا الطلب يستخدم لمنح مصدقة دراسية للطالب للحصول على تأجيل دراسي من شعبة التجنيد التابع لها",
        "issuedDate": "2023-08-15",
        "status": "قيد المراجعة",
        "current_department": "الامتحانات",
        "current_employee": "علي حاتم",
        "previous_departments": [
          {"name": "الشؤون", "id": 1}
        ],
        "next_departments": [
          {"name": "الديوان", "id": 3},
          {"name": "مكتب العمادة", "id": 4}
        ]
      },
      {
        "id": 2,
        "name": "طلب استئناف",
        "description":
            "هذا الطلب يستخدم لطلب استئناف على قرار سابق من قبل الجامعة.",
        "issuedDate": "2023-09-01",
        "status": "مرفوض",
        "current_department": "الديوان",
        "current_employee": "محمد احمد",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2}
        ],
        "next_departments": [
          {"name": "مكتب العمادة", "id": 4}
        ]
      },
      {
        "id": 3,
        "name": "طلب نقل",
        "description": "هذا الطلب يستخدم لنقل الطالب من قسم الى قسم اخر.",
        "issuedDate": "2023-10-10",
        "status": "قيد الانتظار",
        "current_department": "الشؤون",
        "current_employee": "سارة علي",
        "previous_departments": [
          {"name": "مكتب العمادة", "id": 3}
        ],
        "next_departments": [
          {"name": "الامتحانات", "id": 2},
          {"name": "الديوان", "id": 3}
        ]
      },
      {
        "id": 4,
        "name": "طلب تصحيح علامات",
        "description": "هذا الطلب يستخدم لطلب تصحيح علامات الامتحان.",
        "issuedDate": "2023-11-05",
        "status": "مُنجز",
        "current_department": "الامتحانات",
        "current_employee": "علي حاتم",
        "previous_departments": [
          {"name": "الشؤون", "id": 1},
          {"name": "الديوان", "id": 3}
        ],
        "next_departments": []
      },
      {
        "id": 5,
        "name": "طلب سحب من الجامعة",
        "description": "هذا الطلب يستخدم لسحب الطالب من الجامعة.",
        "issuedDate": "2023-12-15",
        "status": "قيد المراجعة",
        "current_department": "مكتب العمادة",
        "current_employee": "محمد احمد",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2},
          {"name": "الديوان", "id": 3},
          {"name": "الشؤون", "id": 1}
        ],
        "next_departments": []
      },
      {
        "id": 6,
        "name": "طلب منحة",
        "description": "هذا الطلب يستخدم لطلب الحصول على منحة دراسية.",
        "issuedDate": "2023-08-20",
        "status": "مرفوض",
        "current_department": "الديوان",
        "current_employee": "سارة علي",
        "previous_departments": [
          {"name": "الشؤون", "id": 1}
        ],
        "next_departments": []
      },
      {
        "id": 7,
        "name": "طلب تغير تخصص",
        "description": "هذا الطلب يستخدم لطلب تغير تخصص الطالب.",
        "issuedDate": "2023-09-15",
        "status": "مُنجز",
        "current_department": "الشؤون",
        "current_employee": "علي حاتم",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2}
        ],
        "next_departments": [
          {"name": "الديوان", "id": 3},
          {"name": "مكتب العمادة", "id": 4}
        ]
      },
      {
        "id": 8,
        "name": "طلب تسجيل مواد",
        "description": "هذا الطلب يستخدم لتسجيل الطالب للمواد الدراسية.",
        "issuedDate": "2023-10-25",
        "status": "قيد الانتظار",
        "current_department": "الامتحانات",
        "current_employee": "محمد احمد",
        "previous_departments": [
          {"name": "الشؤون", "id": 1},
          {"name": "الديوان", "id": 3}
        ],
        "next_departments": []
      },
      {
        "id": 9,
        "name": "طلب الحصول على شهادة",
        "description": "هذا الطلب يستخدم للحصول على شهادة من الجامعة.",
        "issuedDate": "2023-11-10",
        "status": "قيد المراجعة",
        "current_department": "مكتب العمادة",
        "current_employee": "سارة علي",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2}
        ],
        "next_departments": []
      },
      {
        "id": 10,
        "name": "طلب تصحيح خطأ في بيانات الطالب",
        "description":
            "هذا الطلب يستخدم لتصحيح خطأ في بيانات الطالب المسجلة في الجامعة.",
        "issuedDate": "2023-12-01",
        "status": "مُنجز",
        "current_department": "الشؤون",
        "current_employee": "علي حاتم",
        "previous_departments": [
          {"name": "الديوان", "id": 3}
        ],
        "next_departments": []
      },
      {
        "id": 11,
        "name": "طلب الحصول على تصريح دخول",
        "description":
            "هذا الطلب يستخدم للحصول على تصريح دخول الى حرم الجامعة.",
        "issuedDate": "2023-08-10",
        "status": "قيد المراجعة",
        "current_department": "الامن",
        "current_employee": "احمد خالد",
        "previous_departments": [
          {"name": "الشؤون", "id": 1}
        ],
        "next_departments": []
      },
      {
        "id": 12,
        "name": "طلب الحصول على بطاقة طالب",
        "description": "هذا الطلب يستخدم للحصول على بطاقة طالب الجامعة.",
        "issuedDate": "2023-09-05",
        "status": "مُنجز",
        "current_department": "الشؤون",
        "current_employee": "محمد احمد",
        "previous_departments": [
          {"name": "الديوان", "id": 3}
        ],
        "next_departments": []
      },
      {
        "id": 13,
        "name": "طلب الحصول على وثيقة التخرج",
        "description": "هذا الطلب يستخدم للحصول على وثيقة التخرج من الجامعة.",
        "issuedDate": "2023-10-15",
        "status": "قيد الانتظار",
        "current_department": "مكتب العمادة",
        "current_employee": "سارة علي",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2},
          {"name": "الشؤون", "id": 1}
        ],
        "next_departments": []
      },
      {
        "id": 14,
        "name": "طلب الحصول على شهادة دراسية",
        "description": "هذا الطلب يستخدم للحصول على شهادة دراسية من الجامعة.",
        "issuedDate": "2023-11-20",
        "status": "قيد المراجعة",
        "current_department": "الامتحانات",
        "current_employee": "علي حاتم",
        "previous_departments": [
          {"name": "الديوان", "id": 3}
        ],
        "next_departments": []
      },
      {
        "id": 15,
        "name": "طلب الحصول على تصريح سفر",
        "description": "هذا الطلب يستخدم للحصول على تصريح سفر من الجامعة.",
        "issuedDate": "2023-12-05",
        "status": "مرفوض",
        "current_department": "الشؤون",
        "current_employee": "محمد احمد",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2},
          {"name": "مكتب العمادة", "id": 4}
        ],
        "next_departments": []
      },
      {
        "id": 16,
        "name": "طلب الحصول على معلومات عن الجامعة",
        "description":
            "هذا الطلب يستخدم للحصول على معلومات عن الجامعة مثل البرامج الدراسية والرسوم الدراسية.",
        "issuedDate": "2023-08-05",
        "status": "مُنجز",
        "current_department": "مكتب العلاقات العامة",
        "current_employee": "احمد خالد",
        "previous_departments": [],
        "next_departments": []
      },
      {
        "id": 17,
        "name": "طلب الحصول على نسخة من الوثائق",
        "description":
            "هذا الطلب يستخدم للحصول على نسخة من الوثائق الرسمية الخاصة بالطالب.",
        "issuedDate": "2023-09-10",
        "status": "قيد الانتظار",
        "current_department": "الشؤون",
        "current_employee": "سارة علي",
        "previous_departments": [
          {"name": "الديوان", "id": 3},
          {"name": "الامتحانات", "id": 2}
        ],
        "next_departments": []
      },
      {
        "id": 18,
        "name": "طلب الحصول على قرض دراسي",
        "description": "هذا الطلب يستخدم لطلب الحصول على قرض دراسي من الجامعة.",
        "issuedDate": "2023-10-20",
        "status": "قيد المراجعة",
        "current_department": "الديوان",
        "current_employee": "علي حاتم",
        "previous_departments": [
          {"name": "الشؤون", "id": 1}
        ],
        "next_departments": []
      },
      {
        "id": 19,
        "name": "طلب الحصول على خدمة توصيل",
        "description":
            "هذا الطلب يستخدم لطلب الحصول على خدمة توصيل من قبل الجامعة.",
        "issuedDate": "2023-11-15",
        "status": "مُنجز",
        "current_department": "الشؤون",
        "current_employee": "محمد احمد",
        "previous_departments": [
          {"name": "الامتحانات", "id": 2},
          {"name": "مكتب العمادة", "id": 4}
        ],
        "next_departments": []
      },
      {
        "id": 20,
        "name": "طلب الحصول على معلومات عن وظائف",
        "description":
            "هذا الطلب يستخدم للحصول على معلومات عن الوظائف المتاحة في الجامعة.",
        "issuedDate": "2023-12-10",
        "status": "قيد الانتظار",
        "current_department": "الشؤون",
        "current_employee": "سارة علي",
        "previous_departments": [
          {"name": "الديوان", "id": 3},
          {"name": "الامتحانات", "id": 2}
        ],
        "next_departments": []
      }
    ]
  };
}
