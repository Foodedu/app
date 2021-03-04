import 'package:intl/intl.dart';

extension FormatterDateTime on DateTime {
  String formatDDMM() {
    try {
      return DateFormat('dd MMM').format(this);
    } catch (_) {
      return '';
    }
  }
}
