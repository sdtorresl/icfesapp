import 'package:icfesapp/common/onboarding1.dart';
import 'package:flutter/material.dart';
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
              Onboarding(
                icon: Icons.clear,
                title: 'Consulta todo sobre el evento',
                description:
                    'Disfruta de la nueva plataforma que te ayudara a crecer',
                picture: 'assets/img/Bitmap.png',
              ),
              Onboarding(
                icon: Icons.clear,
                title: 'Tu espacio virtual',
                description:
                    'Conectate y observa el evento a través de tu celular',
                picture: 'assets/img/Bitmap2.png',
              ),
              Onboarding(
                icon: Icons.clear,
                title: 'Comparte en redes',
                description: 'Participa y comparte en redes sociales',
                picture: 'assets/img/Bitmap3.png',
              ),
            ],
          );
        },
      ),
    );
  }
}
