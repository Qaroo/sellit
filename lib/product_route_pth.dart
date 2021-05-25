class ProductRoutePath {
  final String id;
  final bool isUnknown;
  final bool isCollection;

  ProductRoutePath.home()
      : id = null,
        isUnknown = false,
        isCollection = false;

  ProductRoutePath.details(this.id)
      : isUnknown = false,
        isCollection = false;

  ProductRoutePath.unknown()
      : this.id = null,
        isUnknown = true,
        isCollection = false;

  ProductRoutePath.collection()
      : this.id = null,
        isUnknown = false,
        isCollection = true;

  bool get isHomePage => id == null && !isCollection;
  bool get isProductPage => id != null && !isCollection;
}
