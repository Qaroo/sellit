import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/Pages/ClientHomePage.dart';
import 'package:pentagonselllit/args.dart';
import 'package:pentagonselllit/product_route_pth.dart';

import 'Elements/Pages/ClientCartPage.dart';
import 'Elements/Pages/ClientCollectionPage.dart';
import 'Elements/Pages/ClientProductPage.dart';

class SellitRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;
  SellitRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  bool show404 = false;
  bool isHome = false;
  bool isProduct = false;
  String productID = null;
  bool isCollection = false;
  List<String> tags = null;
  bool isCart = false;

  void _handleHomeTapped() {
    isHome = true;
    notifyListeners();
  }

  void _handleProductTapped(String id) {
    productID = id;
    isProduct = true;
    notifyListeners();
  }

  void _handleCollectionTapped(List<String> tags) {
    isCollection = true;
    this.tags = tags;
    notifyListeners();
  }

  void _handleCartTapeed() {
    isCart = true;
    notifyListeners();
  }

  // show the correct path in the url, need to return a book
  // book route path based on current state of the app
  RoutePath get currentConfiguration {
    if (show404) return RoutePath.unknown();

    if (isCart) return RoutePath.cart();

    if (isHome) return RoutePath.home();

    if (isProduct) return RoutePath.productPage(productID);

    if (isCollection) return RoutePath.collection(tags);
  }

  // @override
  // GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen()),
        if (isHome)
          MaterialPage(
            key: ValueKey('HomePage'),
            child: ClientHomePage(
              domain: "shop",
            ),
          ),
        if (isCart)
          MaterialPage(
            key: ValueKey('CartPage'),
            child: ClientCartPage(domain: "shop"),
          ),
        if (isProduct)
          MaterialPage(
            key: ValueKey('ProductPage'),
            child: ClientProductPage(domain: "shop", item_id: productID),
          ),
        if (isCollection)
          MaterialPage(
            key: ValueKey('CollectionPage'),
            child: ClientCollectionPage(domain: "shop", tags: tags),
          ),
      ],
      onPopPage: (route, result) {
        print("page pop");
        if (!route.didPop(result)) {
          return false;
        }

        show404 = false;
        isHome = false;
        isProduct = false;
        productID = null;
        isCollection = false;
        tags = null;
        isCart = false;
        notifyListeners();

        return true;
      },
    );
  }

  // when update of route, updates the app state
  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    if (path.isUnknown) {
      show404 = true;
      // have an empty return to end the function
      return;
    }

    isCart = path.isCart;
    isCollection = path.isCollection;
    isHome = path.isHome;
    isProduct = path.isProductPage;
    show404 = path.isUnknown;
    productID = path.productID;
    tags = path.tags;
    notifyListeners();
    return;
  }
}

class SellitRouteInformationParser extends RouteInformationParser<RoutePath> {
  // Converts the given route information into parsed data to pass to a
  // RouterDelegate
  @override
  Future<RoutePath> parseRouteInformation(RouteInformation routeInfo) async {
    final uri = Uri.parse(routeInfo.location);

    // Handle '/'
    if (uri.pathSegments.length == 0) return RoutePath.home();

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first == "collection") {
        return RoutePath.collection([]);
      } else if (uri.pathSegments.first == "cart") {
        return RoutePath.cart();
      }
    }

    // Handle 'book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments.first == "collection") {
        List<String> tags = uri.pathSegments[1].split(",");
        return RoutePath.collection(tags);
      } else if (uri.pathSegments.first == "product") {
        String id = uri.pathSegments[1];
        print("product routing $id");
        return RoutePath.productPage(id);
      }
    }

    // Handle unknown routes
    return RoutePath.unknown();
  }

  // which is used for updating browser history for the web application. If you
  // decides to opt in, you must also overrides this method to return a route
  // information.
  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHome) {
      return RouteInformation(location: '/');
    }
    if (path.isCart) {
      return RouteInformation(location: '/cart');
    }

    if (path.isCollection) {
      if (path.tags.isEmpty) {
        return RouteInformation(location: '/collection');
      }

      String tags = path.tags.toString();
      tags = tags.substring(1, tags.length - 1);
      return RouteInformation(location: '/collection/' + tags);
    }

    if (path.isProductPage) {
      return RouteInformation(
          location: '/product/' + path.productID.toString());
    }

    return null;
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
