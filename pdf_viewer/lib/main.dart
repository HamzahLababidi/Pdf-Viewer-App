import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pdf_viewer/screens/dashboard.dart';
import 'package:pdf_viewer/screens/login_screen.dart';
import 'package:pdf_viewer/screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(Viewti(token: prefs.getString('token')));
}

class Viewti extends StatelessWidget {
  const Viewti({super.key, required this.token});

  final token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (JwtDecoder.isExpired(token) == false) ? Dashboard(token: token) : const LoginScreen(),
    );
  }
}
