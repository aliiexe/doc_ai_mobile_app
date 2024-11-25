import 'package:flutter/material.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  // Sample data: List of diseases, each with multiple medications
  final List<Map<String, dynamic>> _historyData = [
    {
      'disease': 'Hypertension',
      'medications': [
        {
          'name': 'Amlodipine',
          'dosage': '5mg',
          'description': 'Once daily',
        },
        {
          'name': 'Lisinopril',
          'dosage': '10mg',
          'description': 'Once daily',
        },
      ],
    },
    {
      'disease': 'Diabetes',
      'medications': [
        {
          'name': 'Metformin',
          'dosage': '500mg',
          'description': 'Twice daily',
        },
        {
          'name': 'Insulin',
          'dosage': '20 units',
          'description': 'As needed for blood sugar levels',
        },
      ],
    },
    {
      'disease': 'Asthma',
      'medications': [
        {
          'name': 'Salbutamol Inhaler',
          'dosage': 'As needed',
          'description': 'Use during asthma attacks',
        },
      ],
    },
    {
      'disease': 'Migraine',
      'medications': [
        {
          'name': 'Sumatriptan',
          'dosage': '50mg',
          'description': 'As needed for attacks',
        },
      ],
    },
    {
      'disease': 'Hyperthyroidism',
      'medications': [
        {
          'name': 'Propylthiouracil',
          'dosage': '50mg',
          'description': 'Twice daily',
        },
      ],
    },
    {
      'disease' : 'anxiety',
      'medications' : [
        {
          'name' : 'Alprazolam',
          'dosage' : '0.5mg',
          'description' : 'Once daily'
        },
        {
          'name' : 'Diazepam',
          'dosage' : '5mg',
          'description' : 'Once daily'
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Health History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: ListView.builder(
          itemCount: _historyData.length,
          itemBuilder: (context, index) {
            final diseaseData = _historyData[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Color(0xFFF3F3F3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Disease Title
                    Text(
                      diseaseData['disease']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12.0),

                    // Loop through each medication for this disease
                    for (var medication in diseaseData['medications'])
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.medical_services,
                              size: 20,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                '${medication['name']} (${medication['dosage']})\n${medication['description']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
