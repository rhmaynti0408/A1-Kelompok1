import 'package:a1_1_20/screens/register.dart';
import 'package:a1_1_20/screens/user_products/user_products.dart';
import 'package:a1_1_20/screens/user_products/add_products.dart';
import 'package:a1_1_20/widgets/navigator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:a1_1_20/main%20copy.dart';
import 'package:a1_1_20/provider/theme_provider.dart';
import 'package:a1_1_20/screens/landing_page.dart';
import 'package:a1_1_20/screens/login.dart';
import 'package:provider/provider.dart';

import './screens/orders.dart';
import './provider/order_provider.dart';
// import './widgets/navigator.dart';
// import './screens/landing_page.dart';
import './provider/cart_provider.dart';
// import './provider/theme_provider.dart';
import './screens/cart.dart';
import './screens/product_details/product_details.dart';
import './provider/product_provider.dart';
import './routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/profile.dart';
import 'package:a1_1_20/cubit/auth_cubit.dart';
import 'package:a1_1_20/cubit/page_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
// import './models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _darkMode = User.darkMode;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, provider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rahmayanti Book Shop',
            routes: {
              '/': (context) => const LandingPage(),
              'register-page': ((context) => RegisterPage()),
              'login-page': (context) => LoginPage(),
              'main-page': (context) => NavigatorWidget(),
              Routes.productDetails: (context) => const ProductDetails(),
              Routes.cartScreen: (context) => const CartScreen(),
              Routes.orderScreen: (context) => const OrderScreen(),
              Routes.profile: (context) => const Profile(),
              Routes.userProduct: (context) => const UserProductsScreen(),
              Routes.addUserProduct: (context) => const AddUserProduct(),
              Routes.landingPage: (context) => const LandingPage(),
            },
            theme: Provider.of<ThemeProvider>(context).currentTheme,
          ),
        ),
      ),
    );
  }
}
