
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Friends",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(color: Colors.grey),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              textSize: 15,
              iconSize: 25,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              textSize: 15,
              iconSize: 25,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              textSize: 15,
              iconSize: 25,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
