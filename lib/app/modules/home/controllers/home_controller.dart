import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  List tab = [
    "Al-Qur'an",
    'Hadits',
    "Do'a",
    'Dzikir',
  ];

  // Date and Time
  String get date => _date.value;
  String get time => _time.value;

  final _date = ''.obs;
  final _time = ''.obs;

  void _getDateTime() {
    final DateTime now = DateTime.now();
    final formattedDate = _formatDate(now);
    final formattedTime = _formatTime(now);
    _date.value = formattedDate;
    _time.value = formattedTime;
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd MMMM y').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  @override
  void onInit() {
    super.onInit();
    _date.value = _formatDate(DateTime.now());
    _time.value = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getDateTime());
  }
}
