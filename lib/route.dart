import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/Pages/ClientCollectionPage.dart';
import 'package:pentagonselllit/Elements/TempView.dart';
import 'package:pentagonselllit/product_route_pth.dart';

import 'Elements/Pages/ClientCartPage.dart';
import 'Elements/Pages/ClientHomePage.dart';
import 'Elements/Pages/ClientPages/ShopProductPage.dart';
import 'Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'Elements/Pages/ClientProductPage.dart';
import 'Elements/Pages/UnknownPage.dart';
import 'Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart';
import 'package:pentagonselllit/args.dart' as args;

class ShopRouteInformationParser
    extends RouteInformationParser<ProductRoutePath> {
  @override
  Future<ProductRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments[0] == "cart") {
      return ProductRoutePath.cart();
    }
    if (uri.pathSegments.length == 0) return ProductRoutePath.home();

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == "product") {
        return ProductRoutePath.details(uri.pathSegments[1]);
      }
      if (uri.pathSegments[0] == "collection") {
        List<String> tags = uri.pathSegments[1].split(",");
        return ProductRoutePath.collection(tags);
      }
    }

    if (uri.pathSegments[0] == "collection") {
      return ProductRoutePath.collection([]);
    }

    return ProductRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(ProductRoutePath path) {
    print("xyzy cart::: " + path.isCart.toString());
    print("xyzy collection::: " + path.isCollection.toString());
    print("xyzy unknown::: " + path.isUnknown.toString());
    print("xyzy home::: " + path.isHomePage.toString());

    if (path.isCart) return RouteInformation(location: '/cart');

    if (path.isCollection && path.tags.length > 0) {
      String builder = "";
      for (String current in path.tags) {
        builder += current + ",";
      }
      builder = builder.substring(0, builder.length - 1);
      return RouteInformation(location: '/collection/${builder}');
    }

    if (path.isCollection) return RouteInformation(location: '/collection');
    if (path.isUnknown) return RouteInformation(location: '/404');
    if (path.isHomePage) return RouteInformation(location: '/');
    if (path.isProductPage)
      return RouteInformation(location: '/product/${path.id}');

    return null;
  }
}

class ProductRouterDelegate extends RouterDelegate<ProductRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ProductRoutePath> {
  String _productID;
  List<String> tags;
  bool show404 = false;
  bool isProduct = false;
  bool isCollection = false;
  bool isCart = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  ProductRoutePath get currentConfiguration {
    if (show404) return ProductRoutePath.unknown();

    if (_productID == null && !isCollection && !isCart)
      return ProductRoutePath.home();

    if (isCollection) return ProductRoutePath.collection(tags);

    if (isCart) return ProductRoutePath.cart();

    return ProductRoutePath.details(_productID);
  }

  @override
  Widget build(BuildContext context) {
    print("Tags build: " + tags.toString());
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: ClientHomePage(domain: "shop"),
        ),
        if (isProduct)
          MaterialPage(
            key: ValueKey('ProductPage'),
            child: ClientProductPage(domain: "shop", item_id: _productID),
          ),
        if (isCart)
          MaterialPage(
            key: ValueKey('CartPage'),
            child: ClientCartPage(domain: "shop"),
          ),
        if (isCollection)
          MaterialPage(
            key: ValueKey('CollectionPage'),
            child: ClientCollectionPage(domain: "shop", tags: tags),
          ),
        if (show404)
          MaterialPage(key: ValueKey('UknownKey'), child: UnknownPage()),
      ],
      onPopPage: (route, result) {
        print("xyzy4 ");
        if (!route.didPop(result)) return false;

        _productID = null;
        show404 = true;
        isCollection = false;
        isProduct = false;
        isCart = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(ProductRoutePath path) async {
    isProduct = path.isProductPage;

    if (path.isHomePage) {
      isCart = false;
      isCollection = false;
      _productID = null;
      show404 = false;
      isProduct = false;
      notifyListeners();
      return;
    }
    print("xyzy Continue");

    if (path.isUnknown) {
      isCollection = false;
      _productID = null;
      show404 = true;
      isProduct = false;
      isCart = false;
      notifyListeners();
      return;
    }

    if (path.isCart) {
      isCollection = false;
      _productID = null;
      isCart = true;
      show404 = false;
      isProduct = false;
      notifyListeners();
      return;
    }

    if (path.isProductPage) {
      _productID = path.id;
      isProduct = true;
      isCart = false;
      isCollection = false;
      show404 = false;
      notifyListeners();
    } else if (path.isCollection) {
      tags = path.tags;
      isCart = false;
      _productID = null;
      isProduct = false;
      isCollection = true;
      notifyListeners();
    } else {
      _productID = null;
      notifyListeners();
    }

    show404 = false;

    notifyListeners();
  }
}
