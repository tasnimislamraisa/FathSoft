import 'package:task_1_ios_app/my-imports.dart';

class AddClientDialog extends StatefulWidget {
  const AddClientDialog({super.key});

  @override
  State<AddClientDialog> createState() => _AddClientDialogState();
}

class _AddClientDialogState extends State<AddClientDialog> {
  String? selectedProject;
  String? selectedBuilding;
  String? selectedStatus;
  String searchText = '';

  final List<String> projectList = ['Unique IT Center', 'Shopnonogor R/A'];
  final List<String> buildingList = ['UT-1', 'UT-2'];
  final List<String> statusList = ['Existing', 'New'];

  final List<String> clients = [
    'abu sayeed - (MC-1)',
    'abu sayeed - (MC-2)',
    'abu sayeed - (MC-3)',
    'abu sayeed - (MC-4)',
    'সরিফুল আহমেদিন - (MC-1111-1)',
    'সরিফুল আহমেদিন - (SRA-1-1)',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> filteredClients = clients
        .where((c) => c.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Add Client",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Dropdowns
              SectionTitle(title: "* Select Project:"),
              ReusableDropdown(
                items: projectList,
                hint: "Select Project",
                value: selectedProject,
                onChanged: (val) => setState(() => selectedProject = val),
              ),
              SectionTitle(title: "* Select Building / Site:"),
              ReusableDropdown(
                items: buildingList,
                hint: "Select Building",
                value: selectedBuilding,
                onChanged: (val) => setState(() => selectedBuilding = val),
              ),
              SectionTitle(title: "Select Client Status"),
              ReusableDropdown(
                items: statusList,
                hint: "Select Status",
                value: selectedStatus,
                onChanged: (val) => setState(() => selectedStatus = val),
              ),

              const SizedBox(height: 24),

              if (selectedStatus == "Existing") ...[
                const SectionTitle(title: "* Clients:"),
                ReusableInput(
                  hint: "Search by Name, Phone Number",
                  icon: Icons.search,
                  onChanged: (val) => setState(() => searchText = val.trim()),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: filteredClients.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(filteredClients[index]),
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AddButton(title: "Submit", onTap: () {}),
              ] else if (selectedStatus == "New") ...[
                const Divider(),
                const SizedBox(height: 16),
                RegisterClientSection(),
                const Divider(),
                const SizedBox(height: 16),
                const NomineeSection(),
                const Divider(),
                const SizedBox(height: 16),
                const PresentAddressSection(),
                const Divider(),
                const SizedBox(height: 16),
                const PermanentAddressSection(),
                const Divider(),
                const SizedBox(height: 16),
                const BankingSection(),
                const Divider(),
                const SizedBox(height: 16),
                MobileBanking(),
                const UploadSection(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Register Client",
                      style: TextStyle(color: Colors.white)),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
