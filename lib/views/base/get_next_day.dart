import '../../models/clientModel/single_coach_profile_model.dart';

TimeSlot? getFirstAvailableSlot(Availability availability) {
  final days = [
    availability.monday,
    availability.tuesday,
    availability.wednesday ?? [],
    availability.thursday ?? [],
    availability.friday ?? [],
    availability.saturday ?? [],
    availability.sunday ?? [],
  ];

  for (var daySlots in days) {
    if (daySlots.isNotEmpty) {
      return daySlots.first;
    }
  }

  return null;
}