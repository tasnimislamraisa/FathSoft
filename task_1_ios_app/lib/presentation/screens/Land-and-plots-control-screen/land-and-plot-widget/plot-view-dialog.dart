import 'package:flutter/material.dart';

class PlotViewDialog extends StatelessWidget {
  const PlotViewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> plots = [
      {
        'id': 'PRO-0002',
        'propertyName': 'Property test 3',
        'plotName': 'Garden View Plot 2',
        'plotId': 'PLOT-015',
        'shape': 'rectangular',
      },
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 900,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with title and close button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Plot View",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            // Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Horizontally scrollable section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  // Table Header
                  Container(
                    color: Colors.grey.shade100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: const [
                        SizedBox(
                            width: 40,
                            child: Text('SL',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 140,
                            child: Text('Land / Property Id',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 180,
                            child: Text('Land / Property Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 180,
                            child: Text('Plot Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 120,
                            child: Text('Plot Id',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 120,
                            child: Text('Shape',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 240,
                            child: Text('Action',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  // Table Rows
                  ...plots.asMap().entries.map((entry) {
                    final index = entry.key;
                    final plot = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 40, child: Text('${index + 1}')),
                          SizedBox(width: 140, child: Text(plot['id']!)),
                          SizedBox(
                              width: 180, child: Text(plot['propertyName']!)),
                          SizedBox(width: 180, child: Text(plot['plotName']!)),
                          SizedBox(width: 120, child: Text(plot['plotId']!)),
                          SizedBox(width: 120, child: Text(plot['shape']!)),
                          SizedBox(
                            width: 240,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(30, 40),
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors.white),
                                  child: const Text("View"),
                                ),
                                const SizedBox(width: 6),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(30, 40),
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white),
                                  child: const Icon(Icons.edit),
                                ),
                                const SizedBox(width: 6),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(30, 40),
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white),
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
