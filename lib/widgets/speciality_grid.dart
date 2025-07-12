import 'package:ehop_app/widgets/speciality_card.dart';
import 'package:flutter/material.dart';
import '../models/doctor_speciality.dart';
import '../pages/doctors_list_screen.dart';

class SpecialityGrid extends StatelessWidget {
  final List<DoctorSpeciality> specialties;

  const SpecialityGrid({
    Key? key,
    required this.specialties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    int gridColumnCount = screenSize.width > 600 ? 4 : 3;
    double gridChildAspectRatio = screenSize.width > 600 ? 0.85 : 0.80;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridColumnCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: gridChildAspectRatio,
      ),
      itemCount: specialties.length,
      itemBuilder: (context, index) {
        final specialty = specialties[index];
        return SpecialityCard(
          specialty: specialty,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorsListPage(
                  specialtyName: specialty.name,
                ),
              ),
            );
          },
        );
      },
    );
  }
}