import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/screens/Land-and-plots-control-screen/land-and-plot-widget/plot-details-dialog.dart';

class PlotScreen extends StatelessWidget {
  const PlotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> plotProperties = [
      {
        'sl': '1',
        'landPropertyId': 'PRO-0002',
        'landPropertyName': 'Property test 3',
        'plotName': 'Garden View Plot 2',
        'plotId': 'PLOT-015',
        'shape': 'rectangle',
        'area': '0.28 Decimal',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomProjectAppBar(title: 'Plots'),
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
                  title: 'Add Plot',
                  onTap: () {
                    //Get.dialog(const AddLandPropertyDialog());
                    // TODO: Add Property dialog
                  },
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 950,
                    child: _buildTable(context, plotProperties),
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
                const SizedBox(width: 12),
                _cell(item['landPropertyId'] ?? '', flex: 2),
                const SizedBox(width: 12),
                _cell(item['landPropertyName'] ?? '', flex: 3),
                const SizedBox(width: 12),
                _cell(item['plotName'] ?? '', flex: 3),
                const SizedBox(width: 12),
                _cell(item['plotId'] ?? '', flex: 2),
                const SizedBox(width: 12),
                _cell(item['shape'] ?? '', flex: 2),
                const SizedBox(width: 12),
                _cell(item['area'] ?? '', flex: 2),
                const SizedBox(width: 12),
                _actionButtons(flex: 3),
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
          SizedBox(width: 12),
          Expanded(
              flex: 2,
              child: Text("Land / Property Id",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 12),
          Expanded(
              flex: 3,
              child: Text("Land / Property Name",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 12),
          Expanded(
              flex: 3,
              child: Text("Plot Name",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 12),
          Expanded(
              flex: 2,
              child: Text("Plot Id",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 12),
          Expanded(
              flex: 2,
              child:
                  Text("Shape", style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 12),
          Expanded(
              flex: 2,
              child:
                  Text("Area", style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 12),
          Expanded(
              flex: 2,
              child: Text("Action",
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _cell(String text, {int flex = 1, bool center = true}) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: center ? Alignment.center : Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
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
        child: const Text("View", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _actionButtons({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.dialog(
                  PlotDetailsDialog(
                    plot: {
                      'name': 'Garden View Plot 2',
                      'shape': 'rectangle',
                      'area': '0.28 Decimal',
                      'inventoryForSale': 'No',
                      'note': 'Test plot',
                      'propertyId': 'PRO-0002',
                      'propertyName': 'Property test 3',
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("View"),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Edit logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Icon(Icons.edit, size: 18),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Delete logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Icon(Icons.delete, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
