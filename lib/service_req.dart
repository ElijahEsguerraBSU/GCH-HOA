import 'package:flutter/material.dart';
import 'main.dart'; // Assuming customPrimaryColor is defined here

class ServiceRequestPage extends StatefulWidget {
  @override
  _ServiceRequestState createState() => _ServiceRequestState();
}

class _ServiceRequestState extends State<ServiceRequestPage> {
  String? _selectedCategory; // Holds the currently selected service category

  // Define your service request categories with images and names
  final List<Map<String, String>> serviceCategories = [
    {'name': 'Plumbing Repair', 'image': 'assets/plumbing_repair.png'},
    {'name': 'Electrical Repair', 'image': 'assets/electrical_repair.png'},
    {'name': 'Carpentry Work', 'image': 'assets/carpentry_work.png'},
    {'name': 'Landscaping', 'image': 'assets/landscaping.png'},
    {'name': 'Pest Control', 'image': 'assets/pest_control.png'},
    // Add more service categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Request",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // --- Service Request Categories Title ---
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Service Request Categories:", // Specific title for service requests
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              // --- End Service Request Categories Title ---

              // --- Horizontal Scrollable Service Category Collage ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                child: SizedBox(
                  height: 120, // Height for the horizontal scrollable list of category cards
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemCount: serviceCategories.length,
                    itemBuilder: (context, index) {
                      final category = serviceCategories[index];
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
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.broken_image, size: 40);
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
              // --- Padding below the scrollable ---
              const SizedBox(height: 20),
              // --- End Padding ---

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: TextEditingController(), // Consider making this a state variable
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
                    hintText: "Title", // Hint text specific to service requests
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
                  controller: TextEditingController(), // Consider making this a state variable
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
                    hintText: "Describe the service needed...", // Hint text specific to service requests
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
                      print('Service Request Category: $_selectedCategory');
                      // Add logic to get title and description from TextFields
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Service request for $_selectedCategory submitted!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a service request category.')),
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
                    "Submit Request", // Changed button text
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              const Text(
                "*Service requests will be sent and reviewed by the GCH HOA Connect team*", // Specific disclaimer
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