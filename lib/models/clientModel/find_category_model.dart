class FindCategoryModel {
  final String status;
  final int totalCategories;
  final List<FindCategory> data;

  FindCategoryModel({
    required this.status,
    required this.totalCategories,
    required this.data,
  });

  factory FindCategoryModel.fromJson(Map<String, dynamic> json) {
    return FindCategoryModel(
      status: json['status'] ?? '',
      totalCategories: json['total_categories'] ?? 0,
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => FindCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'total_categories': totalCategories,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class FindCategory {
  final int id;
  final String name;
  final DateTime createdOn;
  final DateTime updatedOn;

  FindCategory({
    required this.id,
    required this.name,
    required this.createdOn,
    required this.updatedOn,
  });

  factory FindCategory.fromJson(Map<String, dynamic> json) {
    return FindCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      createdOn: DateTime.tryParse(json['created_on'] ?? '') ?? DateTime.now(),
      updatedOn: DateTime.tryParse(json['updated_on'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'created_on': createdOn.toIso8601String(),
    'updated_on': updatedOn.toIso8601String(),
  };
}
