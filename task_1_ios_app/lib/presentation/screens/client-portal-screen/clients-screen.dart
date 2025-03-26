import 'package:task_1_ios_app/my-imports.dart';

class AllClientsScreen extends StatelessWidget {
  const AllClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clients = [
      {
        'photo': 'N/A',
        'clientId': 'MC-1',
        'clientName': 'abu sayeed',
        'project': 'Medical College',
        'site': '--',
        'contact': '1575202028',
        'status': 'Pending',
        'share': '2'
      },
      {
        'photo': 'N/A',
        'clientId': 'MC-2',
        'clientName': 'abu sayeed',
        'project': 'Medical College',
        'site': '--',
        'contact': '1575202028',
        'status': 'Pending',
        'share': '2'
      },
      {
        'photo': 'N/A',
        'clientId': 'MC-3',
        'clientName': 'abu sayeed',
        'project': 'Medical College',
        'site': '--',
        'contact': '1575202028',
        'status': 'Pending',
        'share': '2'
      },
      {
        'photo': 'N/A',
        'clientId': 'MC-4',
        'clientName': 'abu sayeed',
        'project': 'Medical College',
        'site': '--',
        'contact': '1575202028',
        'status': 'Pending',
        'share': '2'
      },
      {
        'photo': 'Icon',
        'clientId': 'MC-1111-1',
        'clientName': 'শরিফুল আহমেদিন',
        'project': 'Medical College',
        'site': 'MC-1111',
        'contact': '1750483773',
        'status': 'Pending',
        'share': '12'
      },
      {
        'photo': 'Icon',
        'clientId': 'SRA-1-1',
        'clientName': 'শরিফুল আহমেদিন',
        'project': 'Shopnonogor R/A',
        'site': 'SRA-1',
        'contact': '1750483773',
        'status': 'Pending',
        'share': '12'
      },
      {
        'photo': 'N/A',
        'clientId': 'SRA-1-2',
        'clientName': 'abu sayeed',
        'project': 'Shopnonogor R/A',
        'site': 'SRA-1',
        'contact': '1575202028',
        'status': 'Pending',
        'share': '2'
      },
      {
        'photo': 'N/A',
        'clientId': 'SRA-1-2',
        'clientName': 'abu sayeed',
        'project': 'Shopnonogor R/A',
        'site': 'SRA-1',
        'contact': '1575202028',
        'status': 'Pending',
        'share': '2'
      },
    ];

    return Scaffold(
      appBar: CustomProjectAppBar(title: "Clients"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              "All Clients",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Search(),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AddButton(
                      title: "Add Client",
                      onTap: () {
                        Get.dialog(const AddClientDialog());
                      }),
                  const SizedBox(width: 8),
                  ActionButton(
                    icon: Icons.visibility,
                    title: "Column Visibility",
                    onTap: () {},
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  ActionButton(
                    icon: Icons.description,
                    title: "Export to Excel",
                    onTap: () {},
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  ActionButton(
                    icon: Icons.picture_as_pdf,
                    title: "Export to PDF",
                    onTap: () {},
                    color: Colors.green,
                  ),
                  const SizedBox(width: 8),
                  ActionButton(
                    icon: Icons.print,
                    title: "Print",
                    onTap: () {},
                    color: Colors.pink,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('SL')),
                  DataColumn(label: Text('Photo')),
                  DataColumn(label: Text('Client ID')),
                  DataColumn(label: Text('Client Name')),
                  DataColumn(label: Text('Project')),
                  DataColumn(label: Text('Building / Site')),
                  DataColumn(label: Text('Contact Number')),
                  DataColumn(label: Text('Payment Status')),
                  DataColumn(label: Text('Share')),
                  DataColumn(label: Text('Action')),
                ],
                rows: clients.asMap().entries.map((entry) {
                  int i = entry.key;
                  final client = entry.value;
                  return DataRow(
                    cells: [
                      DataCell(Text('${i + 1}')),
                      DataCell(CircleAvatar(
                        child: Text(
                          client['photo'] == 'N/A' ? 'N/A' : client['photo']!,
                          style: const TextStyle(fontSize: 10),
                        ),
                      )),
                      DataCell(Text(client['clientId']!)),
                      DataCell(Text(client['clientName']!)),
                      DataCell(Text(client['project']!)),
                      DataCell(Text(client['site']!)),
                      DataCell(Text(client['contact']!)),
                      DataCell(Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          client['status']!,
                          style: const TextStyle(color: Colors.orange),
                        ),
                      )),
                      DataCell(Text(client['share']!)),
                      DataCell(Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange),
                            child: const Text('Change OR'),
                          ),
                          const SizedBox(width: 6),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.deepOrange),
                            child: const Text('View'),
                          ),
                          const SizedBox(width: 6),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue),
                            child: const Text('Edit'),
                          ),
                          const SizedBox(width: 6),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red),
                            child: const Text('Delete'),
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
