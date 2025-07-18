import 'package:flutter/material.dart';
import 'login.dart';
import 'register_page.dart';
import 'dashboard_page.dart';
import 'profile_page.dart';
import 'vehicle_sticker_registration_page.dart';
import 'billing_page.dart';
import 'facility_booking.dart';
import 'feedback.dart';
import 'incident_report.dart';
import 'service_req.dart';
import 'landlord_app.dart';
import 'complaint.dart';

MaterialColor customPrimaryColor = MaterialColor(
  0xFF0056D8, // Your primary color value (e.g., a shade of blue)
  <int, Color>{
    50: Color(0xFFE0F2F7),
    100: Color(0xFFB3E0ED),
    200: Color(0xFF80D0E2),
    300: Color(0xFF4DBFD8),
    400: Color(0xFF26B2D1),
    500: Color(0xFF00A5CB), // Your main color
    600: Color(0xFF009CC5),
    700: Color(0xFF0090BE),
    800: Color(0xFF0085B8),
    900: Color(0xFF0073AD),
  },
);

const Color customSecondaryColor = Color(0xFFFFA000);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GCH HOA App',
      theme: ThemeData(
        primarySwatch: customPrimaryColor, // Keep this for overall primary usage
        fontFamily: 'TikTok', // Keep your custom font

        // Add the colorScheme to define primary, secondary, and other on-colors
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customPrimaryColor,
          accentColor: customSecondaryColor, // Accent color is often used for selection highlights
        ).copyWith(
          // For Material 3, `secondary` is often used instead of `accentColor`
          // and directly impacts selection in pickers
          secondary: customPrimaryColor, // Or customSecondaryColor if you prefer a different accent
          surface: Colors.white, // Default background for dialogs
          onPrimary: Colors.white, // Text/icons that appear on primary color
          onSurface: Colors.black87, // Text/icons that appear on surface color
        )),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginPage(), 
        '/register': (_) => RegisterPage(),
        '/dashboard': (_) => DashboardPage(),
        '/profile': (_) => ProfilePage(),
        '/vehicleSticker': (_) => VehicleStickerRegistrationPage(),
        '/billing': (_) => BillingPage(),
        '/facilityBooking': (_) => FacilityBooking(),
        '/feedback': (_) => FeedbackPage(),
        '/complaint': (_) => Complaint(),
        '/incidentReport': (_) => IncidentReportPage(),
        '/serviceRequest': (_) => ServiceRequestPage(),
        '/landlordApplication': (_) => LandlordApplicationPage(),
      },
    );
  }
}