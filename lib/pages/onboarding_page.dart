import 'package:icfesapp/common/onboarding1.dart';
import 'package:icfesapp/common/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:icfesapp/common/onboarding3.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                // autoPlay: false,
              ),
              items: [
                Onboarding1(),
                Onboarding2(),
                Onboarding3(),
              ]);
        },
      ),
    );
  }
}
