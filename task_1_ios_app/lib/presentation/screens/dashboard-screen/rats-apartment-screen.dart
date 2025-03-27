import 'package:task_1_ios_app/my-imports.dart';

class RatsOrApartmentScreen extends StatefulWidget {
  const RatsOrApartmentScreen({super.key});

  @override
  State<RatsOrApartmentScreen> createState() => _RatsOrApartmentScreenState();
}

class _RatsOrApartmentScreenState extends State<RatsOrApartmentScreen> {
  DateTime? selectedDate;
  final TextEditingController projectController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
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
      appBar: DashBoardAppBar(),
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
          const SizedBox(height: 16),
          _gradientCard('Sales Amount', '00 TK', '📈', Colors.blue),
          _gradientCard('Purchase Amount', '00 TK', '🛍️', Colors.deepOrange),
          _gradientCard('Payment Due', '00 TK', '💳', Colors.deepPurple),
          _gradientCard('Recieve Due', '00 TK', '💳', Colors.deepPurple),
          const SizedBox(height: 8),
          _simpleCard('Expense', '00 TK', '📦'),
          _simpleCard('Salary', '00 TK', '💵'),
          _simpleCard('Total Clients', '2', '😊'),
          _simpleCard('Total Suppliers', '00', '🚚'),
          _simpleCard('Total Employees', '00', '👨‍💼'),
          _simpleCard('Required Amount', '0 TK', '📦',
              trailing: 'Construction'),
          _simpleCard('Paid Amount', '0 TK', '💵', trailing: 'Construction'),
          _simpleCard('Due Amount', '0 TK', '❗', trailing: 'Construction'),
          const SizedBox(height: 8),
          _infoCard('Recent Payment Due', 'No payments due'),
          _infoCard('Recent Receipt Due', 'No receipts due'),
          _infoCard('Today Purchase Requisition', 'No requisitions for today'),
          const SizedBox(height: 12),
          _areaChartPlaceholder(),
          const SizedBox(height: 20),
          _donutChartPlaceholder(),
        ],
      ),
    );
  }

  Widget _textField(String label, TextEditingController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          )
        ],
      ),
    );
  }

  Widget _gradientCard(String title, String value, String emoji, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.withOpacity(0.85), color]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 4),
              Text(value,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }

  Widget _simpleCard(String title, String value, String emoji,
      {String? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          if (trailing != null)
            Text(trailing, style: const TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  Widget _infoCard(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _areaChartPlaceholder() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun'
                        ];
                        return Text(
                          months[value.toInt()],
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  // Desktop
                  LineChartBarData(
                    isCurved: true,
                    spots: const [
                      FlSpot(0, 50),
                      FlSpot(1, 130),
                      FlSpot(2, 90),
                      FlSpot(3, 95),
                      FlSpot(4, 120),
                      FlSpot(5, 120),
                    ],
                    color: Colors.blue.shade300,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.shade300.withOpacity(0.4),
                    ),
                    dotData: FlDotData(show: false),
                  ),
                  // Mobile
                  LineChartBarData(
                    isCurved: true,
                    spots: const [
                      FlSpot(0, 20),
                      FlSpot(1, 60),
                      FlSpot(2, 50),
                      FlSpot(3, 65),
                      FlSpot(4, 55),
                      FlSpot(5, 65),
                    ],
                    color: Colors.blue.shade100,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.teal.shade200.withOpacity(0.3),
                    ),
                    dotData: FlDotData(show: false),
                  ),
                ],
                minY: 0,
                maxY: 140,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendDot(Colors.teal.shade200, "Mobile"),
              const SizedBox(width: 20),
              _legendDot(Colors.blue.shade300, "Desktop"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _donutChartPlaceholder() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 48,
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              color: Colors.green.shade400,
              value: 40,
              title: '',
              radius: 40,
            ),
            PieChartSectionData(
              color: Colors.green.shade600,
              value: 35,
              title: '',
              radius: 40,
            ),
            PieChartSectionData(
              color: Colors.teal.shade300,
              value: 25,
              title: '',
              radius: 40,
            ),
          ],
          pieTouchData: PieTouchData(enabled: true),
        ),
      ),
    );
  }
}
