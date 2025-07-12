class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String qualification;
  final String experience;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final String hospital;
  final String location;
  final double consultationFee;
  final List<String> availableDays;
  final String nextAvailableSlot;
  final bool isOnline;
  final bool isVerified;
  final List<String> languages;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.qualification,
    required this.experience,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.hospital,
    required this.location,
    required this.consultationFee,
    required this.availableDays,
    required this.nextAvailableSlot,
    required this.isOnline,
    required this.isVerified,
    required this.languages,
  });
}