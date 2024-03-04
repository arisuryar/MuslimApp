import 'package:equatable/equatable.dart';

class DetailHadits extends Equatable {
  final String? name;
  final String? slug;
  final int? total;
  final Pagination? pagination;
  final List<Item>? items;

  const DetailHadits({
    this.name,
    this.slug,
    this.total,
    this.pagination,
    this.items,
  });

  @override
  List<Object?> get props => [name, slug, total, pagination, items];
}

class Item extends Equatable {
  final int? number;
  final String? arab;
  final String? id;

  const Item({
    this.number,
    this.arab,
    this.id,
  });

  @override
  List<Object?> get props => [number, arab, id];
}

class Pagination extends Equatable {
  final int? totalItems;
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;
  final int? startPage;
  final int? endPage;
  final int? startIndex;
  final int? endIndex;
  final List<int>? pages;

  const Pagination({
    this.totalItems,
    this.currentPage,
    this.pageSize,
    this.totalPages,
    this.startPage,
    this.endPage,
    this.startIndex,
    this.endIndex,
    this.pages,
  });

  @override
  List<Object?> get props => [totalItems, currentPage, pageSize, totalPages, startPage, endPage, startIndex, endIndex, pages];
}
