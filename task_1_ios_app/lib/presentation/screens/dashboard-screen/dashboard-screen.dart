import 'package:intl/intl.dart';
import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/screens/dashboard-screen/dashboard-widget/filterbar-with-dropdown-widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

  void _selectPreset(String label, DateTimeRange range) {
    setState(() {
      selectedDateLabel = label;
      selectedRange = range;
      showDropdown = false;
    });
  }

  void _selectCustomRange(DateTimeRange range) {
    setState(() {
      selectedDateLabel =
          '${DateFormat('MM/dd/yyyy').format(range.start)} ~ ${DateFormat('MM/dd/yyyy').format(range.end)}';
      selectedRange = range;
      showDropdown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9fb),
      appBar: DashBoardAppBar(),
      drawer: CustomDrawer(
        selectedItem: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              BuildGradientCard(
                  'Sales Amount', '12,000 TK', Icons.show_chart, Colors.blue),
              BuildGradientCard('Purchase Amount', '12,000 TK',
                  Icons.shopping_bag, Colors.deepOrangeAccent),
              BuildGradientCard('Payment Due', '12,000 TK', Icons.receipt,
                  Colors.deepPurpleAccent),
              BuildGradientCard(
                  'Receipt Due', '12,000 TK', Icons.receipt_long, Colors.teal),
              BuildSimpleCard(
                  'Dpress',
                  '8,500 TK',
                  Icons.account_balance_wallet,
                  Colors.indigoAccent.withOpacity(0.15)),
              BuildSimpleCard('Salary', '5,000 TK', Icons.credit_card,
                  Colors.greenAccent.withOpacity(0.15)),
              BuildSimpleCard('Total Clients', '120', Icons.group,
                  Colors.redAccent.withOpacity(0.15)),
              BuildSimpleCard('Total Suppliers', '45', Icons.people_alt,
                  Colors.amberAccent.withOpacity(0.2)),
              BuildSimpleCard('Total Employees', '25',
                  Icons.shopping_bag_outlined, Colors.green.withOpacity(0.15)),
              const SizedBox(height: 20),
              BuildChartSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required void Function(String?) onChanged,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dateOption(String label, DateTimeRange range) {
    return ListTile(
      title: Text(label),
      onTap: () => _selectPreset(label, range),
    );
  }
}
