import 'package:intl/intl.dart';

extension StringX on String {

  String formatDate(String format) {
    final date = DateTime.parse(this);
    return DateFormat(format).format(date);
  }
}