import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:icfesapp/common/onboarding1.dart';
import 'package:icfesapp/pages/home_page.dart';

final List<String> imgList = [
  '1',
  '2',
  '3',
];

class OnboardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnboardingPageState();
  }
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              alignment: Alignment.bottomRight,
              height: 30,
              child: FloatingActionButton(
                elevation: 5.0,
                child: Icon(
                  Icons.clear,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }),
                  );
                },
              ),
            ),
          ),
          CarouselSlider(
            items: [
              Onboarding(
                title: 'Consulta todo sobre el evento',
                description:
                    'Disfruta de la nueva plataforma que te ayudara a crecer',
                picture: 'assets/img/Bitmap.png',
              ),
              Onboarding(
                title: 'Tu espacio virtual',
                description:
                    'Conectate y observa el evento a través de tu celular',
                picture: 'assets/img/Bitmap2.png',
              ),
              Onboarding(
                title: 'Comparte en redes',
                description: 'Participa y comparte en redes sociales',
                picture: 'assets/img/Bitmap3.png',
              ),
            ],
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                aspectRatio: 0.9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: imgList.map((item) {
              int index = imgList.indexOf(item);
              return Container(
                width: 15.0,
                height: 15.0,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(255, 0, 128, 0.9)
                      : Color.fromRGBO(255, 0, 111, 0.5),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Container(
            width: 60,
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                FloatingActionButton(
                  elevation: 5.0,
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  onPressed: _current == imgList.length.bitLength
                      ? () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            ),
                          }
                      : () => _controller.nextPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
