class CategoryAndSubCategoryModel {
  final String status;
  final List<Category> data;

  CategoryAndSubCategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryAndSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryAndSubCategoryModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class Category {
  final int id;
  final String name;
  final String? image;
  final String description;
  final DateTime createdOn;
  final DateTime updatedOn;
  final List<SubCategory> subAreas;

  Category({
    required this.id,
    required this.name,
    this.image,
    required this.description,
    required this.createdOn,
    required this.updatedOn,
    required this.subAreas,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'],
      description: json['description'] ?? '',
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: DateTime.parse(json['updated_on']),
      subAreas: (json['sub_areas'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'description': description,
    'created_on': createdOn.toIso8601String(),
    'updated_on': updatedOn.toIso8601String(),
    'sub_areas': subAreas.map((e) => e.toJson()).toList(),
  };
}

class SubCategory {
  final int id;
  final int coachingArea;
  final String coachingAreaName;
  final String name;
  final String? image;
  final String description;
  final DateTime createdOn;
  final DateTime updatedOn;

  SubCategory({
    required this.id,
    required this.coachingArea,
    required this.coachingAreaName,
    required this.name,
    this.image,
    required this.description,
    required this.createdOn,
    required this.updatedOn,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      coachingArea: json['coaching_area'],
      coachingAreaName: json['coaching_area_name'] ?? '',
      name: json['name'] ?? '',
      image: json['image'],
      description: json['description'] ?? '',
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: DateTime.parse(json['updated_on']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'coaching_area': coachingArea,
    'coaching_area_name': coachingAreaName,
    'name': name,
    'image': image,
    'description': description,
    'created_on': createdOn.toIso8601String(),
    'updated_on': updatedOn.toIso8601String(),
  };
}
