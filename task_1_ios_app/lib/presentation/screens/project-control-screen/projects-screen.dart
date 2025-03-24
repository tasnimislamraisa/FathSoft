import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/screens/project-control-screen/project-control-widget/add-project-dialog.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {
        'name': 'Unique IT Center',
        'location': 'Dhaka',
        'stage': 'Inprogress',
        'code': 'UT',
        'status': 'active'
      },
      {
        'name': 'Shopnonogor R/A',
        'location': 'Dhaka Mirpur',
        'stage': 'Inprogress',
        'code': 'SRA',
        'status': 'active'
      },
    ];

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
                FilterCard(),
                const SizedBox(height: 12),
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
                    width: 720,
                    child: _buildProjectsTable(context, projects),
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

  Widget _buildProjectsTable(
      BuildContext context, List<Map<String, String>> projects) {
    return Column(
      children: [
        _buildTableHeader(),
        const Divider(height: 1),
        ...projects.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                _tableCell('${index + 1}', flex: 1),
                const SizedBox(
                  width: 8,
                ),
                _tableCell(item['name']!, flex: 3),
                const SizedBox(
                  width: 8,
                ),
                _tableCell(item['location']!, flex: 2),
                const SizedBox(
                  width: 8,
                ),
                _tableCell(item['stage']!, flex: 2, bold: true),
                const SizedBox(
                  width: 8,
                ),
                _tableCell(item['code']!, flex: 2),
                _viewButton(flex: 2, project: item),
                const SizedBox(
                  width: 8,
                ),
                _viewButton(flex: 2),
                const SizedBox(
                  width: 8,
                ),
                _statusTag(item['status']!, flex: 2),
                const SizedBox(
                  width: 8,
                ),
                _actionButtons(flex: 3),
              ],
            ),
          );
        }).toList(),
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
          _headerCell("Project Name", flex: 3),
          _headerCell("Location", flex: 2),
          _headerCell("Stage", flex: 2),
          _headerCell("Project Code", flex: 2),
          _headerCell("Project View", flex: 2),
          _headerCell("Site View", flex: 2),
          _headerCell("Status", flex: 2),
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
        style:
            TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _viewButton({int flex = 1, Map<String, String>? project}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {
          if (project != null) {
            Get.dialog(ProjectDetailsDialog(project: project));
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

/*  Widget _viewButton({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {},
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
  }*/

  Widget _statusTag(String status, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(status, style: const TextStyle(color: Colors.green)),
      ),
    );
  }

  Widget _actionButtons({int flex = 3}) {
    return Expanded(
      flex: flex,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              minimumSize: const Size(30, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(Icons.edit),
          ),
          const SizedBox(width: 6),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              minimumSize: const Size(30, 30),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
