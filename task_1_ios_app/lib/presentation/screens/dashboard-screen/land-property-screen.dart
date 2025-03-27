import 'package:task_1_ios_app/my-imports.dart';

class LandPropertyScreen extends StatefulWidget {
  const LandPropertyScreen({super.key});

  @override
  State<LandPropertyScreen> createState() => _LandPropertyScreenState();
}

class _LandPropertyScreenState extends State<LandPropertyScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const DashBoardAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
          const SizedBox(
            height: 16,
          ),
          // Top Summary Cards
          const InfoCardWithSubText(
            title: '📍 Total Land',
            value: '25',
            subValue: '(200 Decimal)',
            color: Colors.green,
          ),
          const InfoCardWithSubText(
            title: '✔️ Sold',
            value: '10',
            subValue: '(80 Decimal)',
            color: Colors.orange,
          ),
          const InfoCardWithSubText(
            title: '☐ Available',
            value: '15',
            subValue: '(120 Decimal)',
            color: Colors.purple,
          ),
          const InfoCardWithSubText(
            title: '🏡 Total Plot',
            value: '50',
            subValue: '(300 Decimal)',
            color: Colors.lightBlue,
          ),
          const InfoCardWithSubText(
            title: '✔️ Sold',
            value: '20',
            subValue: '(150 Decimal)',
            color: Colors.pink,
          ),
          const InfoCardWithSubText(
            title: '☐ Available',
            value: '30',
            subValue: '(200 Decimal)',
            color: Colors.yellow,
          ),

          // Reusing Existing Gradient Cards
          BuildGradientCard(
              'Sales Amount', '12,000 TK', Icons.show_chart, Colors.blue),
          BuildGradientCard('Purchase Amount', '12,000 TK', Icons.shopping_bag,
              Colors.orange),
          BuildGradientCard(
              'Payment Due', '12,000 TK', Icons.receipt, Colors.purple),
          BuildGradientCard(
              'Receipt Due', '12,000 TK', Icons.receipt_long, Colors.green),

          const SizedBox(height: 12),

          // Expense Summary Section Title
          const Text("Expense",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

          // Expense Cards (Reusing simple info card layout)
          const BuildInfoCard(
              title: "Recent Payment Due", subtitle: "No payments due"),
          const BuildInfoCard(
              title: "Recent Receipt Due", subtitle: "No receipts due"),
        ],
      ),
    );
  }
}
