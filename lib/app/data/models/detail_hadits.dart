class DetailHaditsModel {
  final String? name;
  final String? slug;
  final int? total;
  final Pagination? pagination;
  final List<Item>? items;

  DetailHaditsModel({
    this.name,
    this.slug,
    this.total,
    this.pagination,
    this.items,
  });

  factory DetailHaditsModel.fromJson(Map<String, dynamic> json) => DetailHaditsModel(
        name: json["name"],
        slug: json["slug"],
        total: json["total"],
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "total": total,
        "pagination": pagination?.toJson(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final int? number;
  final String? arab;
  final String? id;

  Item({
    this.number,
    this.arab,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };
}

class Pagination {
  final int? totalItems;
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;
  final int? startPage;
  final int? endPage;
  final int? startIndex;
  final int? endIndex;
  final List<int>? pages;

  Pagination({
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

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
        startPage: json["startPage"],
        endPage: json["endPage"],
        startIndex: json["startIndex"],
        endIndex: json["endIndex"],
        pages: json["pages"] == null ? [] : List<int>.from(json["pages"]!.map((x) => x)),
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
        "pages": pages == null ? [] : List<dynamic>.from(pages!.map((x) => x)),
      };
}
