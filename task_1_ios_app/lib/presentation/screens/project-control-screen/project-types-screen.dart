import 'package:task_1_ios_app/my-imports.dart';

class ProjectTypeScreen extends StatelessWidget {
  const ProjectTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projectTypes = [
      {'type': 'Residential', 'code': 'PRJ001'},
      {'type': 'Commercial', 'code': 'PRJ002'},
      {'type': 'Industrial', 'code': 'PRJ003'},
      {'type': 'Educational', 'code': 'PRJ004'},
      {'type': 'Healthcare', 'code': 'PRJ005'},
    ];

    return Scaffold(
      appBar: const CustomProjectAppBar(title: "Project Type"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Box
            Search(),

            const SizedBox(height: 12),

            // Add Type Button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [AddButton(title: "Add Type")],
            ),

            const SizedBox(height: 12),

            // Table with horizontal scroll
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 600,
                  child: Column(
                    children: [
                      // Table Header
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey.shade200,
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 1,
                              child: Text("SL",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("Type Name",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text("Code",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text("Action",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      //const Divider(height: 1),

                      // Table List
                      ListView.builder(
                        itemCount: projectTypes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final project = projectTypes[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Expanded(flex: 1, child: Text("${index + 1}")),
                                Expanded(
                                    flex: 3, child: Text(project['type']!)),
                                Expanded(
                                    flex: 2, child: Text(project['code']!)),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          minimumSize: const Size(60, 35),
                                        ),
                                        child: const Text("Edit"),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          minimumSize: const Size(60, 35),
                                        ),
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 10),

                      // Pagination Row
                      paginationSection(
                        currentPage: 1,
                        totalPages: 3,
                        selectedPageSize: 8,
                        onPageChanged: (newPage) {
                          // implement page switch logic
                        },
                        onPageSizeChanged: (newSize) {
                          // update per-page value and refresh
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
