import 'package:flutter/material.dart';

class LandPropertyViewDialog extends StatelessWidget {
  const LandPropertyViewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Property Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Divider(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Column(
                  children: [
                    Text("HKF REAL ESTATE LTD",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("172/2/B #Ibrahimpur housing"),
                    Center(
                      child: Text(
                          "Phone: 01754245781, 01854247055, 01754245781, 01754245781"),
                    ),
                    Text("Email: hkfrealestatebdbd@gmail.com"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              sectionTitle("Property Details"),
              const Divider(),
              detailRow("Land / Property Name:", "Property test 3",
                  "Land / Property ID:", "PRO-0002"),
              detailRow("উপজেলা/থানা:", "Fatehchuri", "জেলা:", "CTG"),
              detailRow(
                  "মৌজা নাম্বার:", "6000", "জরিপ দেশ/Category:", "Bangladesh"),
              detailRow("খাত নম:", "001010", "", ""),

              sectionTitle("Land Record"),
              const Divider(),
              fileRow("CS খতিয়ান নম:", "555"),
              fileRow("RS খতিয়ান নম:", "999"),
              fileRow("SA খতিয়ান নম:", "777"),
              fileRow("Mutation খতিয়ান নম:", "1243"),
              fileRow("জরিপ দেখার স্থান (CS, RS, CITY):", "124"),

              sectionTitle("Download সাময়িক পট্টা / খতিয়ান কপি"),
              sectionTitle("জমির পূর্বের সকল মালিকানা হস্তান্তরের দলিল"),
              const Divider(),
              fileRow("Doc 1", "", showDownload: true),
              const SizedBox(
                height: 16,
              ),

              sectionTitle("Owner Information"),
              const Divider(),
              detailRow("Name:", "Diad", "Phone Number:", "1379973"),
              detailRow("Present Address:", "ctg", "TIN Number:", "12323"),
              detailRow("NID Number:", "232323", "Photo:", ""),
              downloadText("Open File"),
              downloadText("Open File"),
              const Divider(),

              sectionTitle("Note"),
              const Text("Test note"),

              sectionTitle("Land Details"),
              const Divider(),
              detailRow("Area:", "222.20 Decimal", "Unit:", "Decimal"),
              detailRow("Total Plot:", "N/A", "", ""),

              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white),
                      child: const Text("Print"),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), //
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      child: const Text("Save"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget detailRow(String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Expanded(child: Text("$label1 $value1")),
          Expanded(child: Text("$label2 $value2")),
        ],
      ),
    );
  }

  Widget fileRow(String label, String value, {bool showDownload = true}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Expanded(child: Text("$label $value")),
          if (showDownload)
            const Text("Open File", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget downloadText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16),
      child: Text(text, style: const TextStyle(color: Colors.blue)),
    );
  }
}
