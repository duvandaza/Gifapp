import 'package:flutter/material.dart';
import 'package:gifapp/pages/home_page.dart';
import 'package:gifapp/services/gifs_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => GifsService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifs App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => const HomePage(),
      },
      
    );
  }
}