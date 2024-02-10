import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future routeToSearch() async {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushNamedAndRemoveUntil(context, '/Landing', (route) => false);
      Navigator.pushReplacementNamed(context, '/search');
    });
  }

  @override
  void initState() {
    super.initState();
    routeToSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/splash.png'),
      ),
    );
  }
}
