import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'title': 'Health Checks',
      'image': 'assets/images/checkup.png',
      'color': Colors.redAccent,
    },
    {
      'title': 'Diagnostic Checks',
      'image': 'assets/images/diagnostic.png',
      'color': Colors.deepPurple,
    },
    {
      'title': 'Medicines & Pharmacy',
      'image': 'assets/images/examination.png',
      'color': Colors.blue,
    },
    {
      'title': 'Wellness Store',
      'image': 'assets/images/relief.png',
      'color': Colors.green,
    },
    {
      'title': 'Diet Consultations',
      'image': 'assets/images/test.png',
      'color': Colors.green,
    },
    {
      'title': 'Emotional Therapy',
      'image': 'assets/images/test.png',
      'color': Colors.green,
    },
    {
      'title': 'Consult a doctor',
      'image': 'assets/images/dental-check.png',
      'color': Colors.green,
    },
    {
      'title': 'Gym Membership',
      'image': 'assets/images/test.png',
      'color': Colors.green,
    },
    {
      'title': 'Vision Care',
      'image': 'assets/images/test.png',
      'color': Colors.green,
    },
    {
      'title': 'Dental Care',
      'image': 'assets/images/dental-check.png',
      'color': Colors.green,
    },
    {
      'title': 'Wellness Plans',
      'image': 'assets/images/test.png',
      'color': Colors.green,
    },
    {
      'title': 'Vaccinations',
      'image': 'assets/images/x-ray.png',
      'color': Colors.green,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 1000
            ? 5
            : constraints.maxWidth > 600
            ? 3
            : 2;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                onTap: () {
                  print("Tapped on ${service['title']}");
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: service['color'],
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                            service['image'],
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          service['title'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
