import 'package:fizook/model/auth_bag_provider.dart';
import 'package:fizook/model/booking_provider.dart';
import 'package:fizook/model/common_provider.dart';
import 'package:fizook/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthBagProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CommonProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BookingProvider(),
          )
        ],
        child: MaterialApp(
          home: LoginWidget(),
        ));
  }
}
