// Packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final List<String> _imageUrls = [
    "https://cdn.pixabay.com/photo/2016/03/09/16/47/desert-1246842_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/03/09/15/29/workplace-1246677_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/03/09/15/28/gras-1246662_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/04/27/22/53/man-742766_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/02/19/03/31/man-641691_960_720.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: _imageUrls
                  .map((imageURL) => Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Image.network(imageURL),
                        );
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
