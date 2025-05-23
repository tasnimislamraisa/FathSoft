import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/screens/project-control-screen/project-control-widget/building-view-action-dialog.dart';

class BuildingsSitesScreen extends StatefulWidget {
  const BuildingsSitesScreen({super.key});

  @override
  State<BuildingsSitesScreen> createState() => _BuildingsSitesScreenState();
}

class _BuildingsSitesScreenState extends State<BuildingsSitesScreen> {
  @override
  Widget build(BuildContext context) {
    bool showDropdown = false;
    bool showFilters = false;
    DateTimeRange? selectedRange;
    String selectedDateLabel = 'Filter by date';
    String selectedDateFilter = 'Filter by date';
    String? selectedLand;
    String? selectedPlot;

    final List<String> dateOptions = [
      'Today',
      'Yesterday',
      'Last 7 Days',
      'Last 30 Days',
      'This Month',
      'Last Month',
      'Custom Range'
    ];

    final List<String> landList = ['Land A', 'Land B', 'Land C'];
    final Map<String, List<String>> plotMap = {
      'Land A': ['Plot A1', 'Plot A2'],
      'Land B': ['Plot B1', 'Plot B2'],
      'Land C': ['Plot C1', 'Plot C2'],
    };

    final List<Map<String, String>> buildings = [
      {
        'project': 'Unique IT Center',
        'siteCode': 'UT-1',
        'flatSize': '1560',
        'stage': 'Inprogress',
        'height': '14.0',
        'status': 'active',
      },
      {
        'project': 'Unique IT Center',
        'siteCode': 'UT-2',
        'flatSize': '1250',
        'stage': 'Inprogress',
        'height': '10.0',
        'status': 'active',
      },
      {
        'project': 'Shoponogor IVA',
        'siteCode': 'SRA-1',
        'flatSize': '1600',
        'stage': 'Upcoming',
        'height': '14.0',
        'status': 'active',
      },
      {
        'project': 'Shoponogor IVA',
        'siteCode': 'SRA-2',
        'flatSize': '1150',
        'stage': 'Inprogress',
        'height': '14.0',
        'status': 'active',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-0011',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
        'status': 'active',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-123',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
        'status': 'active',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-1234',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
        'status': 'active',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-121212',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
        'status': 'active',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomProjectAppBar(title: 'Project Control'),
      drawer: const CustomDrawer(selectedItem: 'Buildings/Sites'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FilterBarWithDropdown(
            showFilters: showFilters,
            selectedDateFilter: selectedDateFilter,
            dateOptions: dateOptions,
            onToggleFilter: (val) => setState(() => showFilters = val),
            onDateFilterSelected: (val) =>
                setState(() => selectedDateFilter = val),
            selectedLand: selectedLand,
            selectedPlot: selectedPlot,
            landList: landList,
            plotMap: plotMap,
            onLandChanged: (val) => setState(() {
              selectedLand = val;
              selectedPlot = null;
            }),
            onPlotChanged: (val) => setState(() => selectedPlot = val),
          ),
          const SizedBox(height: 16),
          const Text("All Building/Site",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          AddButton(
            title: 'Add Building/Site',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          const Search(),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('SL')),
                DataColumn(label: Text('Project Name')),
                DataColumn(label: Text('Building / Site code')),
                DataColumn(label: Text('Average Flat Size')),
                DataColumn(label: Text('Stage')),
                DataColumn(label: Text('Building Height')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Action')),
              ],
              rows: List<DataRow>.generate(
                buildings.length,
                (index) {
                  final item = buildings[index];
                  return DataRow(
                    cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(item['project']!)),
                      DataCell(Text(item['siteCode']!)),
                      DataCell(Text(item['flatSize']!)),
                      DataCell(Text(item['stage']!)),
                      DataCell(Text(item['height']!)),
                      DataCell(_statusBadge(item['status']!)),
                      DataCell(Row(
                        children: [
                          _actionButton("View", Colors.orange, () {
                            Get.dialog(BuildingViewActionDialog());
                            // TODO: Show view dialog
                          }),
                          const SizedBox(width: 6),
                          _actionButton("Edit", Colors.blue, () {
                            // TODO: Edit logic
                          }),
                          const SizedBox(width: 6),
                          _actionButton("Delete", Colors.red, () {
                            // TODO: Delete logic
                          }),
                        ],
                      )),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          paginationSection(
            currentPage: 1,
            totalPages: 2,
            selectedPageSize: 8,
            onPageChanged: (page) {},
            onPageSizeChanged: (size) {},
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.green),
      ),
    );
  }

  Widget _actionButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(label),
    );
  }
}
