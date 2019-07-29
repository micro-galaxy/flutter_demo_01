import 'package:flutter/material.dart';

import 'homeComponents/banner.dart';
import 'homeComponents/iconFunction.dart';
import 'homeComponents/search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomePage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
              children: [new Search(),new MyBanner(), new IconFunction()])),
    );
  }
}
