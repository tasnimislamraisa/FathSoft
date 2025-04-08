class Project {
  final int id;
  final String projectName;
  final String location;
  final String contactNumber;
  final String projectCode;
  final String stage;
  final String projectType;
  final String status;

  Project({
    required this.id,
    required this.projectName,
    required this.location,
    required this.contactNumber,
    required this.projectCode,
    required this.stage,
    required this.projectType,
    required this.status,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      projectName: json['project_name'] ?? '',
      location: json['location'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      projectCode: json['project_code'] ?? '',
      stage: json['stage'] ?? '',
      projectType: json['project_type'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
