import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'appointments/appointments.dart';
import 'notes/notes.dart';
import 'tasks/tasks.dart';
import 'contacts/contacts.dart';
import 'utils.dart';

void main() {
  startMeUp() async {
    Directory doscDir = await getApplicationDocumentsDirectory();
    utils.doscDir = docsDir;
    runApp(const FlutterBook());
  }

  startMeUp();
}

class FlutterBook extends StatelessWidget {
  const FlutterBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FlutterBook'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.date_range), text: 'Appointments'),
                Tab(icon: Icon(Icons.contacts), text: 'Contacts'),
                Tab(icon: Icon(Icons.note), text: 'Notes'),
                Tab(icon: Icon(Icons.assignment_turned_in), text: 'Tasks'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Appointments(),
              Contacts(),
              Notes(),
              Tasks(),
            ],
          ),
        ),
      ),
    );
  }
}
