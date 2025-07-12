import 'package:flutter/material.dart';
import '../data/doctors_data.dart';
import '../models/doctor.dart';
import '../widgets/doctor_card.dart';
import '../widgets/filter_chip_widget.dart';

class DoctorsListPage extends StatefulWidget {
  final String specialtyName;

  const DoctorsListPage({
    Key? key,
    required this.specialtyName,
  }) : super(key: key);

  @override
  State<DoctorsListPage> createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  List<Doctor> doctors = [];
  List<Doctor> filteredDoctors = [];
  String selectedFilter = 'All';
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    doctors = DoctorsData.getDoctorsBySpecialty(widget.specialtyName);
    filteredDoctors = doctors;
  }

  void filterDoctors(String filter) {
    setState(() {
      selectedFilter = filter;
      switch (filter) {
        case 'Online':
          filteredDoctors = doctors.where((doctor) => doctor.isOnline).toList();
          break;
        case 'Verified':
          filteredDoctors = doctors.where((doctor) => doctor.isVerified).toList();
          break;
        case 'Rating':
          filteredDoctors = doctors.where((doctor) => doctor.rating >= 4.5).toList();
          break;
        default:
          filteredDoctors = doctors;
      }
    });
  }

  void searchDoctors(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDoctors = doctors;
      } else {
        filteredDoctors = doctors
            .where((doctor) =>
        doctor.name.toLowerCase().contains(query.toLowerCase()) ||
            doctor.hospital.toLowerCase().contains(query.toLowerCase()) ||
            doctor.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.specialtyName} Doctors',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.white),
            onPressed: () {
              // Sort functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                onChanged: searchDoctors,
                decoration: InputDecoration(
                  hintText: 'Search doctors, hospitals...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
            ),
            // Filter Chips
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChipWidget(
                    label: 'All',
                    isSelected: selectedFilter == 'All',
                    onTap: () => filterDoctors('All'),
                  ),
                  FilterChipWidget(
                    label: 'Online',
                    isSelected: selectedFilter == 'Online',
                    onTap: () => filterDoctors('Online'),
                  ),
                  FilterChipWidget(
                    label: 'Verified',
                    isSelected: selectedFilter == 'Verified',
                    onTap: () => filterDoctors('Verified'),
                  ),
                  FilterChipWidget(
                    label: 'Top Rated',
                    isSelected: selectedFilter == 'Rating',
                    onTap: () => filterDoctors('Rating'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Results Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '${filteredDoctors.length} doctors found',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Doctors List
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return DoctorCard(
                    doctor: doctor,
                    onTap: () {
                      // Navigate to doctor profile
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}