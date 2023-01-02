import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/widget/background_card.dart';
import 'package:netflix/presentation/home/widget/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          }),
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTitleCard(
                    title: "Released in the Past Year",
                  ),
                  kHeight,
                  MainTitleCard(
                    title: "Trending Now",
                  ),
                  kHeight,
                  NumberTitleCard(),
                  kHeight,
                  MainTitleCard(
                    title: "Tense Drama",
                  ),
                  kHeight,
                  MainTitleCard(
                    title: "South Indian Cinema",
                  ),
                  kHeight,
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Netflix-new-icon.png/800px-Netflix-new-icon.png",
                                width: 50,
                                height: 50,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                              ),
                              kWidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kWidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Tv Shows",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "Movies",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "Categories",
                                style: kHomeTitleText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : kHeight,
            ],
          ),
        );
      },
    ));
  }
}
