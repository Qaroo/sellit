class ProductRoutePath {
  final String id;
  final List<String> tags;
  final bool isUnknown;
  final bool isCollection;

  ProductRoutePath.home()
      : id = null,
        tags = [],
        isUnknown = false,
        isCollection = false;

  ProductRoutePath.details(this.id)
      : isUnknown = false,
        tags = [],
        isCollection = false;

  ProductRoutePath.unknown()
      : this.id = null,
        tags = [],
        isUnknown = true,
        isCollection = false;

  ProductRoutePath.collection(this.tags)
      : this.id = null,
        isUnknown = false,
        isCollection = true;

  bool get isHomePage => id == null && !isCollection;
  bool get isProductPage => id != null && !isCollection;
}
