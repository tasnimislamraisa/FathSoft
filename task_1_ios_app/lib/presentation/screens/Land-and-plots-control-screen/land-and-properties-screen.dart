import 'package:task_1_ios_app/my-imports.dart';

class LandPropertyScreen extends StatelessWidget {
  const LandPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> landProperties = [
      {
        'id': 'PRO-0002',
        'name': 'Property test 3',
        'area': '222.20 Decimal',
        'location': 'Faticchari',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomProjectAppBar(title: 'All Land / Property'),
      drawer: const CustomDrawer(selectedItem: ''),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Search(),
                const SizedBox(height: 16),
                AddButton(
                  title: 'Add Property',
                  onTap: () {
                    // TODO: Add Property dialog
                  },
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 950,
                    child: _buildTable(context, landProperties),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: paginationSection(
              currentPage: 1,
              totalPages: 1,
              selectedPageSize: 8,
              onPageChanged: (newPage) {},
              onPageSizeChanged: (newSize) {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTable(BuildContext context, List<Map<String, String>> data) {
    return Column(
      children: [
        _buildHeader(),
        const Divider(height: 1),
        ...data.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                _cell('${index + 1}', flex: 1),
                _cell(item['id']!, flex: 2),
                _cell(item['name']!, flex: 3),
                _cell(item['area']!, flex: 2),
                _viewButton('Land / Property View', flex: 2),
                _viewButton('Plot View', flex: 2),
                _cell(item['location']!, flex: 2),
                _actionButtons(flex: 2),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.shade200,
      child: Row(
        children: const [
          Expanded(
              flex: 1,
              child: Text("SL", style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 2,
              child: Text("Land / Property Id",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 3,
              child: Text("Land / Property Name",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 2,
              child:
                  Text("Area", style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 2,
              child: Text("Land / Property View",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 2,
              child: Text("Plot View",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 2,
              child: Text("Location",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 2,
              child: Text("Action",
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _cell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(text),
    );
  }

  Widget _viewButton(String title, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Add view dialog
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          minimumSize: const Size(double.infinity, 30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text("View", style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _actionButtons({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // TODO: Edit
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Edit"),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // TODO: Delete
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
