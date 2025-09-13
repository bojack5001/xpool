import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xpool/Screens/register_screen.dart';
import 'package:xpool/infoHandler/app_info.dart';
import 'package:xpool/splashScreen/splash_screen.dart';
import 'package:xpool/themeprovider/theme_provider.dart';
import 'package:xpool/widgets/pay_fare_amount_dialog.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'xpool',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner:false ,
        home: splashscreen(),
      ),
    );
  }
}
