import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildingViewActionDialog extends StatelessWidget {
  const BuildingViewActionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> buildingInfo = {
      'Building No': 'N/A',
      'Project Name': 'N/A',
      'Average Flat Size': 'N/A',
      'Floor Area Size': 'N/A',
      'Building Height': 'N/A',
      'Flat/Unit Per Floor': 'N/A',
      'Piling Type': 'N/A',
      'Facing Type': 'N/A',
      'Building Start Date': 'N/A',
      'Approximate Hand Over Date': 'N/A',
      'Stage': 'N/A',
    };

    final String status = 'N/A';
    final List<Map<String, String>> stages = [
      {
        'date': '2023-11-29',
        'stage': 'Foundation',
      },
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
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
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 12),

              // Info Rows
              ...buildingInfo.entries.map((e) {
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Stages Header
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Stages',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),

              // Stages Table
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('SL',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 3,
                        child: Text('Date',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 3,
                        child: Text('Stage',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 3,
                        child: Text('Action',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              const Divider(height: 1),
              ...stages.asMap().entries.map((entry) {
                final index = entry.key;
                final stage = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${index + 1}')),
                      Expanded(flex: 3, child: Text(stage['date']!)),
                      Expanded(flex: 3, child: Text(stage['stage']!)),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 12),

              // Add Stage Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Show add stage dialog
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('+ Add Stage'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
