import 'package:doc_app/pages/Auth.dart';
import 'package:doc_app/pages/DoctorsPage.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:doc_app/pages/SearchPage.dart';
import 'package:doc_app/pages/HistoryPage.dart';
import 'package:doc_app/pages/ProfilePage.dart';
import 'package:doc_app/pages/CompatibilityPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Layoutpage extends StatefulWidget {
  const Layoutpage({super.key});

  @override
  State<Layoutpage> createState() => _LayoutpageState();
}

class _LayoutpageState extends State<Layoutpage> {
  int _selectedIndex = 0;

  // Sample Notifications
  final List<String> _notifications = [
    "Your appointment with Dr. Smith is confirmed for tomorrow at 10:00 AM.",
    "Lab test results are available. Check your email.",
    "New doctor recommendations based on your profile.",
    "Your profile was updated successfully.",
    "Reminder: Follow-up appointment on 25th Nov.",
    "Alice has shared her health records with you."
  ];

  static const List<Widget> _listPages = <Widget>[
    Searchpage(),
    Historypage(),
    Doctorspage(),
    Compatibilitypage(),
    Profilepage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showNotificationsPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notifications"),
          content: SizedBox(
            width: double.maxFinite,
            height: 200, // Adjust the height based on content
            child: ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.notification_important, color: Colors.blue),
                  title: Text(
                    _notifications[index],
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DocAI',
          style: TextStyle(
            color: Colors.lightBlue,
            fontWeight: FontWeight.w900,
            fontFamily: 'poppins',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Stack(
              clipBehavior: Clip.none, // Allow the badge to overflow outside the stack
              children: [
                // Notification Icon
                IconButton(
                  icon: const Icon(HugeIcons.strokeRoundedNotification02),
                  onPressed: _showNotificationsPopup,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                // Notification Badge
                if (_notifications.isNotEmpty)
                  Positioned(
                    top: -1, // Position it above the icon
                    right: 2, // Position it to the right outside the icon
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14, // Smaller badge
                        minHeight: 14,
                      ),
                      child: Text(
                        '${_notifications.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10, // Smaller text
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: _listPages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: CurvedNavigationBar(
          index: _selectedIndex,
          height: 70.0,
          items: const <Widget>[
            Icon(HugeIcons.strokeRoundedSearch01,
                size: 30, color: Colors.white),
            Icon(HugeIcons.strokeRoundedBook04, size: 30, color: Colors.white),
            Icon(HugeIcons.strokeRoundedDoctor01,
                size: 30, color: Colors.white),
            Icon(HugeIcons.strokeRoundedCheckmarkCircle02,
                size: 30, color: Colors.white),
            Icon(HugeIcons.strokeRoundedUser, size: 30, color: Colors.white),
          ],
          color: Color(0xFF318CC1),
          buttonBackgroundColor: Color(0xFF318CC1),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
