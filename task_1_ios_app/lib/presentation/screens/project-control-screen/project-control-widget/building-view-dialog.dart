import 'package:task_1_ios_app/my-imports.dart';

class BuildingDetailsDialog extends StatelessWidget {
  const BuildingDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> buildingDetails = {
      'Average Flat Size': '1560',
      'Floor Area Size': '10000.00',
      'Building Height': '14.00',
      'Flat/Unit Per Floor': '8',
      'Piling Type': 'preCastPile',
      'Facing Type': 'south',
      'Building Start Date': '2024-11-29',
      'Approximate Hand Over Date': '2025-11-30',
      'Stage': 'Inprogress',
    };

    final String status = 'active';
    final List<Map<String, String>> stages = [
      {'date': '2025-02-07', 'stage': 'test'}
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Building Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                    onPressed: () => Get.back(), icon: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 12),

            // Info rows
            ...buildingDetails.entries.map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${e.key}:",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Text(e.value, textAlign: TextAlign.right),
                    ),
                  ],
                ),
              );
            }).toList(),

            // Status
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Expanded(
                    child: Text("Status:",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'active',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Stages Table Header
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Stages',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 600, // Adjust width based on your column content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Table Header
                    Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Expanded(
                              flex: 1,
                              child: Text('SL',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 3,
                              child: Text('Date',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 3,
                              child: Text('Stage',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 3,
                              child: Text('Action',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    const Divider(height: 1),

                    // Table Data
                    ...stages.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, String> stage = entry.value;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text('${index + 1}')),
                            Expanded(flex: 3, child: Text(stage['date']!)),
                            Expanded(flex: 3, child: Text(stage['stage']!)),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      minimumSize: const Size(30, 30),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: const Text('Edit'),
                                  ),
                                  const SizedBox(width: 6),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      minimumSize: const Size(30, 30),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Add Stage Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.dialog(AddStageDialog());
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Stage'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
