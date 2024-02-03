import 'package:flutter/material.dart';
import 'package:nurse_app/screens/add_patient.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nurse App'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Today',
            ),
            Tab(
              text: 'Active',
            ),
            Tab(
              text: 'Discharged',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text('Today')),
          Center(child: Text('Active')),
          Center(child: Text('Discharged')),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPatientScreen(),
                  ));
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
