import 'package:task_1_ios_app/my-imports.dart';

class AddLandPropertyDialog extends StatelessWidget {
  const AddLandPropertyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 800,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Add Land / Property",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _sectionTitle("Land/Plots Details"),
              _twoFields("Land / Property Name:", "Land / Property ID:"),
              _twoFields("উপজেলা/থানা:", "জেলা:"),
              _twoFields("মৌজা নাম্বার:", "জারিপ দেশ/Category:"),
              _singleField("খাত নম্বর:"),
              const SizedBox(height: 24),
              _sectionTitle("Documents"),
              _uploadField("CS খতিয়ান নং:"),
              _uploadField("RS খতিয়ান নং:"),
              _uploadField("SA খতিয়ান নং:"),
              _uploadField("BS খতিয়ান নং:"),
              _uploadField("Mutation খতিয়ান নং:"),
              _uploadField("City জারিপ খতিয়ান নং:"),
              _uploadField("জারিপ দেখার স্থান (CS, RS, CITY):"),
              const SizedBox(height: 4),
              const Text("↪ সাম্প্রতিক পত্তা / খতিয়ান কপি",
                  style: TextStyle(color: Colors.blue)),
              const SizedBox(height: 24),
              _sectionTitle("Additional Documents"),
              const Text("জমির পূর্বের সকল মালিকানা হস্তান্তরের দলিল"),
              const SizedBox(height: 8),
              _additionalDocumentRow(1),
              const SizedBox(height: 8),
              _additionalDocumentRow(2),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Add Document"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    foregroundColor: Colors.white),
              ),
              const SizedBox(height: 24),
              _sectionTitle("Owner Information"),
              _twoFields("Name:", "Phone Number:"),
              const SizedBox(height: 24),
              _twoFields("Present Address:", "NID:"),
              _uploadRow("NID File Upload:", "Photo:"),
              _twoFields("Tin Number:", ""),
              _uploadRow("Tin File Upload:", ""),
              const SizedBox(height: 24),
              _sectionTitle("Land Area"),
              _twoFields("Land Area:", "Unit:"),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Continue to Decimal"),
              ),
              const SizedBox(height: 24),
              _sectionTitle("Note:"),
              const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Add any additional notes",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  const Text("Add to Reminder List"),
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: AddButton(title: "Save", onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _twoFields(String label1, String label2) {
    return Column(
      children: [
        _textField(label1),
        const SizedBox(height: 12),
        _textField(label2),
      ],
    );
  }

  Widget _uploadRow(String label1, String label2) {
    return Column(
      children: [
        const SizedBox(height: 12),
        _uploadField(label1),
        const SizedBox(height: 12),
        _uploadField(label2),
      ],
    );
  }

  Widget _singleField(String label) {
    return _textField(label);
  }

  Widget _textField(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: '',
              border: OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadField(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload),
            label: const Text("Upload"),
          ),
        ],
      ),
    );
  }

  Widget _additionalDocumentRow(int sl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              sl.toString(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: TextField(
              decoration: const InputDecoration(
                hintText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEEF1FE),
              foregroundColor: const Color(0xFF5A48FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(12),
            ),
            child: const Icon(Icons.upload, size: 20),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(12),
            ),
            child: const Icon(Icons.delete, size: 20),
          ),
        ],
      ),
    );
  }
}
