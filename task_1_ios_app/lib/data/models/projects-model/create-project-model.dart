class CreateProjectModel {
  String companyId;
  String projectName;
  String location;
  String contactNumber;
  String projectStartDate;
  String approxHandoverDate;
  String projectCode;
  String stage;
  String projectType;
  String status;
  String logo;
  String architectDrawingFile;

  CreateProjectModel({
    required this.companyId,
    required this.projectName,
    required this.location,
    required this.contactNumber,
    required this.projectStartDate,
    required this.approxHandoverDate,
    required this.projectCode,
    required this.stage,
    required this.projectType,
    required this.status,
    this.logo = 'default-logo',
    this.architectDrawingFile = 'default-drawing',
  });

  CreateProjectModel.fromJson(Map<String, dynamic> json)
      : companyId = json['company_id'],
        projectName = json['project_name'],
        location = json['location'],
        contactNumber = json['contact_number'],
        projectStartDate = json['project_start_date'],
        approxHandoverDate = json['approx_handover_date'],
        projectCode = json['project_code'],
        stage = json['stage'],
        projectType = json['project_type'],
        status = json['status'],
        logo = json['logo'] ?? 'default-logo',
        architectDrawingFile =
            json['architect_drawing_file'] ?? 'default-drawing';

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'project_name': projectName,
      'location': location,
      'contact_number': contactNumber,
      'project_start_date': projectStartDate,
      'approx_handover_date': approxHandoverDate,
      'project_code': projectCode,
      'stage': stage,
      'project_type': projectType,
      'status': status,
      'logo': logo,
      'architect_drawing_file': architectDrawingFile,
    };
  }
}
