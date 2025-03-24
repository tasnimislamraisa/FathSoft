import 'package:task_1_ios_app/my-imports.dart';

class FilterBarWithDropdown extends StatelessWidget {
  final bool showFilters;
  final String selectedDateFilter;
  final List<String> dateOptions;
  final Function(bool) onToggleFilter;
  final Function(String) onDateFilterSelected;
  final String? selectedLand;
  final String? selectedPlot;
  final List<String> landList;
  final Map<String, List<String>> plotMap;
  final Function(String?) onLandChanged;
  final Function(String?) onPlotChanged;

  const FilterBarWithDropdown({
    super.key,
    required this.showFilters,
    required this.selectedDateFilter,
    required this.dateOptions,
    required this.onToggleFilter,
    required this.onDateFilterSelected,
    required this.selectedLand,
    required this.selectedPlot,
    required this.landList,
    required this.plotMap,
    required this.onLandChanged,
    required this.onPlotChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    onToggleFilter(!showFilters);
                  },
                  icon: const Icon(Icons.menu),
                  label: const Text('Filter'),
                ),
              ),
              Expanded(
                child: PopupMenuButton<String>(
                  onSelected: onDateFilterSelected,
                  itemBuilder: (context) {
                    return dateOptions
                        .map((option) => PopupMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 18),
                        Text(
                          selectedDateFilter,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Icon(Icons.expand_more),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showFilters) ...[
          const SizedBox(height: 12),
          _buildDropdownField(
            label: 'Select Land',
            value: selectedLand,
            onChanged: onLandChanged,
            items: landList,
          ),
          const SizedBox(height: 12),
          _buildDropdownField(
            label: 'Select Plot',
            value: selectedPlot,
            onChanged: onPlotChanged,
            items: selectedLand == null ? [] : plotMap[selectedLand]!,
          ),
        ]
      ],
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
}
