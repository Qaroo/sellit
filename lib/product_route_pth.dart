class ProductRoutePath {
  final String id;
  final List<String> tags;
  final bool isUnknown;
  final bool isCollection;
  final bool isCart;

  ProductRoutePath.home()
      : id = null,
        isCart = false,
        tags = [],
        isUnknown = false,
        isCollection = false;

  ProductRoutePath.details(this.id)
      : isUnknown = false,
        isCart = false,
        tags = [],
        isCollection = false;

  ProductRoutePath.unknown()
      : this.id = null,
        tags = [],
        isCart = false,
        isUnknown = true,
        isCollection = false;

  ProductRoutePath.collection(this.tags)
      : this.id = null,
        isCart = false,
        isUnknown = false,
        isCollection = true;

  ProductRoutePath.cart()
      : this.id = null,
        this.tags = [],
        isCart = true,
        isUnknown = false,
        isCollection = false;

  bool get isHomePage => id == null && !isCollection && !isCart;
  bool get isProductPage => id != null && !isCollection && !isCart;
}
