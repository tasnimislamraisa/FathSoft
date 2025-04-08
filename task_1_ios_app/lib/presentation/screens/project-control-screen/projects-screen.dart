import 'package:task_1_ios_app/data/models/projects-model/project-model.dart';
import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/controller/view-all-projects.dart';
import 'package:task_1_ios_app/presentation/controller/view-project-by-id.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Project> _projects = [];
  bool _isLoading = true;

  Future<void> loadProjects() async {
    try {
      final data = await ViewAllProjects();
      setState(() {
        _projects = data;
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading projects: $e");
      Get.snackbar('Error', 'Failed to load projects');
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomProjectAppBar(title: 'All Projects'),
      drawer: const CustomDrawer(selectedItem: ''),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Search(),
                const SizedBox(height: 16),
                AddButton(
                  title: 'Add Project',
                  onTap: () {
                    Get.dialog(const AddProjectDialog());
                  },
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1000,
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _projects.isEmpty
                            ? const Center(child: Text("No projects found"))
                            : _buildProjectsTable(context, _projects),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: paginationSection(
              currentPage: 1,
              totalPages: 3,
              selectedPageSize: 8,
              onPageChanged: (newPage) {},
              onPageSizeChanged: (newSize) {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProjectsTable(BuildContext context, List<Project> projects) {
    return Column(
      children: [
        _buildTableHeader(),
        const Divider(height: 1),
        ...projects.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _tableCell('${index + 1}', flex: 1),
                  _spacer(),
                  _tableCell(item.projectName, flex: 3),
                  _spacer(),
                  _tableCell(item.location, flex: 2),
                  _spacer(),
                  _tableCell(item.stage, flex: 2, bold: true),
                  _spacer(),
                  _tableCell(item.projectCode, flex: 2),
                  _spacer(),
                  _viewButton(flex: 2, project: item),
                  _spacer(),
                  ViewSiteButton(projectName: item.projectName),
                  _spacer(),
                  _statusTag(item.status, flex: 2),
                  _spacer(),
                  ActionButtons(flex: 3),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.shade200,
      child: Row(
        children: [
          _headerCell("SL", flex: 1),
          _spacer(),
          _headerCell("Project Name", flex: 3),
          _spacer(),
          _headerCell("Location", flex: 2),
          _spacer(),
          _headerCell("Stage", flex: 2),
          _spacer(),
          _headerCell("Project Code", flex: 2),
          _spacer(),
          _headerCell("Project View", flex: 2),
          _spacer(),
          _headerCell("Site View", flex: 2),
          _spacer(),
          _headerCell("Status", flex: 2),
          _spacer(),
          _headerCell("Actions", flex: 3),
        ],
      ),
    );
  }

  Widget _headerCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _tableCell(String text, {int flex = 1, bool bold = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        overflow: TextOverflow.visible,
        softWrap: false,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _viewButton({int flex = 1, required Project project}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () async {
          try {
            final data = await fetchProjectById(project.id);
            Get.dialog(ProjectDetailsDialog(project: {
              'name': data['project_name'] ?? '',
              'location': data['location'] ?? '',
              'stage': data['stage'] ?? '',
              'code': data['project_code'] ?? '',
              'status': data['status'] ?? '',
              'contact': data['contact_number'] ?? '',
              'start_date': data['project_start_date'] ?? '',
              'handover_date': data['approx_handover_date'] ?? '',
            }));
          } catch (e) {
            Get.snackbar('Error', 'Failed to load project details');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          minimumSize: const Size(double.infinity, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text("View", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _statusTag(String status, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        constraints: const BoxConstraints(minWidth: 70),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            status,
            softWrap: false,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _spacer({double width = 12}) => SizedBox(width: width);
}
