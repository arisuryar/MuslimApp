import 'package:equatable/equatable.dart';

class Doa extends Equatable {
  final String? arab;
  final String? indo;
  final String? judul;
  final String? source;

  const Doa({
    this.arab,
    this.indo,
    this.judul,
    this.source,
  });

  @override
  List<Object?> get props => [arab, indo, judul, source];
}
