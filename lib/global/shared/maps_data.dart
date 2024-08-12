class MapsData {
  static Map<String, dynamic> docsMap = {
    "documents": [
      {
        "id": 1,
        "name": "مصدقة تخرج",
        "body":
            "أرجو الموافقة على منحي مصدقة التخرج وعلما أني تخرجت نتيجة امتحانات الدورة الفصلية من العام الجامعي:",
        "departments": [
          {"id": 1, "name": "شعبة شؤون الطلاب"},
          {"id": 2, "name": "مكتب العميد"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "الرقم الجامعي",
          "القسم",
          "العام الدراسي",
        ]
      },
      {
        "id": 2,
        "name": "براءة ذمة",
        "body":
            "يعتبر الطالب بريءالذمة تجاه لدوائر التالية : 1_المدينة الامعية 2_الفرقة الحزبية المعلوماتية 3_مكتبة كلية الهندسة المعلوماتية 4_شعبة شؤون الطلاب",
        "departments": [
          {"id": 1, "name": "شعبة شؤون الطلاب"},
          {"id": 2, "name": "مكتب العميد"},
          {"id": 3, "name": "المدينة الجامعية"},
          {"id": 4, "name": "الفرقة الحزبية المعلوماتية"},
          {"id": 5, "name": "مكتبة كلية الهندسة المعلوماتية"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "الرقم الجامعي",
          "القسم",
          "العام الدراسي"
        ]
      },
      {
        "id": 3,
        "name": "طلب عام",
        "body": "أرجو الموافقة على",
        "departments": [
          {"id": 2, "name": "مكتب العميد"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "الرقم الجامعي",
          "السنة",
          "القسم",
          "العام الدراسي",
          "نص الطلب"
        ]
      },
      {
        "id": 4,
        "name": "طلب اعتراض على جمع العلامات",
        "body": "أرجو الموافقة على إعادة جمع علامات مقرر",
        "departments": [
          {"id": 2, "name": "مكتب العميد"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "الرقم الجامعي",
          "السنة",
          "القسم",
          "العام الدراسي",
          "اسم المقرر",
          "الفصل الدراسي"
        ]
      },
      {
        "id": 5,
        "name": "بيان وضع",
        "body": "",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
          {"id": 7, "name": "الامتحانات"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "السنة",
          "القسم",
          "العام الدراسي"
        ]
      },
      {
        "id": 6,
        "name": "وثيقة ترفع",
        "body":
            "نجاح/ترفع الطالب من سنة الى السنة التالية وذلك بنتيجة امتحانات الدورة الفصلية وبناءعلى طلبه سمنح هذه الوثيقة",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
          {"id": 7, "name": "الامتحانات"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "الرقم الجامعي",
          "السنة السابقة",
          "السنة اللاحقة",
          "الدورة الفصلية",
          "العام الدراسي",
          "تاريخ تحرير الطلب"
        ]
      },
      {
        "id": 7,
        "name": "إشعار التخرج",
        "body":
            "يتخرج الطالب من كلية الهندسة المعلوماتية من القسم المرفق بنتيجة امتحانات الدورة الفصلية المرفقة علما أن قرار التخرج لم يصدر بعد",
        "departments": [
          {"id": 2, "name": "مكتب العميد"},
          {"id": 7, "name": "الامتحانات"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "القسم",
          "الدورة الفصلية",
          "العام الدراسي"
        ]
      },
      {
        "id": 8,
        "name": "طلب إعادة العملي",
        "body":
            "السيد الدكتور عميد كلية الهندسة المعلوماتية ,أرجو الموافقة التفضل بالموافقة على إعادة العملي للمقرر المرفق ولكم جزيل الشكر",
        "departments": [
          {"id": 2, "name": "مكتب العميد"}
        ],
        "init_department": {"id": 6, "name": "الديوان"},
        "data": [
          "الرقم",
          "اسم الطالب الثلاثي",
          "الرقم الجامعي",
          "السنة",
          "القسم",
          "العام الدراسي",
          "الفصل",
          "اسم المقرر",
          "رقم الهوية الشخصية"
        ]
      }
    ]
  };
  static Map<String, dynamic> departmentsMap = {
    "departments": [
      {
        "id": 6,
        "name": "الديوان",
        "description":
            "هذا القسم مسؤول عن جدولة وتأريخ الطلبات المتقدمة الى الكلية",
        "pending_tasks_count": 10,
        "finished_tasks_count": 6,
        "rejected_tasks_count": 3,
        "employess": [
          {"name": "علي حاتم", "id": 1},
          {"name": "محمد احمد", "id": 2},
          {"name": "احمد احمد", "id": 2}
        ]
      },
      {
        "id": 7,
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
        "id": 1,
        "name": "شعبة شؤون الطلاب",
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
        "id": 2,
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
        "id": 3,
        "name": "المدينة الجامعية",
        "description":
            "هذا القسم مسؤول عن الأوراق والمستندات المتعلقة بكليات الجامعة",
        "pending_tasks_count": 1,
        "finished_tasks_count": 3,
        "rejected_tasks_count": 0,
        "employess": [
          {"name": "علي حاتم", "id": 1},
          {"name": "محمد احمد", "id": 2}
        ]
      },
      {
        "id": 4,
        "name": "الفرقة الحزبية المعلوماتية",
        "description": "هذا القسم مسؤول عن تنظيم الأنتماءات الحزبية للطلاب",
        "pending_tasks_count": 0,
        "finished_tasks_count": 2,
        "rejected_tasks_count": 0,
        "employess": [
          {"name": "سارة علي", "id": 3},
          {"name": "احمد خالد", "id": 4}
        ]
      },
      {
        "id": 5,
        "name": "مكتبة كلية الهندسة المعلوماتية",
        "description":
            "هذا القسم مسؤول عن تقديم المحاضرات الورقية والأوراق والطلبات للطلبة",
        "pending_tasks_count": 0,
        "finished_tasks_count": 2,
        "rejected_tasks_count": 0,
        "employess": [
          {"name": "سارة علي", "id": 3},
          {"name": "احمد خالد", "id": 4}
        ]
      },
    ]
  };
  static Map<String, dynamic> tasksMap = {
    "tasks": [
      {
        "id": 1,
        "name": "مصدقة تخرج",
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
        "name": "براءة ذمة",
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
        "name": "طلب عام",
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
        "name": "طلب اعتراض على جمع العلامات",
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
        "name": "بيان وضع",
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
        "name": "وثيقة ترفع",
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
        "name": "إشعار التخرج",
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
        "name": "طلب إعادة العملي",
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
        "name": "طلب إعادة العملي",
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
        "name": "طلب إعادة العملي",
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
        "name": "إشعار التخرج",
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
        "name": "وثيقة ترفع",
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
        "name": "وثيقة ترفع",
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
        "name": "طلب اعتراض على جمع العلامات",
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
        "name": "طلب اعتراض على جمع العلامات",
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
        "name": "طلب عام",
        "issuedDate": "2023-08-05",
        "status": "مُنجز",
        "current_department": "مكتب العلاقات العامة",
        "current_employee": "احمد خالد",
        "previous_departments": [],
        "next_departments": []
      },
      {
        "id": 17,
        "name": "براءة ذمة",
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
        "name": "طلب عام",
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
        "name": "مصدقة تخرج",
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
        "name": "مصدقة تخرج",
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
