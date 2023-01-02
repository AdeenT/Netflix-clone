import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/lmf0zzR7ritjOL3qumRh3hfvOFK.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: -30,
            left: 13,
            child: BorderedText(
              strokeWidth: 5.0,
              strokeColor: whiteColor,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: backgroundColor,
                ),
              ),
            )),
      ],
    );
  }
}
