import 'package:dead/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
      context,
      width: size.width,
      height: size.height,
      allowFontScaling: true,
    );
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Image.asset(
          'assets/images/splash.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
