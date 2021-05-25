import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/TempView.dart';
import 'package:pentagonselllit/product_route_pth.dart';

import 'Elements/Pages/ClientHomePage.dart';
import 'Elements/Pages/ClientPages/ShopProductPage.dart';
import 'Elements/Pages/ClientPages/ShopProductsPage.dart';
import 'Elements/Pages/UnknownPage.dart';
import 'Models/ItemModel.dart';
import 'package:pentagonselllit/args.dart';

class ShopRouteInformationParser
    extends RouteInformationParser<ProductRoutePath> {
  @override
  Future<ProductRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.length == 0) return ProductRoutePath.home();

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == "product") {
        return ProductRoutePath.details(uri.pathSegments[1]);
      }
    }

    if (uri.pathSegments[0] == "collection") {
      return ProductRoutePath.collection();
    }

    return ProductRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(ProductRoutePath path) {
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
  bool show404 = false;
  bool isProduct = false;
  bool isCollection = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  ProductRoutePath get currentConfiguration {
    if (show404) return ProductRoutePath.unknown();

    if (_productID == null && !isCollection) return ProductRoutePath.home();

    if (isCollection) return ProductRoutePath.collection();

    return ProductRoutePath.details(_productID);
  }

  @override
  Widget build(BuildContext context) {
    ItemModel product = args.products[0];
    for (ItemModel item in args.products) {
      if (item.id == _productID) product = item;
    }
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: ClientHomePage(domain: "localhost:49954"),
        ),
        if (isProduct)
          MaterialPage(
            child: TemplateView(
              widgets: ProductPageStyle1(context, product),
            ),
          ),
        if (isCollection)
          MaterialPage(
            key: ValueKey('CollectionPage'),
            child: TemplateView(
              widgets: ShopProductPageStyle2(context),
            ),
          ),
        if (show404)
          MaterialPage(key: ValueKey('UknownKey'), child: UnknownPage()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        _productID = null;
        show404 = false;
        isCollection = false;
        isProduct = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(ProductRoutePath path) async {
    isProduct = path.isProductPage;
    if (path.isUnknown) {
      _productID = null;
      show404 = true;
      isProduct = false;
      return;
    }

    if (path.isProductPage) {
      _productID = path.id;
    } else if (path.isCollection) {
      _productID = null;
      isProduct = false;
      isCollection = true;
    } else {
      _productID = null;
    }

    show404 = false;

    notifyListeners();
  }
}
