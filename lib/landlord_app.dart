import 'package:flutter/material.dart';
import 'main.dart'; // Make sure this import correctly points to where customPrimaryColor is defined

class LandlordApplicationPage extends StatelessWidget {
  const LandlordApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Landlord Application",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: customPrimaryColor, // Uses the custom primary color
        leading: const BackButton( // Using const for BackButton
          color: Color(0xffffffff),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // New Tutorial Section (separated from the card and aligned to the left and right)
            Padding( // Padding around the tutorial section
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                children: [
                  const Text(
                    "How to apply to be a landlord?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // Removed Align here, Container will now expand to fill available width
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1. Fill out the Landlord Application Details."),
                        Text("2. Download and answer the Landlord Application Form."),
                        Text("3. Upload the Landlord Application Form."),
                        Text("4. Submit"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spacing between tutorial and the card

            // Encapsulated content with white background and dropshadow
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10), // Adjust top padding as tutorial is now above
              child: Card(
                elevation: 4, // This creates the dropshadow effect
                color: Colors.white, // Ensures a white background for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Optional: rounded corners for the card
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Padding inside the card for its content
                  child: Column( // Removed 'const' here as MainAxisSize is not a const value
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Text for "Landlord Application"
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "LANDLORD APPLICATION DETAILS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      // Full Name TextField
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextField(
                          controller: TextEditingController(),
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
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: const Color(0xfff2f2f3),
                            isDense: true,
                            contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          ),
                        ),
                      ),
                      // Home Address TextField
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextField(
                          controller: TextEditingController(),
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
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Home Address",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: const Color(0xfff2f2f3),
                            isDense: true,
                            contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          ),
                        ),
                      ),
                      // Phone Number TextField
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextField(
                          controller: TextEditingController(),
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
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: const Color(0xfff2f2f3),
                            isDense: true,
                            contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          ),
                        ),
                      ),
                      // Years of Residency TextField
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          controller: TextEditingController(),
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
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Years of Residency",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: const Color(0xfff2f2f3),
                            isDense: true,
                            contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          ),
                        ),
                      ),
                      // Row for Download and Upload Buttons
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0), // Add padding below the buttons
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute space evenly
                          children: [
                            // Download Application Form Button
                            MaterialButton(
                              onPressed: () {
                                // Logic to handle application form download
                                print("Download Application Form button pressed!");
                              },
                              color: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              textColor: Colors.black,
                              height: 40,
                              minWidth: 150, // Adjust width as needed
                              child: const Text(
                                "Download Form",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            // Upload Application Form Button (inside the card)
                            MaterialButton(
                              onPressed: () {
                                // Logic to handle application form upload
                                print("Upload Application Form button pressed!");
                              },
                              color: Colors.white, // Changed to white
                              elevation: 4, // Added dropshadow
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                // Removed 'side' to remove the border
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              textColor: Colors.black, // Changed text color to black (default)
                              height: 40,
                              minWidth: 150, // Adjust width as needed
                              child: const Text(
                                "Upload Form",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Submit Application Button (outside the card)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: MaterialButton(
                onPressed: () {
                  // Logic to submit the landlord application
                  print("Submit Application button pressed!");
                },
                color: const Color(0xff3a57e9), // A distinct color for the submit button
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: Color(0xff808080), width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                textColor: const Color(0xffffffff),
                height: 40,
                minWidth: 180,
                child: const Text(
                  "Submit Application",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            // Application Status Section (moved outside the card and adjusted alignment)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Match card padding for alignment
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align the column content to the start
                children: [
                  Row( // Row to hold "Application Status:" and "Pending"
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between children
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 10.0), // Adjust padding
                        child: Text(
                          "Application Status:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding( // Wrap the Container in Padding to control its top/bottom spacing
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Container( // "Pending" container
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: const Text(
                            "Pending",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "* Your application is currently under review...",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}