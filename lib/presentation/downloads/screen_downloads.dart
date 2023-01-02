import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(height: 25),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/yUgFJ3A9IwDy7KhjvIxfUTeNeXO.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jrw684BhFJZ9Jac6KJda3hSQkxt.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kHeight,
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We'll download a personalized download selection of movies and shows for you, so there's always something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(.5),
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 150, bottom: 50, top: 20),
                angle: 20,
                size: Size(
                  size.width * 0.4,
                  size.width * 0.58,
                ),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 150, bottom: 50, top: 20),
                angle: -20,
                size: Size(
                  size.width * 0.4,
                  size.width * 0.58,
                ),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 10, top: 20),
                size: Size(
                  size.width * 0.45,
                  size.width * 0.65,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: buttonColor,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: whiteColor,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: backgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kHeight,
        Icon(
          Icons.settings,
          color: whiteColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            ),
          ),
        ),
      ),
    );
  }
}
