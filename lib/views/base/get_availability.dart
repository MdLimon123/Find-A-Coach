import '../../models/clientModel/single_coach_profile_model.dart';

String? getDayNameOfSlot(Availability availability, TimeSlot slot) {
  final availabilityMap = availability.toJson();
  for (var entry in availabilityMap.entries) {
    final slots = (entry.value as List).map((e) => TimeSlot.fromJson(e)).toList();
    if (slots.any((s) => s.from == slot.from && s.to == slot.to)) {
      return entry.key; // day name
    }
  }
  return null;
}