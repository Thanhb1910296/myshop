import 'package:flutter/material.dart';
import 'ui/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const OrdersScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductScreen.routeName: (ctx) => const UserProductScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId),
                );
              },
            );
          }
          return null;
        },
      ),
    );
    // return MaterialApp(
    //   title: 'My Shop',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     fontFamily: 'Lato',
    //     colorScheme: ColorScheme.fromSwatch(
    //       primarySwatch: Colors.purple,
    //     ).copyWith(
    //       secondary: Colors.deepOrange,
    //     ),
    //   ),
    //   routes: {
    //     CartScreen.routeName: (ctx) => const CartScreen(),
    //     OrdersScreen.routeName: (ctx) => const OrdersScreen(),
    //     UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
    //   },
    //   home: const ProductsOverviewScreen(),
    //   onGenerateRoute: (settings) {
    //     if (settings.name == ProductDetailScreen.routeName) {
    //       final productId = settings.arguments as String;
    //       return MaterialPageRoute(
    //         builder: (ctx) {
    //           return ProductDetailScreen(
    //             ProductsManager().findById(productId),
    //           );
    //         },
    //       );
    //     }
    //     return null;
    //   },
  }
}