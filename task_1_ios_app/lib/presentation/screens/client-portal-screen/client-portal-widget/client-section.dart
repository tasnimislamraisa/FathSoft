import 'package:task_1_ios_app/my-imports.dart';

class RegisterClientSection extends StatefulWidget {
  const RegisterClientSection({super.key});

  @override
  State<RegisterClientSection> createState() => _RegisterClientSectionState();
}

class _RegisterClientSectionState extends State<RegisterClientSection> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _dob = TextEditingController();
    final TextEditingController _marrigeAni = TextEditingController();
    String? selectedReligion;

    return SectionContainer(
      title: "Register Client",
      child: Column(
        children: [
          const ReusableInput(hint: "Enter name"),
          const SizedBox(height: 12),
          const ReusableInput(hint: "Enter father's name"),
          const SizedBox(height: 12),
          const ReusableInput(hint: "Enter mother's name"),
          const SizedBox(height: 12),
          ReusableDateSearch(
            label: "Date of Birth",
            controller: _dob,
          ),
          const SizedBox(height: 12),
          ReusableDateSearch(
            label: "Marrige Anniversary Date",
            controller: _marrigeAni,
          ),
          const SizedBox(height: 12),
          const ReusableInput(hint: "Enter mother's name"),
          const SizedBox(height: 12),
          ReusableDropdown(
            value: selectedReligion,
            items: ["Muslim", "Hindu", "Christian"],
            onChanged: (value) {
              setState(() {
                selectedReligion = value;
              });
            },
            hint: 'Religion',
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 12),
          const ReusableInput(hint: "Nationality"),
          const SizedBox(height: 12),
          const ReusableInput(hint: "Phone Number"),
          const SizedBox(height: 12),
          const ReusableInput(hint: "Email Address"),
          const SizedBox(height: 12),
          const ReusableInput(hint: "TIN Number"),
          const SizedBox(height: 12),
          const ReusableInput(hint: "NID Number"),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final bool isRequired = title.trim().startsWith("*");
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 12),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isRequired ? Colors.red.shade700 : Colors.black,
        ),
      ),
    );
  }
}

class ReusableDropdown extends StatelessWidget {
  final String? value;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const ReusableDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// Same pattern for:
class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Contact Info",
      child: Column(
        children: [
          Row(children: [
            Expanded(child: ReusableInput(hint: "Enter phone number")),
            const SizedBox(width: 12),
            Expanded(child: ReusableInput(hint: "Enter email"))
          ]),
        ],
      ),
    );
  }
}

class NomineeSection extends StatelessWidget {
  const NomineeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Nominee Details",
      child: Column(
        children: [
          ReusableInput(hint: "Enter nominee name"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter nominee phone number"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter nominee Email"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter nominee NID"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter Relation with Owner"),
        ],
      ),
    );
  }
}

class PresentAddressSection extends StatelessWidget {
  const PresentAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Present Address",
      child: _addressSection(),
    );
  }
}

class _addressSection extends StatelessWidget {
  const _addressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusableInput(hint: "Enter village"),
        SizedBox(height: 12),
        ReusableInput(hint: "Enter post code"),
        SizedBox(height: 12),
        ReusableInput(hint: "Enter police Station"),
        SizedBox(height: 12),
        ReusableInput(hint: "Enter District"),
        SizedBox(height: 12),
        ReusableInput(hint: "Enter Address Line 1"),
        SizedBox(height: 12),
        ReusableInput(hint: "Enter Address Line 2"),
      ],
    );
  }
}

class PermanentAddressSection extends StatelessWidget {
  const PermanentAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Permanent Address",
      child: _addressSection(),
    );
  }
}

class BankingSection extends StatelessWidget {
  const BankingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Banking Details",
      child: Column(
        children: [
          ReusableInput(hint: "Enter account name"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter bank name"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter brunch name"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter Account Number"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter Routing Number"),
        ],
      ),
    );
  }
}

class MobileBanking extends StatelessWidget {
  const MobileBanking({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Banking Details",
      child: Column(
        children: [
          ReusableInput(hint: "Enter Bkash Number"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter Nagad Number"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter Rocket Number"),
          const SizedBox(height: 12),
          ReusableInput(hint: "Enter Dutch Bangla Number"),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class UploadSection extends StatefulWidget {
  const UploadSection({super.key});

  @override
  State<UploadSection> createState() => _UploadSectionState();
}

class _UploadSectionState extends State<UploadSection> {
  String? apartment;

  Widget _uploadField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        ElevatedButton.icon(
          onPressed: () {
            // Implement file picking logic here
          },
          icon: const Icon(Icons.cloud_upload_outlined),
          label: const Text("Choose File"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: const Size(double.infinity, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: "Attachments",
      child: Column(
        children: [
          ReusableInput(hint: "Share"),
          const SizedBox(height: 8),
          ReusableDropdown(
            value: apartment,
            items: ["A01", "B05", "A04"],
            onChanged: (value) {
              setState(() {
                apartment = value;
              });
            },
            hint: 'Select Apartment or Flat',
          ),
          const SizedBox(height: 8),
          ReusableInput(hint: "Enter Your Lottery Number"),
          const SizedBox(height: 8),
          _uploadField("National ID:"),
          const SizedBox(height: 8),
          _uploadField("Passport:"),
          const SizedBox(height: 8),
          _uploadField("Tin:"),
          const SizedBox(height: 8),
          _uploadField("Photo:"),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
