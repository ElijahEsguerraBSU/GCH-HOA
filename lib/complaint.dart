import 'package:flutter/material.dart';
import 'main.dart'; // Assuming customPrimaryColor is defined here

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  String? _selectedCategory; // Holds the currently selected category

  // Define your complaint categories with images and names
  final List<Map<String, String>> complaintCategories = [
    {'name': 'Property Damage', 'image': 'assets/property_damage.png'},
    {'name': 'Parking Violations', 'image': 'assets/parking_violation.png'},
    {'name': 'Pet Issues', 'image': 'assets/pet_issues.png'},
    {'name': 'Noise', 'image': 'assets/noise.png'},
    {'name': 'Maintenance Issues', 'image': 'assets/maintenance_issues.png'}, // Added new category
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        backgroundColor: customPrimaryColor,
        leading: const BackButton(
          color: Color(0xffffffff),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align to start
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // --- New Title: "What is your complaint?" ---
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0), // Add some bottom padding
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What is your complaint?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20, // Increased font size for prominence
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              // --- End New Title ---

              // --- Categories Title ---
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10), // Adjusted padding
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              // --- End Categories Title ---

              // --- Horizontal Scrollable Category Collage ---
              Padding( // This padding wraps the scrollable list
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                child: SizedBox(
                  height: 120, // Height for the horizontal scrollable list of category cards
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 0.0), // Padding inside ListView
                    itemCount: complaintCategories.length,
                    itemBuilder: (context, index) {
                      final category = complaintCategories[index];
                      final isSelected = _selectedCategory == category['name'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = category['name'];
                          });
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                          elevation: isSelected ? 8 : 2, // Highlight selected card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: isSelected
                                ? BorderSide(color: customPrimaryColor, width: 3.0)
                                : BorderSide.none,
                          ),
                          child: Container(
                            width: 100, // Fixed width for each category card
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  category['image']!,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.contain, // Use contain for icons/logos
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.broken_image, size: 40); // Fallback icon
                                  },
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  category['name']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? customPrimaryColor : Colors.black87,
                                    fontSize: 10,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // --- Added padding below the scrollable ---
              const SizedBox(height: 20), // Adjust this value for more or less space
              // --- End Added padding ---

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: TextEditingController(), // You might want to make this a state variable
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    hintText: "Title",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: const Color(0xfff2f2f3),
                    isDense: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  controller: TextEditingController(), // You might want to make this a state variable
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 8,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                    ),
                    hintText: "What is the problem?",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: const Color(0xfff2f2f3),
                    isDense: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: MaterialButton(
                  onPressed: () {
                    // Handle submission logic here
                    if (_selectedCategory != null) {
                      print('Complaint Category: $_selectedCategory');
                      // Add logic to get title and description from TextFields
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Complaint for $_selectedCategory submitted!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a complaint category.')),
                      );
                    }
                  },
                  color: const Color(0xff3a57e8),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Color(0xff808080), width: 1),
                  ),
                  padding: const EdgeInsets.all(16),
                  textColor: const Color(0xffffffff),
                  height: 40,
                  minWidth: 140,
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              const Text(
                "*Complaints will be sent and reviewed by the GCH HOA Connect team*",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 8,
                  color: Color(0x80000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}