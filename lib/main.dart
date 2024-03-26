


import 'package:bmi_buyer/provider/get_product_provider.dart';
import 'package:bmi_buyer/screen/login/login.dart';
import 'package:bmi_buyer/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [

        ChangeNotifierProvider<GetProductProvider>(
            create: (_) => GetProductProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        home: SplashScreen(),
      ),
    );
  }
}

