import 'package:task_1_ios_app/my-imports.dart';

class BuildingsSitesScreen extends StatefulWidget {
  const BuildingsSitesScreen({super.key});

  @override
  State<BuildingsSitesScreen> createState() => _BuildingsSitesScreenState();
}

class _BuildingsSitesScreenState extends State<BuildingsSitesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> buildings = [
      {
        'project': 'Unique IT Center',
        'siteCode': 'UT-1',
        'flatSize': '1560',
        'stage': 'Inprogress',
        'height': '14.0',
      },
      {
        'project': 'Unique IT Center',
        'siteCode': 'UT-2',
        'flatSize': '1250',
        'stage': 'Inprogress',
        'height': '10.0',
      },
      {
        'project': 'Shoponogor IVA',
        'siteCode': 'SRA-1',
        'flatSize': '1600',
        'stage': 'Upcoming',
        'height': '14.0',
      },
      {
        'project': 'Shoponogor IVA',
        'siteCode': 'SRA-2',
        'flatSize': '1150',
        'stage': 'Inprogress',
        'height': '14.0',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-0011',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-123',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-1234',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
      },
      {
        'project': 'Medical College',
        'siteCode': 'MC-121212',
        'flatSize': '--',
        'stage': '--',
        'height': '--',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomProjectAppBar(title: 'Project Control'),
      drawer: const CustomDrawer(selectedItem: 'Buildings/Sites'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FilterCard(),
          const SizedBox(height: 16),
          const Text("All Building/Site",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          AddButton(
            title: 'Add Building/Site',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          Search(),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('SL')),
                DataColumn(label: Text('Project Name')),
                DataColumn(label: Text('Building / Site code')),
                DataColumn(label: Text('Average Flat Size')),
                DataColumn(label: Text('Stage')),
                DataColumn(label: Text('Building Height')),
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
          )
        ],
      ),
    );
  }
}
