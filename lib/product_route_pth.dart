class RoutePath {
  final bool isUnknown;
  final bool isCart;
  final bool isHome;
  final bool isCollection;
  final List<String> tags;
  final bool isProductPage;
  final String productID;

  RoutePath.home()
      : isHome = true,
        isUnknown = false,
        isCart = false,
        isCollection = false,
        tags = null,
        isProductPage = false,
        productID = null;

  RoutePath.unknown()
      : isHome = false,
        isUnknown = true,
        isCart = false,
        isCollection = false,
        tags = null,
        isProductPage = false,
        productID = null;

  RoutePath.cart()
      : isHome = false,
        isUnknown = false,
        isCart = true,
        isCollection = false,
        tags = null,
        isProductPage = false,
        productID = null;

  RoutePath.collection(this.tags)
      : isHome = false,
        isUnknown = false,
        isCart = false,
        isCollection = true,
        isProductPage = false,
        productID = null;

  RoutePath.productPage(this.productID)
      : isHome = false,
        isUnknown = false,
        isCart = false,
        isCollection = false,
        isProductPage = true,
        tags = null;
}
