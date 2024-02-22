import 'package:flutter_riverpod/flutter_riverpod.dart';

final now = DateTime.now();
final day = now.day.toString().padLeft(2, '0');
final month = now.month.toString().padLeft(2, '0');
final year = now.year.toString();

final formattedDate = '$day.$month.$year';

final formattedDateProvider = StateProvider((ref) {
  return formattedDate;
});
