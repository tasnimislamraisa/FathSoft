import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RatsOrApartmentScreen extends StatefulWidget {
  const RatsOrApartmentScreen({super.key});

  @override
  State<RatsOrApartmentScreen> createState() => _RatsOrApartmentScreenState();
}

class _RatsOrApartmentScreenState extends State<RatsOrApartmentScreen> {
  DateTime? selectedDate;
  final TextEditingController projectController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9fb),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Dashboard', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Icon(Icons.wb_sunny_outlined),
          SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: Text('SC', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _filterCard(),
          const SizedBox(height: 12),
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

  Widget _filterCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: const [
                Icon(Icons.filter_list),
                SizedBox(width: 8),
                Text("Filter")
              ]),
              GestureDetector(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      const SizedBox(width: 6),
                      Text(selectedDate != null
                          ? DateFormat('MMMM dd, yyyy').format(selectedDate!)
                          : 'Pick a date'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _textField("Select Project", projectController),
              const SizedBox(width: 16),
              _textField("Choose a Building", buildingController),
            ],
          )
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
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: const Center(child: Text("Area Chart Placeholder")),
    );
  }

  Widget _donutChartPlaceholder() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: const Center(child: Text("Donut Chart Placeholder")),
    );
  }
}
