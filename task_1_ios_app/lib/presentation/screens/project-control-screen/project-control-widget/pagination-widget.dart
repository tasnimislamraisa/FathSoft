import "package:task_1_ios_app/my-imports.dart";

Widget paginationSection({
  required int currentPage,
  required int totalPages,
  required int selectedPageSize,
  required Function(int) onPageChanged,
  required Function(int?) onPageSizeChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Page navigation buttons
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed:
                  currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
            ),
            Text(
              '$currentPage',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: currentPage < totalPages
                  ? () => onPageChanged(currentPage + 1)
                  : null,
            ),
          ],
        ),

        // Page size dropdown
        DropdownButton<int>(
          value: selectedPageSize,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(10),
          items: const [
            DropdownMenuItem(value: 5, child: Text("5 / page")),
            DropdownMenuItem(value: 8, child: Text("8 / page")),
            DropdownMenuItem(value: 10, child: Text("10 / page")),
          ],
          onChanged: onPageSizeChanged,
        ),
      ],
    ),
  );
}
