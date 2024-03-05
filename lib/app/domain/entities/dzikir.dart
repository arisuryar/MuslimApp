import 'package:equatable/equatable.dart';

class Dzikir extends Equatable {
  final String? arab;
  final String? indo;
  final String? type;
  final String? ulang;

  const Dzikir({
    this.arab,
    this.indo,
    this.type,
    this.ulang,
  });

  @override
  List<Object?> get props => [arab, indo, type, ulang];
}
