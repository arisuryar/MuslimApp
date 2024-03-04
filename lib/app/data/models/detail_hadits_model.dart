import 'package:equatable/equatable.dart';
import '../../domain/entities/detail_hadits.dart';

class DetailHaditsModel extends Equatable {
  final String name;
  final String slug;
  final int total;
  final PaginationModel pagination;
  final List<ItemModel> items;

  const DetailHaditsModel({
    required this.name,
    required this.slug,
    required this.total,
    required this.pagination,
    required this.items,
  });

  factory DetailHaditsModel.fromJson(Map<String, dynamic> json) => DetailHaditsModel(
        name: json["name"],
        slug: json["slug"],
        total: json["total"],
        pagination: PaginationModel.fromJson(json["pagination"]),
        items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "total": total,
        "pagination": pagination.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };

  DetailHadits toEntity() => DetailHadits(
        name: name,
        slug: slug,
        total: total,
        pagination: pagination.toEntity(),
        items: items.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [name, slug, total, pagination, items];
}

class ItemModel extends Equatable {
  final int? number;
  final String? arab;
  final String? id;

  const ItemModel({
    this.number,
    this.arab,
    this.id,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };

  Item toEntity() => Item(number: number, arab: arab, id: id);

  @override
  List<Object?> get props => [number, arab, id];
}

class PaginationModel extends Equatable {
  final int? totalItems;
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;
  final int? startPage;
  final int? endPage;
  final int? startIndex;
  final int? endIndex;
  final List<int>? pages;

  const PaginationModel({
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

  factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
        startPage: json["startPage"],
        endPage: json["endPage"],
        startIndex: json["startIndex"],
        endIndex: json["endIndex"],
        pages: List<int>.from(json["pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "currentPage": currentPage,
        "pageSize": pageSize,
        "totalPages": totalPages,
        "startPage": startPage,
        "endPage": endPage,
        "startIndex": startIndex,
        "endIndex": endIndex,
        "pages": List<dynamic>.from(pages!.map((x) => x)),
      };

  Pagination toEntity() => Pagination(
        totalItems: totalItems,
        currentPage: currentPage,
        pageSize: pageSize,
        totalPages: totalPages,
        startPage: startPage,
        endPage: endPage,
        startIndex: startIndex,
        endIndex: endIndex,
        pages: pages,
      );

  @override
  List<Object?> get props => [totalItems, currentPage, pageSize, totalPages, startPage, endPage, startIndex, endIndex, pages];
}
