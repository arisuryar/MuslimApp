import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../common/state_enum.dart';
import '../../../data/models/sholat.dart';
import '../../../data/datasources/location_service.dart';
import '../../../data/datasources/sholat_service.dart';
import '../../detail_hadits/detail_hadits.dart';

class HomeController extends GetxController {
  final sholatService = Get.find<SholatService>();
  final locationService = Get.find<LocationService>();

  List tab = [
    "Al-Qur'an",
    'Hadits',
    "Do'a",
    'Dzikir',
  ];

  final _city = ''.obs;
  final _country = ''.obs;

  set city(String n) => _city.value = n;
  set country(String n) => _country.value = n;

  String get city => _city.value;
  String get country => _country.value;

  // Get Permission GPS and Location Users
  Future<List<Placemark>?> getLocation() async {
    final isPermission = await locationService.handlePermission;
    if (isPermission != true) return null;
    final currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
    return placemark;
  }

  Rx<RequestState> sholatState = Rx<RequestState>(RequestState.initial);
  final _sholat = SholatModel().obs;
  SholatModel get sholat => _sholat.value;

  // getSholat From Sholat Service
  getSholat() async {
    final placemark = await getLocation();
    if (placemark == null) return;
    city = placemark[0].subAdministrativeArea!;
    country = placemark[0].country!;
    sholatState.value = RequestState.loading;
    final data = await sholatService.fetchSurah(city.replaceAll('Kota ', ''), country);
    if (data == null) {
      sholatState.value = RequestState.error;
      return null;
    }
    sholatState.value = RequestState.success;
    _sholat.value = data;
  }

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
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  void onInit() async {
    super.onInit();
    _date.value = _formatDate(DateTime.now());
    _time.value = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getDateTime());
    getSholat();
  }
}
